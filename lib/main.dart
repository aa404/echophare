import 'package:echophare/config.dart';
import 'package:echophare/post_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echo Phare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
      supportedLocales: const [
        Locale('fr', 'FR'),
      ],
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const MyHomePage(title: 'Echo Phare'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: PostListScreen(),
    );
  }
}

String formatDate(String date) {
  final newdate = DateTime.parse(date);
  final DateFormat formatter = DateFormat.yMMMMd('fr_FR');
  return formatter.format(newdate);
}

String formatTime(String date) {
  final newdate = DateTime.parse(date);
  final DateFormat formatter = DateFormat.Hm('fr_FR');
  return formatter.format(newdate);
}
