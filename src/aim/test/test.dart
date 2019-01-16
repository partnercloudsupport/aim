class Item {
  int age;
  String name;

  Item({this.age, this.name});
}

void main() {
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
}