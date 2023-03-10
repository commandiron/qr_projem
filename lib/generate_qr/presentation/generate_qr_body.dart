import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';

class GenerateQrBody extends StatelessWidget {
  const GenerateQrBody({required this.userUid, required this.projectId, Key? key}) : super(key: key);

  final String userUid;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: 769,
                alignment: Alignment.center,
                child: QrImage(
                  data: "https://virtual.demirli.tech/?uid=$userUid&projectId=$projectId",
                  version: QrVersions.auto,
                  size: 200,
                ),
              ),
              const Footer(),
              const CopyrightFooter()
            ]
          ),
        )
      ],
    );
  }
}