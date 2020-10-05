import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';

class Dialer extends StatefulWidget {
  final VoidCallback onDialPressed;

  Dialer({ this.onDialPressed });
  @override
  _DialerState createState() => _DialerState();
}

class _DialerState extends State<Dialer> {
  @override
  Widget build(BuildContext context) {
    return SingleCircularSlider(
      12,
      1,
      height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width/3,
      handlerColor: Colors.black,
      handlerOutterRadius: 12.0,
      primarySectors: 10,
      sliderStrokeWidth: 8.0,
      selectionColor: Colors.black,
      showHandlerOutter: true,
      onSelectionEnd: (init, end, laps) {

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 100.0,
              icon: Icon(Icons.phone, color: Color(0xFF104C91),),
              onPressed: () => widget.onDialPressed()),
          Text('P R E S S',
          style: TextStyle(
            color: Color(0xFF104C91),
            fontSize: 22.0
          ),
          )
        ],
      ),
    );
  }
}
