import 'dart:typed_data';

class ApartmentEntry {
  List<Uint8List>? images;
  String? title;
  String? type;
  String? netArea;

  ApartmentEntry({
    this.images,
    this.title,
    this.type,
    this.netArea,
  });

  ApartmentEntry copyWith(
    {
      List<Uint8List>? images,
      String? title,
      String? type,
      String? netArea,
    }
  ) {
    return ApartmentEntry(
      images: images ?? this.images,
      title: title ?? this.title,
      type: type ?? this.type,
      netArea: netArea ?? this.netArea,
    );
  }
}