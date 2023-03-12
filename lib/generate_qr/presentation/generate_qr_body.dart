import 'package:flutter/material.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import 'generate_qr_view.dart';

class GenerateQrBody extends StatelessWidget {
  const GenerateQrBody({required this.userUid, required this.projectId, Key? key}) : super(key: key);

  final String? userUid;
  final String? projectId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // if(userUid != null && projectId != null)
                GenerateQrView(
                  userUid: userUid,
                  projectId: projectId
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