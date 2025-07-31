import 'package:delivery_app/Constants/routes_factories.dart';
import 'package:delivery_app/controller/CustomController.dart';
import 'package:delivery_app/controller/categoryController.dart';
import 'package:delivery_app/controller/homeController.dart';
import 'package:delivery_app/controller/onboardController.dart';
import 'package:delivery_app/controller/signInController.dart';
import 'package:delivery_app/firebase_options.dart';
import 'package:delivery_app/view/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext? customContext = navigatorKey.currentContext;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Onboardcontroller()),
        ChangeNotifierProvider(create: (context) => CustomController()),
        ChangeNotifierProvider(create: (context) => SignInController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => Categorycontroller()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        child: MaterialApp(
          navigatorObservers: [RouteObserver()],
          onGenerateRoute: RoutesFactories.generateRoute,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const OnBoarding(),
        ),
      ),
    );
  }
}
