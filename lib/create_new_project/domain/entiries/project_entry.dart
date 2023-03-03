import 'apartment_entry.dart';

class ProjectEntry {
  String? templateVersion;
  String? companyLogoUrl;
  int? primaryColorValue;
  String? companyPhone;
  String? companyMail;
  String? companyAddress;
  String? companyLocationUrl;
  List<String>? enabledPageRoutes;
  String? name;
  String? locationUrl;
  List<String>? generalImageUrls;
  List<ApartmentEntry>? apartmentEntries;
  DateTime? startDate;
  DateTime? estimatedFinishDate;
  List<String>? features;

  ProjectEntry(
    {
      this.templateVersion,
      this.companyLogoUrl,
      this.primaryColorValue,
      this.companyPhone,
      this.companyMail,
      this.companyAddress,
      this.companyLocationUrl,
      this.enabledPageRoutes,
      this.name,
      this.locationUrl,
      this.generalImageUrls,
      this.apartmentEntries,
      this.startDate,
      this.estimatedFinishDate,
      this.features
    }
  );

  ProjectEntry copyWith(
      {
        String? templateVersion,
        String? companyLogoUrl,
        int? primaryColorValue,
        String? companyPhone,
        String? companyMail,
        String? companyAddress,
        String? companyLocationUrl,
        List<String>? enabledPageRoutes,
        String? name,
        String? locationUrl,
        List<String>? generalImageUrls,
        List<ApartmentEntry>? apartmentEntries,
        DateTime? startDate,
        DateTime? estimatedFinishDate,
        List<String>? features,
      }
      ) {
    return ProjectEntry(
      templateVersion: templateVersion ?? this.templateVersion,
      companyLogoUrl: companyLogoUrl ?? this.companyLogoUrl,
      primaryColorValue: primaryColorValue ?? this.primaryColorValue,
      companyPhone: companyPhone ?? this.companyPhone,
      companyMail: companyMail ?? this.companyMail,
      companyAddress: companyAddress ?? this.companyAddress,
      companyLocationUrl: companyLocationUrl ?? this.companyLocationUrl,
      enabledPageRoutes: enabledPageRoutes ?? this.enabledPageRoutes,
      name: name ?? this.name,
      locationUrl: locationUrl ?? this.locationUrl,
      generalImageUrls: generalImageUrls ?? this.generalImageUrls,
      apartmentEntries: apartmentEntries ?? this.apartmentEntries,
      startDate: startDate ?? this.startDate,
      estimatedFinishDate: estimatedFinishDate ?? this.estimatedFinishDate,
      features: features ?? this.features
    );
  }
}