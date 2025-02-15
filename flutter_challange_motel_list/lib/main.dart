import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/motel_viewmodel.dart';
import 'views/home/home_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MotelViewModel()..fetchMoteis()),
        //create: (_) => MotelViewModel(),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Motel List App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}