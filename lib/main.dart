import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ja', 'JA'),
          Locale('ko', 'KO'),
        ],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        title: Text(widget.title),
      ),
      body:  Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  child: Center(
                child: const Text('welcome').tr(),
              )),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale('en', 'US'));
                    },
                    child: const Text('en'),
                  )),
                  const SizedBox(
                    width: 3,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale('ko', 'KO'));
                    },
                    child: const Text('ko'),
                  )),
                  const SizedBox(
                    width: 3,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale('ja', 'JA'));
                    },
                    child: const Text('ja'),
                  )),
                ],
              )
            ],
          ),
        )
    );
  }
}
