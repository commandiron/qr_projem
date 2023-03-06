import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../auth/presentation/auth_screen.dart';
import '../../../../../core/domain/cubit/core/core_cubit.dart';
import '../../../../../core/presentation/config/app_padding.dart';
import '../../../../../profile/presentation/profile_screen.dart';

class ZoomOnHoverImage extends StatefulWidget {
  const ZoomOnHoverImage({required this.imageAsset, Key? key}) : super(key: key);

  final String imageAsset;

  @override
  State<ZoomOnHoverImage> createState() => _ZoomOnHoverImageState();
}

class _ZoomOnHoverImageState extends State<ZoomOnHoverImage> with SingleTickerProviderStateMixin {

  late TransformationController _controller;
  late AnimationController _animationController;
  Animation<Matrix4>? _animation;

  @override
  void initState() {
    _controller = TransformationController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200)
    )..addListener(() {
      _controller.value = _animation!.value;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: AppPadding.allS,
      child: InkWell(
        onTap: () {
          if(BlocProvider.of<CoreCubit>(context).state.isUserAuthenticated) {
            Navigator.of(context).pushNamed(ProfileScreen.route);
          } else {
            Navigator.of(context).pushNamed(AuthScreen.route);
          }
        },
        onHover: (value) {
          final start = Matrix4.identity()..scale(1);
          final zoomed = Matrix4.identity()..scale(1.2);
          if(value) {
            _animation = Matrix4Tween(
              begin: _controller.value,
              end: zoomed
            ).animate(
                CurveTween(curve: Curves.easeOut).animate(_animationController)
            );
            _animationController.forward();
          } else {
            _animation = Matrix4Tween(
                begin: start,
                end: _controller.value
            ).animate(
                CurveTween(curve: Curves.easeOut).animate(_animationController)
            );
            _animationController.reverse();
          }
        },
        child: InteractiveViewer(
          panEnabled: false,
          scaleEnabled: false,
          transformationController: _controller,
          alignment: Alignment.center,
          child: Image.asset(widget.imageAsset, fit: BoxFit.cover,)
        ),
      )
    );
  }
}
