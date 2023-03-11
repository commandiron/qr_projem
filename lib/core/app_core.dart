import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/data/repositories/auth_repository.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';
import 'package:qr_projem/core/presentation/config/app_theme.dart';
import 'package:qr_projem/create_new_project/presentation/create_new_project_screen.dart';
import 'package:qr_projem/generate_qr/presentation/generate_qr_screen.dart';

import '../admin/presentation/admin_screen.dart';
import '../auth/presentation/auth_screen.dart';
import '../select_plan/presentation/select_plan_screen.dart';
import '../profile/presentation/profile_screen.dart';
import 'presentation/config/app_config.dart';
import '../home/presentation/home_screen.dart';
import 'domain/cubit/core/core_state.dart';
import 'domain/cubit/project/project_cubit.dart';

class AppCore extends StatefulWidget {
  const AppCore({Key? key}) : super(key: key);

  @override
  State<AppCore> createState() => _AppCoreState();
}

class _AppCoreState extends State<AppCore> {

  final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);

    return MultiBlocProvider(
        providers: [
          BlocProvider<CoreCubit>(
            create: (context) => CoreCubit(_authRepository),
          ),
          BlocProvider<ProjectCubit>(
            create: (context) => ProjectCubit(),
          ),
        ],
        child: MaterialChild(authRepository: _authRepository,)
    );
  }
}

class MaterialChild extends StatelessWidget {
  const MaterialChild({required this.authRepository, Key? key}) : super(key: key);

  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Qr Projem',
          theme: themeLight,
          darkTheme: themeDark,
          initialRoute: state.isUserAuthenticated
              ? state.isUserAdmin ? AdminScreen.route : ProfileScreen.route
              : SelectPlanScreen.route,
          onGenerateRoute: (settings) {
            switch(settings.name) {
              case AdminScreen.route :
                return PageRouteBuilder(
                  settings: const RouteSettings(
                    name: AdminScreen.route
                  ),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const AdminScreen();
                  },
                );
              case HomeScreen.route :
                return PageRouteBuilder(
                  settings: const RouteSettings(
                    name: HomeScreen.route
                  ),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const HomeScreen();
                  },
                );
              case AuthScreen.route :

                final initialPage = settings.arguments as int?;

                return PageRouteBuilder(
                  settings: RouteSettings(
                    name: AuthScreen.route,
                    arguments: initialPage
                  ),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return AuthScreen(authRepository: authRepository);
                  },
                );
              case ProfileScreen.route :
                return PageRouteBuilder(
                  settings: const RouteSettings(
                    name: ProfileScreen.route
                  ),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const ProfileScreen();
                  },
                );
              case CreateNewProjectScreen.route :
                return PageRouteBuilder(
                  settings: const RouteSettings(
                      name: CreateNewProjectScreen.route
                  ),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const CreateNewProjectScreen();
                  },
                );
              case SelectPlanScreen.route :

                final projectId = settings.arguments as String?;

                return PageRouteBuilder(
                  settings: RouteSettings(
                    name: SelectPlanScreen.route,
                    arguments: projectId
                  ),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const SelectPlanScreen();
                  },
                );
              case GenerateQrScreen.route :

                final projectId = settings.arguments as String?;

                return PageRouteBuilder(
                  settings: RouteSettings(
                    name: GenerateQrScreen.route,
                    arguments: projectId
                  ),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const GenerateQrScreen();
                  },
                );
            }
          },
        );
      },
    );
  }
}

