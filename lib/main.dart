import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:weightburner_119/assessment/hive_data_profil/hive_data.dart';
import 'package:weightburner_119/assessment/hive_data_profil/hive_data_box.dart';
import 'package:weightburner_119/burner/burner_local_model.dart';
import 'package:weightburner_119/challenges/logic/cubit/challenges_cubit.dart';
import 'package:weightburner_119/challenges/logic/model/challenges_hive_model.dart';
import 'package:weightburner_119/challenges/logic/repositories/challenges_repo.dart';
import 'package:weightburner_119/core/urls.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/scanner/hive_scanner/hive_scanner.dart';
import 'package:weightburner_119/scanner/hive_scanner/hive_scanner_box.dart';
import 'package:weightburner_119/splash/splash_screen.dart';
import 'package:apphud/apphud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.initialize(DocFF.signalchik);
  await OneSignal.Notifications.requestPermission(true);
  await Hive.initFlutter();
  Hive.registerAdapter(HiveDataAdapter());
  Hive.registerAdapter(HiveScannerAdapter());
  Hive.registerAdapter(ChallengesContentAdapter());
  Hive.registerAdapter(BurnerLocalModelAdapter());
  hiveDataProfile = await Hive.openBox<HiveData>('box');
  hiveScanner = await Hive.openBox<HiveScanner>('boxScanner');
  runApp(const MyApp());
   await Apphud.start(apiKey: DocFF.poawjfncs);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocProvider(
        create: (context) => ChallengesCubit(ChallengesRepoImpl()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Inter',
          home: child,
          theme: ThemeData(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: WbColors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: WbColors.white,
            ),
          ),
        ),
      ),
      child: const SplashScreenYTvabcas(),
    );
  }
}
