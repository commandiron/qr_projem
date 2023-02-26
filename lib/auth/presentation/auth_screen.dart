import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/data/repositories/auth_repository.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:qr_projem/profile/presentation/profile_screen.dart';
import '../../core/domain/cubit/core/core_state.dart';
import '../domain/cubit/auth_cubit.dart';
import 'auth_body.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({required this.authRepository, Key? key}) : super(key: key);

  static const route = "/auth";
  final AuthRepository authRepository;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  void initState() {
    BlocProvider.of<CoreCubit>(context, listen: false).getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final initialPage = ModalRoute
        .of(context)!
        .settings
        .arguments as int?;

    return BlocListener<CoreCubit, CoreState>(
      listener: (context, state) {
        if(state.isUserAuthenticated) {
          Navigator.of(context).pushNamed(ProfileScreen.route);
        }
      },
      child: BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(widget.authRepository, initialPage),
        child: const Scaffold(
          appBar: CustomAppBar(),
          body: AuthBody(),
        ),
      ),
    );
  }
}
