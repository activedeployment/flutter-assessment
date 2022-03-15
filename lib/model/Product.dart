class Product{
  int id;
  String name;
  String description;
  String color;

  Product({
    this.id = 0,
    this.name = '',
    this.description = '',
    this.color = ''
  });

  int getId(){
    return id;
  }

  String getName(){
    return name;
  }

  String getDescription(){
    return description;
  }

  String getColor(){
    return color;
  }

}