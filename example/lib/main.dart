import 'package:example/mm_nrc_form.dart';
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

class MyHomePage extends StatelessWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    print('##¸Build in main');
    String dropdownvalue = 'Item 1';

    // List of items in our dropdown menu
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MmNrcForm(
              items: items,
              value: dropdownvalue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Nrc nrc = MmNrc.splitNrc('12/YABANA(နိုင်)222015');
          print('State Code : ${nrc.stateCode}');
          print('Township Code : ${nrc.townshipCode}');
          print('Nrc Type : ${nrc.nrcType}');
          print('Nrc Number : ${nrc.nrcNo}');

          ///Check validation for nrc string
          print('check nrc ${MmNrc.checkValid(enNrcString: '12/ad(N)222015')}');

          ///Get state by state code
          StateDivision? state =
              await MmNrc.getStateByStateCode(stateCode: StateCode.YANGON.code);
          print('State Code : ${state?.code}');
          print('State Name : ${state?.name.en}');

          ///Get Township with stateCode
          Township township =
              await MmNrc.getNrcTownshipsByStateCode(stateCode: nrc.stateCode);
          print('Township EnName : ${township.name.en}');
          print('Township MmName : ${township.name.mm}');

          ///Get Township with township shortcode
          Township township1 = await MmNrc.getNrcTownshipsByShortCode(
              shortCode: nrc.townshipCode);
          print('Township EnName : ${township1.name.en}');
          print('Township MmName : ${township1.name.mm}');

          ///Get Types list that return `N,E,S,T,P,Y`
          List<Types> types = await MmNrc.types();
          print(types);

          ///Get Type with nrc type
          Types type = await MmNrc.getNrcTypeByName(nrcType: nrc.nrcType);
          print('Nrc Type : ${type.name.en} ${type.name.mm}');
        },
        tooltip: 'Check',
        child: const Icon(Icons.print),
      ),
    );
  }
}
