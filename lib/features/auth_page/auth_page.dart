import 'package:amazon_ui/components/config/route_config.dart';
import 'package:amazon_ui/components/config/theme_config.dart';
import 'package:amazon_ui/components/di/setup_di.dart';
import 'package:amazon_ui/features/auth_page/widgets/login_content_widget.dart';
import 'package:amazon_ui/features/auth_page/widgets/register_content_widget.dart';
import 'package:amazon_ui/store/auth_store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  late TabController tabController;
  AuthStore authStore = sl<AuthStore>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    when(
      (_) =>
          authStore.state.user.isNotEmpty && authStore.state.isLoading == false,
      () => WidgetsBinding.instance.addPostFrameCallback((_) {
        return context.go(RouterPathName.homePath);
      }),
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.primaryColor,
      body: Column(
        children: [
          Image.asset(
            "assets/images/amazon-logo-signin.png",
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TabBar(
                      controller: tabController,
                      dividerColor: Colors.transparent,
                      indicatorWeight: 3.5,
                      indicatorColor: ThemeConfig.yellow,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: ThemeConfig.yellow,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                      ),
                      labelPadding: const EdgeInsets.symmetric(vertical: 10),
                      tabs: const [
                        Tab(
                          text: "  Login  ",
                        ),
                        Tab(
                          text: "  Sign-up  ",
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        LoginContentWidget(),
                        RegisterContentWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
