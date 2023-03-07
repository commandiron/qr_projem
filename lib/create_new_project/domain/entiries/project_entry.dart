import 'dart:typed_data';

import 'apartment_entry.dart';

class ProjectEntry {
  String? name;
  DateTime? startTime;
  DateTime? estimatedFinishTime;
  String? companyPhone;
  String? companyMail;
  String? companyAddress;
  String? companyLocationUrl;
  Uint8List? companyLogo;
  List<Uint8List>? projectImages;
  List<ApartmentEntry>? apartments;

  ProjectEntry({
    this.name,
    this.startTime,
    this.estimatedFinishTime,
    this.companyPhone,
    this.companyMail,
    this.companyAddress,
    this.companyLocationUrl,
    this.companyLogo,
    this.projectImages,
    this.apartments,
  });

  ProjectEntry copyWith(
    {
      String? name,
      DateTime? startTime,
      DateTime? estimatedFinishTime,
      String? companyPhone,
      String? companyMail,
      String? companyAddress,
      String? companyLocationUrl,
      Uint8List? companyLogo,
      List<Uint8List>? projectImages,
      List<ApartmentEntry>? apartments,
    }
  ) {
    return ProjectEntry(
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      estimatedFinishTime: estimatedFinishTime ?? this.estimatedFinishTime,
      companyPhone: companyPhone ?? this.companyPhone,
      companyMail: companyMail ?? this.companyMail,
      companyAddress: companyAddress ?? this.companyAddress,
      companyLocationUrl: companyLocationUrl ?? this.companyLocationUrl,
      companyLogo: companyLogo ?? this.companyLogo,
      projectImages: projectImages ?? this.projectImages,
      apartments: apartments ?? this.apartments
    );
  }
}