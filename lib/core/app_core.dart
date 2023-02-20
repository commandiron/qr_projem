import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';

import '../admin/presentation/admin_screen.dart';
import '../auth/presentation/auth_screen.dart';
import '../profile/presentation/profile_screen.dart';
import 'presentation/config/app_config.dart';
import '../home/presentation/home_screen.dart';
import 'domain/cubit/core/core_state.dart';
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
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    await BlocProvider.of<CoreCubit>(context, listen: false).getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Qr Projem',
          initialRoute: AdminScreen.route,
          routes: {
            AdminScreen.route: (context) {
              return const AdminScreen();
            },
            HomeScreen.route: (context) {
              return const HomeScreen();
            },
            AuthScreen.route: (context) {
              return const AuthScreen();
            },
            ProfileScreen.route: (context) {
              return const ProfileScreen();
            },
          },
        );
      },
    );
  }
}

