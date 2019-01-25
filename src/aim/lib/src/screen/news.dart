import 'package:flutter/material.dart';

import '../model/news.dart';
import '../remote/service.dart';

import '../widget/news.dart';
import '../widget/loader.dart';
import '../widget/indicator.dart';
import '../widget/web.dart';

class NewsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetLoader<ModelNewsCategories, List<ModelNewsCategory>>(
      load: () async {
        return await RemoteService.fetchNewsCategories();
      },
      converter: (result){
        return result?.items;
      },
      builder: (context, categories){
        return DefaultTabController(
          length: categories?.length??0,
          initialIndex: 0,
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: TabBar(
                    isScrollable: true,
                    tabs: categories?.map((category) {
                      return Tab(child: Text(category.name, style: TextStyle(fontSize: 16.0),),);
                    })?.toList()
                ),
              ),
              body: TabBarView(
                  children: categories?.map((category) {
                    return ListLoader<ModelNewsItem>(
                      load: (page) async{
                        var result = await RemoteService.fetchNewsItems(category.code, page);
                        return result?.items;
                      },
                      builder: (context, item){
                        return NewsListItemWidget(
                          item: item,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){return WebPage(title: item?.title, url: item?.url);}));
                          },
                        );
                      },
                    );
                  })?.toList()
              )
          )
        );
      },
      failed: (context, msg, retry) {
        return Scaffold(
          appBar: AppBar(),
          body: FailureIndicator(msg: msg, retry: retry),
        );
      },
      loading: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: LoadingIndicator(),
        );
      },
    );
  }
}
