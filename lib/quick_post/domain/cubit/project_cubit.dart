import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/quick_post/domain/cubit/project_state.dart';

import '../../data/repository/project_repository_impl.dart';
import '../model/project.dart';
import '../repository/project_repository.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectInitial());

  final ProjectRepository _projectRepository = ProjectRepositoryImpl();

  void quickPost(String id) {
    _projectRepository.quickPost(
      projects.firstWhere(
        (project) => project.id == id
      )
    );
  }

  static List<Project> projects = [
    Project(
      id: "0",
      companyLogoPath: "assets/id0/demirli_ins_logo.png",
      primaryColorValue: 0xff137CC0,
      companyPhone: "+902163300300",
      companyMail: "info@demirli.com.tr",
      companyAddress:
      "Yıldızbakkal Taşköprü Cad. Demirli İş Merkezi Kadıköy - İSTANBUL",
      companyLocationUrl: "https://goo.gl/maps/pUvD8P7sWb4NzitK7",
      enabledPageRoutes: [
        "overview",
        "plans",
        "project_info",
        "ar",
      ],
      name: "Suadiye | Oran Apartmanı",
      locationUrl: "https://goo.gl/maps/HJdvb8UVM1TnqSx69",
      generalImagePaths: ["assets/id0/image_1.jpg", "assets/id0/image_2.jpg"],
      apartments: [
        Apartment(
            id: 0,
            title: "8. Kat Normal Daire",
            imagePaths: ["assets/id0/image_3.jpeg"],
            type: "5+1",
            netArea: "212",
            grossArea: "268"
        ),
        // Apartment(
        //     id: 1,
        //     title: "9-10. Kat Dubleks Daire",
        //     imagePaths: ["assets/id0/image_4.jpg", "assets/id0/image_5.jpg"],
        //     type: "5+2",
        //     netArea: "376",
        //     grossArea: "475"
        // ),
      ],
      startDate: DateTime(2022, 10, 7),
      estimatedFinishDate: DateTime(2023, 12, 7),
      features: [
        "C40 Beton",
        "Kayalık Zemin",
        "Akıllı Ev",
        "Deniz Manzarası",
        "Önü Kapanmaz Konum",
        "2 Adet + Misafir Otoparkı",
        "Prekast Cephe",
        "Ferforje Korkuluk",
        "Giyotin Balkon",
        "Yerden Isıtma",
        "Lamine Parke",
        "Tam Besleme Jeneratör",
        "Ytong Duvar",
        "Braas Çatı",
        "Lobi Tip Bina Girişi",
        "Görüntülü - Kameralı Diafon",
        "Kameralı Güvenlik Sistemi",
        "Aydınlatma Kontrolü",
        "Panjur Kontrolü",
        "Zip Perde Kontrolü",
        "Gaz Kaçağı Güvenliği",
        "Su Baskını Güvenliği",
        "Yangın Güvenliği",
      ],
    ),
  ];
}
