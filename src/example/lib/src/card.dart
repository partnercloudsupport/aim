import 'package:flutter/material.dart';
import 'common.dart';
import 'scaffold_page.dart';



class CardExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('normal card', _NormalCard()),
    Example('news item card', _NewsItemsPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Examples'),
      ),
      body: ListView.builder(
        itemCount: _examples.length,
        itemBuilder: (context, index) {
          return RaisedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>_examples[index].widget));
            },
            child: Text(_examples[index].name),
            padding: EdgeInsets.all(4.0),
          );
        },
      ),
    );
  }
}


class _NormalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'normal',
      child: Container(
        alignment: Alignment.center,
        child: Card(
          color: Colors.red,
          elevation: 10,
          child: Container(
            height: 100.0,
            width: double.infinity,
            child: Center(
              child: Text(
                  'i am a card'
              ),
            )
          )
        ),
      )
    );
  }
}


class _NewsItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
        title: 'normal',
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            switch(index%3){
              case 0:
                return _NewsItemWithNoImage();
              case 1:
                return _NewsItemWithOneImage();
              case 2:
                return _NewsItemWithThreeImage();
            }
          },
        ),
    );
  }
}


class _NewsItemWithNoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      color: Colors.white,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 2.0),
      padding: EdgeInsets.all(5.0),
      child: Container(
        //height: 110.0,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  '中国银行间市场交易商协会29日公告，永泰能源作为债务融资工具发行人，在债务融资工具存续期间存在违反银行间市场相关',
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    //fontWeight: FontWeight.w400
                  ),
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  '中国日报 · 2018-01-21',
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.0,
                    //fontWeight: FontWeight.w400
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _NewsItemWithOneImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 2.0),
      padding: EdgeInsets.all(5.0),
      child: Container(
        //height: 120.0,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  height: 110.0,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            '中国银行间市场交易商协会29日公告，永泰能源作为债务融资工具发行人，在债务融资工具存续期间存在违反银行间市场相关',
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              //fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            '中国日报 · 2018-01-21',
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12.0,
                              //fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  //height: 110.0,
                  width: double.infinity,
                  padding: EdgeInsets.all(1.0),
                  alignment: Alignment.center,
                  child: Image.network(
                    'https://z1.dfcfw.com/2018/12/28/201812280938381429494801.jpg',
                    //height: 100.0,
                    //width: 130.0,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

class _NewsItemWithThreeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 180.0,
      color: Colors.white,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 2.0),
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              '中国银行间市场交易商协会29日公告，永泰能源作为债务融资工具发行人，在债务融资工具存续期间存在违反银行间市场相关',
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                //fontWeight: FontWeight.w400
              ),
            ),
          ),
          Container(
            //height: 100.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1.0),
                    child: Image.network(
                      'https://z1.dfcfw.com/2018/12/28/201812280938381429494801.jpg',
                      //height: 100.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1.0),
                    child: Image.network(
                      'https://z1.dfcfw.com/2018/12/28/201812280938381429494801.jpg',
                      //height: 100.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1.0),
                    child: Image.network(
                      'https://z1.dfcfw.com/2018/12/28/201812280938381429494801.jpg',
                      //height: 100.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              '中国日报 · 2018-01-21',
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12.0,
                //fontWeight: FontWeight.w400
              ),
            ),
          ),
        ],
      ),
    );
  }
}