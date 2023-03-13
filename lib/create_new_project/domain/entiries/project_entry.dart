import 'dart:typed_data';

import 'apartment_entry.dart';

class ProjectEntry {
  String? id;
  String? name;
  DateTime? startDate;
  DateTime? estimatedFinishDate;
  String? locationUrl;
  String? companyPhone;
  String? companyMail;
  String? companyAddress;
  String? companyLocationUrl;
  Uint8List? companyLogo;
  List<Uint8List>? projectImages;
  List<ApartmentEntry>? apartments;
  List<String>? features;

  ProjectEntry({
    this.id,
    this.name,
    this.startDate,
    this.estimatedFinishDate,
    this.locationUrl,
    this.companyPhone,
    this.companyMail,
    this.companyAddress,
    this.companyLocationUrl,
    this.companyLogo,
    this.projectImages,
    this.apartments,
    this.features
  });

  ProjectEntry copyWith(
    {
      String? id,
      String? name,
      DateTime? startDate,
      DateTime? estimatedFinishDate,
      String? locationUrl,
      String? companyPhone,
      String? companyMail,
      String? companyAddress,
      String? companyLocationUrl,
      Uint8List? companyLogo,
      List<Uint8List>? projectImages,
      List<ApartmentEntry>? apartments,
      List<String>? features
    }
  ) {
    return ProjectEntry(
      id: id ?? this.id,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      estimatedFinishDate: estimatedFinishDate ?? this.estimatedFinishDate,
      locationUrl: locationUrl ?? this.locationUrl,
      companyPhone: companyPhone ?? this.companyPhone,
      companyMail: companyMail ?? this.companyMail,
      companyAddress: companyAddress ?? this.companyAddress,
      companyLocationUrl: companyLocationUrl ?? this.companyLocationUrl,
      companyLogo: companyLogo ?? this.companyLogo,
      projectImages: projectImages ?? this.projectImages,
      apartments: apartments ?? this.apartments,
      features: features ?? this.features
    );
  }
}