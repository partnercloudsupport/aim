import 'dart:math';

import '../models.dart';

class TestData {
  static final random = Random();
  static final timenow = DateTime.now().millisecondsSinceEpoch;

  static randomTime() {
    return (timenow/1000).toInt() - random.nextInt(86400);
  }

  static final List<ModelNewsItem> newsItemsList = [
    ModelNewsItem(0, '0000', '国务院：到2025年体育竞赛表演产业总规模达到2万亿 推动产业与资本市场对接', '', ['https://z1.dfcfw.com/2018/12/21/201812210931572046519251.jpg','https://z1.dfcfw.com/2018/12/21/201812210931572046519251.jpg','http://img4.imgtn.bdimg.com/it/u=3068178955,3429143473&fm=200&gp=0.jpg'], '东方财富网', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(0, '0000', '国务院：到2025年体育竞赛表演产业总规模达到2万亿 推动产业与资本市场对接A股三大股指全线下跌：沪指跌逾1%', '', ['https://z1.dfcfw.com/2018/12/21/201812211010251310016178.jpg'], '第一财经', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(1, '0001', 'A股三大股指全线下跌：沪指跌逾1% 房地产板块领跌', '', ['https://z1.dfcfw.com/2018/12/21/20181221100552113626084.jpg'], '第一财经', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(2, '0002', '上海莱士打开跌停 此前已10连跌停', '', ['https://z1.dfcfw.com/2018/12/21/201812210931572046519251.jpg'], '第一财经', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(3, '0003', '央行公开市场本周净投放6000亿元 创11个月单周新高', '', ['https://z1.dfcfw.com/2018/12/21/20181221092115474855668.jpg'], '第一财经', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(4, '0004', '人民币中间价较上日调升111点 升幅创2018年12月13日以来最大,人民币中间价较上日调升111点 升幅创2018年12月13日以来最大', '', [], '第一财经', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(5, '0005', '陷业绩下滑怪圈 寒冬中的Zara、H&M等能否翻身？', '', ['https://z1.dfcfw.com/2018/12/21/201812210900311056194793.jpg',], '第一财经', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(6, '0006', '108家5年5倍股：1/3今年被腰斩 大牛股正集体陨落', '', ['https://z1.dfcfw.com/2018/12/21/20181221085623830682.jpg', 'https://z1.dfcfw.com/2018/12/21/201812210838391060646004.jpg', 'https://z1.dfcfw.com/2018/12/21/201812210838391060646004.jpg'], '第一财经', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(7, '0007', '张轩松不再担任永辉董事长：我和轩宁没有任何矛盾', '', ['https://z1.dfcfw.com/2018/12/21/201812210852132013181772.jpg'], '第一财经', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(8, '0008', '金融委：资本市场风险得到充分释放 已具备长期投资价值', '', ['https://z1.dfcfw.com/2018/12/21/201812210850251792623425.jpg'], '第一财经', 0, randomTime(), randomTime(), randomTime()),
    ModelNewsItem(9, '0009', '交通部：收费公路经营拟可超30年 公路债务主体改为地方政府', '', ['https://z1.dfcfw.com/2018/12/21/201812210846341211709905.jpg'], '第一财经', 0, randomTime(), randomTime(), randomTime()),
  ];
}
