class Family {
  String id;
  String name;
  int cantidad;

  Family({required this.id, required this.name, required this.cantidad});

  factory Family.fromMap(Map<String, dynamic> obj) =>
      Family(id: obj['id'], name: obj['name'], cantidad: obj['cantidad']);
}
