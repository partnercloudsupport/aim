

// http base urls
class Host{
  static final String AIM = 'http://10.0.0.7:9002';
  static final String ALM = 'http://10.0.0.7:9004';
}


// http urls
class Url{
  static String news_detail(code){
    return Host.ALM+'/news/detail/$code';
  }
}
