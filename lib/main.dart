import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './mainDrawer.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("BOTAŞ Müşteri Portalı"),
        backgroundColor: Color(0xFFF44336),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    width: 350,
                    height: 170,
                    child: Image.asset('asset/images/botas_fotograf.webp')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-posta',
                    hintText: 'Lütfen e-posta adresinizi giriniz'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 25, bottom: 0),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifre',
                    hintText: 'Lütfen şifrenizi giriniz'),
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: (){
              },
              child: Text(
                'Şifremi Unuttum?',
                style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 60,
              width: 250,
              margin: EdgeInsets.only(
                top: 1,
                bottom: 10,

              ),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              // ignore: deprecated_member_use
              child: FlatButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Giriş',
                  style: TextStyle(color: Colors.white, fontSize: 25, ),),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text('Hesabınız yok mu? Hesap oluşturun',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  homePage() {}
}

class SecondScreen extends StatefulWidget {
  final Widget child;

  SecondScreen({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SecondScreen> {
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    /*   var data1 = [
      new Pollution(1980, '1.Hafta', 60),
      new Pollution(1980, '2.Hafta', 40),
      new Pollution(1980, '3.Hafta', 90),
      new Pollution(1980, '4.hafta', 50),
    ];
  */  var data2 = [
      new Pollution('asd', 190, 'Ocak', 190, 37500),
      new Pollution('def', 160, 'Şubat', 167, 32000),
      new Pollution('fed', 130, 'Mart', 132, 24750),
      new Pollution('gef', 90, 'Nisan', 95, 17500),
      new Pollution('sad', 50, 'Mayıs', 53, 9250),
      new Pollution('das', 40, 'Haziran', 40, 7500),
    ];
    /*   var data3 = [
      new Pollution(1985, '1.Hafta', 210),
      new Pollution(1980, '2.Hafta', 230),
      new Pollution(1985, '3.Hafta', 110),
      new Pollution(1980, '4.hafta', 0),
    ];
      var data4 = [
      new Pollution(1985, '1.Hafta', 180),
      new Pollution(1980, '2.Hafta', 160),
      new Pollution(1985, '3.Hafta', 100),
      new Pollution(1980, '4.hafta', 0),
    ];
 */
    var piedata = [
      new Task('Ocak', 17, Color(0xFFF44336)),
      new Task('Şubat', 15, Color(0xFFF06292)),
      new Task('Mart', 10, Color(0xFFFFAB91)),
      new Task('Nisan', 8, Color(0xFFFF9800)),
      new Task('Mayıs', 4, Color(0xFFFFC107)),
      new Task('Haziran', 2, Color(0xFFFFEB3B)),
      new Task('Temmuz', 1, Color(0xFF4CAF50)),
      new Task('Ağustos', 1, Color(0xFF00BCD4)),
      new Task('Eylül', 2, Color(0xFF2196F3)),
      new Task('Ekim', 8, Color(0xFF9C27B0)),
      new Task('Kasım', 14, Color(0xFF9E9E9E)),
      new Task('Aralık', 18, Color(0xFF8D6E63)),
    ];

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    /* _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xFFF44336)),
      ),
    );
*/
    _seriesData.add(





      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',

        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xFFF44336)),
      ),
    );
/*
    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xFFF44336)),
      ),
    );
*/

    /*  _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2020',
        data: data4,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xFFF44336)),
      ),
    );
*/
    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',

      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFF4CAF50)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFF2196F3)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFFF44336)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }
  String deneme;
//  String deneme2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData();
  }
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    if (selectedDatum.isNotEmpty) {
      setState(() {
        //print(selectedDatum.first.datum.sales);
        //deneme=selectedDatum[0].datum.place.toString() + ' Ayı Kullanımınız ' + selectedDatum[0].datum.quantity.toString() + ' m³ tür.\n' + ' Faturanız ' + selectedDatum[0].datum.fatura.toString() + 'TL dir';
        //deneme = selectedDatum[0].datum.place.toString() + ' Faturanız ' + selectedDatum[0].datum.fatura.toString() + ' Türk Lirasıdır (' + selectedDatum[0].datum.quantity.toString() + 'm³)';
        deneme = selectedDatum[0].datum.place.toString() + ' Ayı (' + selectedDatum[0].datum.quantity.toString() + ' Metreküp)' + ' Faturanız ' + selectedDatum[0].datum.fatura.toString() + ' ₺ dir';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFE53935),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text('Ana Sayfa'),
          ),
          drawer: MainDrawer(),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[

                        TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                          },

                          decoration: InputDecoration(
                            //labelText: deneme2,
                            hintText: deneme,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 45.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.red, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Aylık Kullanımlarım (1000 m³ cinsinden)',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child:
                          /*charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 2),
                          ),*/
                          new charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            selectionModels: [
                              new charts.SelectionModelConfig(
                                type: charts.SelectionModelType.info,
                                changedListener: _onSelectionChanged,
                              )
                            ],
                          ),


                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Aylık Doğal Gaz Kullanım Oranlarım',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                              _seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification: charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition: charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Son 5 Yıllık Doğal Gaz Kullanımlarım',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                              _seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.ChartTitle('Üye Olduktan Sonraki Yıllar',
                                    behaviorPosition: charts.BehaviorPosition.bottom,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Kullanım (yüz bin m³ cinsinden)',
                                    behaviorPosition: charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Yaz                  Bahar                      Kış',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
                                )
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pollution {
  String place;
  String zaman;
  int year;
  int quantity;
  double fatura;

  Pollution(this.zaman, this.year, this.place, this.quantity, this.fatura);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
