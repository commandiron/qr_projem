import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/cubit/auth_cubit.dart';
import '../domain/cubit/auth_state.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const route = "/authentication";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: const AuthChild()
    );
  }
}

class AuthChild extends StatelessWidget {
  const AuthChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
              children: [
                CurrentPage(
                  pages: state.pages,
                  pageIndex: state.pageIndex
                ),
              ],
            );
        },
      )
    );
  }
}

class CurrentPage extends StatelessWidget {
  const CurrentPage({required this.pages, required this.pageIndex, Key? key}) : super(key: key);

  final List<PageItem> pages;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          duration: const Duration(milliseconds: 600),
          child: pages[pageIndex].page
      ),
    );
  }
}
