class ApartmentEntry {
  String? title;
  List<String>? imageUrls;
  String? type;
  String? netArea;
  String? grossArea;

  ApartmentEntry({
    this.title,
    this.imageUrls,
    this.type,
    this.netArea,
    this.grossArea,
  });

  ApartmentEntry copyWith(
      {
        String? title,
        List<String>? imageUrls,
        String? type,
        String? netArea,
        String? grossArea,
      }
      ) {
    return ApartmentEntry(
      title: title ?? this.title,
      imageUrls: imageUrls ?? this.imageUrls,
      type: type ?? this.type,
      netArea: netArea ?? this.netArea,
      grossArea: grossArea ?? this.grossArea,
    );
  }
}