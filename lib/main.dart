import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Provider/cartProvider.dart';
import 'package:ecommerce/Screen/CheckoutDetail.dart';
import 'package:ecommerce/Screen/SpleshScreen.dart';
import 'package:ecommerce/Screen/ThankyouPage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..backgroundColor = Colors.pink
    ..progressColor = Colors.pink
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskColor = Colors.pink
    ..userInteractions = false;
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => authprovider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // primaryColor: AppColors.primary,
            // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0061b0)),
            useMaterial3: true,
          ),
          home: SpleshScreen(),
          builder: EasyLoading.init(),
        ),
      );
    });
  }
}