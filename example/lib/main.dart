import 'package:flutter/material.dart';
import 'package:mm_nrc/mm_nrc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Nrc nrc = MmNrc.splitNrc('12/YABANA(နိုင်)222015');
          print('State Code : ${nrc.stateCode}');
          print('Township Code : ${nrc.townshipCode}');
          print('Nrc Type : ${nrc.nrcType}');
          print('Nrc Number : ${nrc.nrcNo}');

          print('check nrc ${MmNrc.checkValid(enNrcString: '12/ad(N)222015')}');

          // RegExp mmRegExp = RegExp(
          // print('${nrc.stateCode} ${nrc.townshipCode}');
          var states =
              await MmNrc.getStateByStateCode(stateCode: StateCode.YANGON.code);
          // print('${states?.code} ${states?.number.mm}');

          // var township = await MmNrc.getNrcTownshipsByShortCode(
          //     shortCode: nrc.townshipCode);
          var township = await MmNrc.getNrcTownshipsByStateCode(
              stateCode: nrc.townshipCode);
          // print('${township.name.en} ${township.name.mm}');
          List<Types> types = await MmNrc.types();
          Types type=await MmNrc.getNrcTypeByName(nrcType: 'nrcType');
          // var type = await MmNrc.getNrcTypeByName(nrcType: nrc.nrcType);
          // print('${type.name.en} ${type.name.mm}');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
