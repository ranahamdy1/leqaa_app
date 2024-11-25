import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:leqaa_app/bloc_observer.dart';
import 'package:leqaa_app/core/helper/cache_helper.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/features/welcome/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  await Hive.initFlutter();
  var box = await Hive.openBox('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const SplashScreen(),
    );
  }
}
