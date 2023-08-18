import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:opticash/logic/cubit/app_cubit.dart';
import 'package:opticash/logic/cubit/splashCubit.dart';
import 'package:opticash/logic/hive/hive_adapter.dart';
import 'package:opticash/logic/hive/hive_db.dart';
import 'package:opticash/logic/hive/hive_usermodel_adapter.dart';
import 'package:opticash/logic/state/app_state.dart';
import 'package:opticash/models/user.dart';
import 'package:opticash/router.dart';
import 'package:opticash/router_name.dart';
import 'package:opticash/widgets/loading_overlay_widget.dart';

import 'app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<MyHiveBox>(MyHiveBoxAdapter());
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(create: (context) => AppCubit(AppState())),
          BlocProvider<SplashCubit>(create: (context) => SplashCubit(AppState(context: context))),
        ],
        child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
          return ScreenUtilInit(
              designSize: const Size(393, 845.3),
              builder: (widget, child) => LoadingOverlayWidget(
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Opticash',
                      theme: AppTheme.lightMode,
                      initialRoute: RouterName.splashName,
                      onGenerateRoute: onGenerate,
                    ),
                  ));
        }));
  }
}
