import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leqaa_app/features/welcome/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:leqaa_app/core/helper/cache_helper.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/hive_test/person.dart';
import 'package:leqaa_app/hive_test/boxes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/bloc_observer.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();
  _initializeFirebase();
  await CacheHelper.init();
  await DioHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  boxPerson = await Hive.openBox<Person>('personBox');

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return  MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          home: const SplashScreen(),
        );
      },
    );
  }
}

_initializeFirebase() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}