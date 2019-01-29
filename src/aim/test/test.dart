class Item {
  int age;
  String name;

  Item({this.age, this.name});
}

enum Tabs{a, b, c}

void main() {
  var y = {};
  print(y['xx']);
  return;


  Tabs x = Tabs.c;
  print(x.index);
  print(Tabs.values[1]);
  return;
  List<Item> items = [Item(age: 1, name: '1'), Item(age: 2, name: '2')];

  List<Item> items1 = List<Item>();
  items.forEach((item){items1.add(Item(age: item.age, name: item.name));});

  items1[0].name = '2';

  items.forEach((item) {
    print(item.name);
  });

  print('----------');

  items1.forEach((item){
    print(item.name);
  });

  Item item = Item(age: 1, name: '1');
  print(item?.name);

  List<int> eles = [1, 2, 3];
  print(eles.length>3?eles.elementAt(3):null);
  var mapeles = Map.fromIterable(eles??[]);
  print(mapeles);
}