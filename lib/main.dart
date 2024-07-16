import 'package:datn_trung/app/app_routers.dart';
import 'package:datn_trung/provider/loading_provider.dart';
import 'package:datn_trung/provider/user_provider.dart';
import 'package:datn_trung/widget/keyboard_widget.dart';
import 'package:datn_trung/widget/loading_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      builder: (context, _) {
        return Consumer<LoadingProvider>(
          builder: (context, loading, child) {
            return KeyboardDismiss(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Stack(
                  children: [
                    MaterialApp(
                      title: 'DATN',
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                        useMaterial3: false,
                      ),
                      debugShowCheckedModeBanner: false,
                      initialRoute: AppRouters.loginScreen,
                      routes: AppRouters.routes,
                    ),
                    loading.isLoading
                        ? const LoadingWidget()
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
