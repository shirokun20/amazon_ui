import 'package:amazon_ui/components/config/route_config.dart';
import 'package:amazon_ui/components/di/setup_di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Amazon UI with MobX',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: routerConfig,
    );
  }
}
