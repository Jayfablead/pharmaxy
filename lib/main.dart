import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Provider/cartProvider.dart';
import 'package:ecommerce/Screen/NewApi.dart';
import 'package:ecommerce/Screen/SpleshScreen.dart';
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
            primaryColor: Colors.orange,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
            useMaterial3: true,
          ),
          home: SpleshScreen(),
          builder: EasyLoading.init(),
        ),
      );
    });
  }
}
