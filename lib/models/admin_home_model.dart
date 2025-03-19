class AdminHomeModel {
  String name;
  String phone;
  String cityFrom;
  String cityTo;
  String weight;
  String price;
  String address;

  AdminHomeModel({
    required this.name,
    required this.phone,
    required this.cityFrom,
    required this.cityTo,
    required this.weight,
    required this.price,
    required this.address,
  });
}

class AdminHomeModelList {
  static List<AdminHomeModel> list = [
    AdminHomeModel(
      name: 'Khalid Rao',
      phone: '03018384652',
      cityFrom: 'Sahiwal',
      cityTo: 'Faisalabad',
      weight: '0.8kg',
      price: '280',
      address: 'Nobel Town, House No: 104, Faisalabad.',
    ),
  ];
}
