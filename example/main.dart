import 'package:flutter/material.dart';
import 'package:lab1/src/common/constants.dart';
import 'package:lab1/src/common/custom_slider_gradient.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: DevConstants.appColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = .0;

  void _calculateCounter(double newCount) =>
      setState(() => _counter = newCount);

  void _resetCounter() => setState(() => _counter = .0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DevConstants.appTitle),
      ),
      body: Center(
        child: GridView.count(
          childAspectRatio: DevConstants.gridViewChildAspectRatio,
          crossAxisCount: DevConstants.gridViewCrossAxisCount,
          children: [
            Container(
              child: SliderTheme(
                data: SliderThemeData(
                  trackShape: GradientRectSliderTrackShape(
                    gradient: gradient,
                    darkenInactive: false,
                  ),
                ),
                child: Slider(
                  min: DevConstants.min,
                  max: DevConstants.max,
                  value: _counter,
                  onChanged: (newCount) => _calculateCounter(newCount),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      '${_counter.toStringAsFixed(1)}',
                      style: TextStyle(fontSize: DevConstants.textFontSize),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ButtonTheme(
                    minWidth: DevConstants.buttonWidth,
                    height: DevConstants.buttonHeight,
                    child: RaisedButton(
                      color: DevConstants.buttonColor,
                      shape: BeveledRectangleBorder(),
                      onPressed: _resetCounter,
                      child: DevConstants.buttonIcon,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
