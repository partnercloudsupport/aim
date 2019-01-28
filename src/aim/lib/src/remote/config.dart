
class BaseUrl{
  //static final String AIM = 'http://10.0.0.7:9002';
  //static final String ALM = 'http://10.0.0.7:9004';
  static final String AIM = 'http://192.168.10.239:9002';
  static final String ALM = 'http://192.168.10.239:9004';
}


// http urls
class PageUrl{
  static String newsDetail(code){
    return BaseUrl.ALM+'/news/detail/$code';
  }
}

