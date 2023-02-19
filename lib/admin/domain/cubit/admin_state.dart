import '../../../core/domain/model/project.dart';

class AdminState {

  static Project projectDemirliIns = Project(
    id: "0",
    companyLogoUrl: "https://firebasestorage.googleapis.com/v0/b/qrprojem.appspot.com/o/f6c423a0-adf7-11ed-afa1-0242ac120002.png?alt=media&token=9c3e9c6f-7cb3-41c2-926b-36553b77b268",
    primaryColorValue: 0xff137CC0,
    companyPhone: "+905355085552",
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
    generalImageUrls: [
      "https://firebasestorage.googleapis.com/v0/b/qrprojem.appspot.com/o/d0f85d89-94c4-4e25-9935-697ac624a0e5.jpg?alt=media&token=b1f18dcc-7e9c-41a1-917c-0cee71fad7ad",
      "https://firebasestorage.googleapis.com/v0/b/qrprojem.appspot.com/o/78b82c9b-dac2-40a1-9dba-66dae2cc8ab0.jpg?alt=media&token=50c7eede-78b3-4d83-b6a2-ae9846fb7d38"
    ],
    apartments: [
      Apartment(
          id: 0,
          title: "8. Kat Normal Daire",
          imageUrls: ["https://firebasestorage.googleapis.com/v0/b/qrprojem.appspot.com/o/fd8b394d-7bdc-47a6-b241-50a6fea1b4e7.jpeg?alt=media&token=9df8bb3f-4cfb-4939-aa0c-ccbc30a8113b"],
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
      "Yerden Isıtma",
      "Prekast | Ferforje Cephe",
      "Rehau Doğrama",

      "Lamine Parke",
      "Özel Yapım Mutfak",
      "Villeroy & Boch Seramik",
      "Mielle Beyaz Eşya",
      "Artella Kapı",
      "Giyotin Balkon",
      "Vrf Sistem"

          "Tam Besleme Jeneratör",
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
  );
}
