import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebView extends StatefulWidget {
  final String url;
  final String scriptSrc;
  final Map<String, String> headers;
  final bool scrollBar;
  final String userAgent;
  final bool clearCache;
  final bool clearCookies;
  final bool withZoom;
  final bool withLocalUrl;
  final bool withJavascript;
  final bool withLocalStorage;
  final bool enableAppScheme;
  final bool supportMultipleWindows;
  final bool appCacheEnabled;
  final bool allowFileURLs;
  final Widget initialChild;

  final FlutterWebviewPlugin plugin = FlutterWebviewPlugin();

  WebView({
    Key key,
    @required this.url,
    this.scriptSrc,
    this.headers,
    this.withJavascript,
    this.clearCache,
    this.clearCookies,
    this.enableAppScheme,
    this.userAgent,
    this.withZoom,
    this.withLocalStorage,
    this.withLocalUrl,
    this.scrollBar,
    this.supportMultipleWindows,
    this.appCacheEnabled,
    this.initialChild,
    this.allowFileURLs,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewState();
  }
}

class _WebViewState extends State<WebView> {
  Rect _rect;
  Timer _resizeTimer;
  Widget _webView;

  String _script;
  bool _pageLoaded;
  bool _scriptLoaded;

  StreamSubscription<WebViewStateChanged> _onStateChanged;


  Future<void> _loadScript() async {
    this._scriptLoaded = false;
    if(widget.scriptSrc != null){
      try {
        http.Response resp = await http.get(widget.scriptSrc);
        this._script = resp.body;
      }catch(e){}
    }

    setState(() {
      this._scriptLoaded = true;
    });
  }

  Future<void> _evalScript() async {
    await Future.microtask((){
      if(this._script != null){
        widget.plugin.evalJavascript(this._script);
      }
    });
  }

  void _initPlugin() {
    this._pageLoaded = false;
    widget.plugin.hide();
    _onStateChanged = widget.plugin.onStateChanged.listen((WebViewStateChanged state) {
      if (state.type == WebViewState.finishLoad) {
        this._evalScript();
        widget.plugin.show();
        setState(() {
          this._pageLoaded = true;
        });
      }
      print('state change: ${state.type}, ${state.url}');
    });
  }

  void _initWebView(BuildContext context) {
    if(this._webView != null)
      return;

    this._webView = _WebViewPlaceholder(
      onRectChanged: (Rect value) {
        if (_rect == null) {
          _rect = value;
          widget.plugin.launch(
            widget.url,
            headers: widget.headers,
            withJavascript: widget.withJavascript,
            clearCache: widget.clearCache,
            clearCookies: widget.clearCookies,
            enableAppScheme: widget.enableAppScheme,
            userAgent: widget.userAgent,
            rect: _rect,
            withZoom: widget.withZoom,
            withLocalStorage: widget.withLocalStorage,
            withLocalUrl: widget.withLocalUrl,
            scrollBar: widget.scrollBar,
            supportMultipleWindows: widget.supportMultipleWindows,
            appCacheEnabled: widget.appCacheEnabled,
            allowFileURLs: widget.allowFileURLs,
          );
        } else {
          if (_rect != value) {
            _rect = value;
            _resizeTimer?.cancel();
            _resizeTimer = Timer(const Duration(milliseconds: 250), () {
              // avoid resizing to fast when build is called multiple time
              widget.plugin.resize(_rect);
            });
          }
        }
      },
      child: widget.initialChild ?? const Center(child: const CircularProgressIndicator()),
    );
  }

  @override
  void initState() {
    super.initState();
    this._initPlugin();
    this._loadScript();
  }

  @override
  void dispose() {
    _resizeTimer?.cancel();
    _onStateChanged.cancel();
    widget.plugin.close();
    widget.plugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this._initWebView(context);
    if(this._scriptLoaded){
      if(this._pageLoaded){
        this._evalScript();
      }
      return this._webView;
    } else {
      return Center(child: const CircularProgressIndicator());
    }
  }
}

class _WebViewPlaceholder extends SingleChildRenderObjectWidget {
  final ValueChanged<Rect> onRectChanged;
  const _WebViewPlaceholder({Key key, @required this.onRectChanged, Widget child,}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _WebViewPlaceholderRender(
      onRectChanged: onRectChanged,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _WebViewPlaceholderRender renderObject) {
    renderObject..onRectChanged = onRectChanged;
  }
}

class _WebViewPlaceholderRender extends RenderProxyBox {
  Rect _rect;
  ValueChanged<Rect> _callback;

  _WebViewPlaceholderRender({ RenderBox child, ValueChanged<Rect> onRectChanged,}) : _callback = onRectChanged, super(child);

  Rect get rect => _rect;

  set onRectChanged(ValueChanged<Rect> callback) {
    if (callback != _callback) {
      _callback = callback;
      notifyRect();
    }
  }

  void notifyRect() {
    if (_callback != null && _rect != null) {
      _callback(_rect);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final rect = offset & size;
    if (_rect != rect) {
      _rect = rect;
      notifyRect();
    }
  }
}
