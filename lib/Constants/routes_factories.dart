import 'package:delivery_app/Constants/appArguments.dart';
import 'package:delivery_app/Constants/app_routes.dart';
import 'package:delivery_app/Widgets/bottomNavigationBar.dart';
import 'package:delivery_app/view/AuthScreens/signIn.dart/signInScreen.dart';
import 'package:delivery_app/view/Category/category.dart';
import 'package:delivery_app/view/Favourite/favoruite.dart';
import 'package:delivery_app/view/Home/homeScreen.dart';
import 'package:delivery_app/view/Products/productsList.dart';
import 'package:delivery_app/view/checkout/checkoutScreen.dart';
import 'package:delivery_app/view/onboarding/onBoardingPage.dart';
import 'package:delivery_app/view/onboarding/onboarding.dart';
import 'package:delivery_app/view/productDetail/productDetail.dart';
import 'package:delivery_app/view/shoppingCart/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesFactories {
  static final GlobalKey<NavigatorState> onBoardingKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> signInKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> signUpKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> categoryKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> favKey = GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> productKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> bottomNavigationkey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> productListkey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shoppingCartKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> checkoutKey =
      GlobalKey<NavigatorState>();

  static const int onboardingIndex = 0;
  static const int signInIndex = 1;
  static const int signUpIndex = 2;
  static const int homeIndex = 3;
  static const int categoryIndex = 4;
  static const int favIndex = 5;
  static const int productIndex = 6;
  static const int bottomNavigationIndex = 7;
  static const int productDetailIndex = 8;

  static const int shoppingCartIndex = 9;
  static const int checkoutIndex = 10;

  static GlobalKey<NavigatorState> _currentNavigator = onBoardingKey;
  static GlobalKey<NavigatorState> get currentNavigator => _currentNavigator;

  static void updateCurrentNavigator(int currentIndex) {
    switch (currentIndex) {
      case onboardingIndex:
        _currentNavigator = onBoardingKey;
        break;
      case signInIndex:
        _currentNavigator = signInKey;
        break;
      case signUpIndex:
        _currentNavigator = signUpKey;
        break;
      case homeIndex:
        _currentNavigator = homeKey;
        break;
      case categoryIndex:
        _currentNavigator = categoryKey;
        break;
      case favIndex:
        _currentNavigator = favKey;
        break;
      case productIndex:
        _currentNavigator = productKey;
        break;
      case bottomNavigationIndex:
        _currentNavigator = bottomNavigationkey;
        break;
      case productDetailIndex:
        _currentNavigator = productListkey;
        break;
      case shoppingCartIndex:
        _currentNavigator = shoppingCartKey;
        break;
      case checkoutIndex:
        _currentNavigator = checkoutKey;
        break;
    }
  }

  static void popCurrentRouteToFirst() {
    if (currentNavigator.currentState != null) {
      currentNavigator.currentState!.popUntil((route) => route.isFirst);
    }
  }

  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.onBoard:
        return MaterialPageRoute(
          builder: (context) => OnBoarding(),
          settings: routeSettings,
        );
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
          settings: routeSettings,
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: routeSettings,
        );
      case AppRoutes.category:
        return MaterialPageRoute(
          builder: (context) => Categories(),
          settings: routeSettings,
        );
      case AppRoutes.favourite:
        return MaterialPageRoute(
          builder: (context) => Favourites(),
          settings: routeSettings,
        );
      case AppRoutes.products:
        final args = routeSettings.arguments as Map<String, dynamic>?;

        return MaterialPageRoute(
          builder: (context) => ProductsList(
            productName: args?[AppArguments.productCategory],
          ),
          settings: routeSettings,
        );
      case AppRoutes.bottomNavigation:
        final args = routeSettings.arguments as Map<String, dynamic>?;

        return MaterialPageRoute(
          builder: (context) => BottomNavigation(
            index: args?[AppArguments.index],
          ),
          settings: routeSettings,
        );
      case AppRoutes.productList:
        final args = routeSettings.arguments as Map<String, dynamic>?;

        return MaterialPageRoute(
          builder: (context) => ProductDetail(
            productName: args?[AppArguments.productName],
            price: args?[AppArguments.price],
          ),
          settings: routeSettings,
        );
      case AppRoutes.shoppingCart:
        final args = routeSettings.arguments as Map<String, dynamic>?;

        return MaterialPageRoute(
          builder: (context) => ShoppingCart(),
          settings: routeSettings,
        );
      case AppRoutes.checkOut:
        final args = routeSettings.arguments as Map<String, dynamic>?;

        return MaterialPageRoute(
          builder: (context) => CheckoutScreen(),
          settings: routeSettings,
        );
      default:
        return errorRoute;
    }
  }

  static Route get errorRoute => MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Error')),
          );
        },
      );
}
