class DailySpecial {
  final String description;
  final double price;

  DailySpecial({required this.description, required this.price});

  factory DailySpecial.fromRTDB(Map<String, dynamic> data){
    // Los interrogantes son por si el valor es nulo
    return DailySpecial(
        description: data['description'] ?? 'algún café',
        price: data['price'] ?? 0.0);
  }

  String fancyDescription(){
    return 'Hoy especial: un delicioso $description por un precio bajo ${price.toStringAsFixed(2)}';
  }
}