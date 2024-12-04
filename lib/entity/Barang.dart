import 'dart:convert';

class Barang{
  int id;
  String nama;
  String deskripsi;
  int stok;

  Barang(
    {required this.id,
    required this.nama,
    required this.deskripsi,
    required this.stok});
  
  factory Barang.fromRawJson(String str) => Barang.fromRawJson(json.decode(str));
  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
    id: json["id"],
    nama: json["nama"],
    deskripsi: json["deskripsi"],
    stok: json["stok"],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    "id":id,
    "nama": nama,
    "deskripsi": deskripsi,
    "stok": stok,
  };
}