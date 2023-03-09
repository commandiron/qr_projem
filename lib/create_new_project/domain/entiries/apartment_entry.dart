import 'dart:typed_data';

class ApartmentEntry {
  int id;
  List<Uint8List>? images;
  String? title;
  String? type;
  String? netArea;

  ApartmentEntry({
    required this.id,
    this.images,
    this.title,
    this.type,
    this.netArea,
  });

  ApartmentEntry copyWith(
    {
      int? id,
      List<Uint8List>? images,
      String? title,
      String? type,
      String? netArea,
    }
  ) {
    return ApartmentEntry(
      id: id ?? this.id,
      images: images ?? this.images,
      title: title ?? this.title,
      type: type ?? this.type,
      netArea: netArea ?? this.netArea,
    );
  }
}