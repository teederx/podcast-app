import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:podcast_app/features/presentation/pages/episodes_page/episodes_page.dart';
import 'package:podcast_app/features/presentation/pages/main_page/main_page.dart';

import 'features/data/model/episode/episode_data_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Hive.initFlutter();
  Hive.registerAdapter(EpisodeDataAdapter()); 
  await Hive.openBox('podcast');

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            theme: ThemeData.dark(
              useMaterial3: true,
            ),
            initialRoute: MainPage.routeName,
            routes: {
              MainPage.routeName: (context) => const MainPage(),
              EpisodesPage.routeName: (context) => const EpisodesPage()
            },
          );
        });
  }
}
