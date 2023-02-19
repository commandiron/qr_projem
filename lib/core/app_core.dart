import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';

import '../admin/presentation/admin_screen.dart';
import '../authentication/presentation/authentication_screen.dart';
import '../shared/config/app_config.dart';
import '../home/presentation/home_screen.dart';
import 'domain/cubit/auth/auth_cubit.dart';
import 'domain/cubit/project/project_cubit.dart';

class AppCore extends StatelessWidget {
  const AppCore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppConfig.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<CoreCubit>(
          create: (context) => CoreCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<ProjectCubit>(
          create: (context) => ProjectCubit(),
        ),
      ],
      child: const MaterialChild()
    );
  }
}

class MaterialChild extends StatefulWidget {
  const MaterialChild({Key? key}) : super(key: key);

  @override
  State<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends State<MaterialChild> {

  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context, listen: false).getFirebaseUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Projem',
      initialRoute: AuthenticationScreen.route,
      routes: {
        AdminScreen.route: (context) {
          return const AdminScreen();
        },
        HomeScreen.route: (context) {
          return const HomeScreen();
        },
        AuthenticationScreen.route: (context) {
          return const AuthenticationScreen();
        },
      },
    );
  }
}

