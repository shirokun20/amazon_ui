import 'package:amazon_ui/components/config/route_config.dart';
import 'package:amazon_ui/components/di/setup_di.dart';
import 'package:amazon_ui/store/auth_store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthStore authStore = sl<AuthStore>();

  @override
  void initState() {
    when(
      (_) => authStore.state.user.isEmpty && authStore.state.isLoading == false,
      () => context.go(RouterPathName.defaultPath),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: InkWell(
        onTap: () {
          authStore.onEvent(AuthLogoutEvent());
        },
        child: Text("Logout"),
      ),
    );
  }
}
