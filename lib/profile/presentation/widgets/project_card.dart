import 'package:flutter/material.dart';

import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';
import '../../../core/presentation/widgets/alert_dialog/under_development_alert_dialog.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.imageUrl, required this.title, required this.onQrCodeIconPressed, required this.onDeleteConfirm}) : super(key: key);

  final String imageUrl;
  final String title;
  final Function() onQrCodeIconPressed;
  final void Function() onDeleteConfirm;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            imageUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress?.expectedTotalBytes == loadingProgress?.cumulativeBytesLoaded) {
                return child;
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.75),
              padding: AppPadding.horizontalM!.add(AppPadding.verticalS!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppTextStyle.b2!.copyWith(color: Colors.white),),
                  Row(
                    children: [
                      InkWell(
                          onTap: onQrCodeIconPressed,
                          child: const Icon(Icons.qr_code_sharp, color: Colors.white,)
                      ),
                      AppSpace.horizontalM!,
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const UnderDevelopmentAlertDialog();
                            },
                          );
                        },
                        child: Icon(Icons.edit, color: Colors.white,)
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      content: Text("Silmek istediğinize emin misiniz? Bu işlem geri alınamaz!"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                            },
                            child: Text("Hayır")
                        ),
                        ElevatedButton(
                            onPressed:() {
                              Navigator.of(dialogContext).pop();
                              onDeleteConfirm();
                            },
                            child: Text("Evet")
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.delete, color: Theme.of(context).colorScheme.error,),
            ),
          )
        ],
      )
    );
  }
}
