import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progressive_time_picker/painters/picker_painter.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ClockTimeFormat _clockTimeFormat = ClockTimeFormat.twentyFourHours;

  PickedTime _initialTime = PickedTime(h: 0, m: 0);
  PickedTime _pickedTime = PickedTime(h: 8, m: 0);
  PickedTime _intervalTime = PickedTime(h: 0, m: 0);

  void _updateLabels(PickedTime init, PickedTime end, bool? isDisableRange) {
    setState(() {
      _pickedTime = end;
      _intervalTime = PickedTime(h: 0, m: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("P O D O M O R O"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.history),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimePicker(
              initTime: _initialTime,
              endTime: _pickedTime,
              height: 260.0,
              width: 260.0,
              onSelectionChange: _updateLabels,
              onSelectionEnd: (a, b, c) => print(
                  'onSelectionEnd => init : ${a.h}:${a.m}, end : ${b.h}:${b.m}'),
              decoration: TimePickerDecoration(
                baseColor: Color(0xFFD9D9D9),
                pickerBaseCirclePadding: 0.0,
                sweepDecoration: TimePickerSweepDecoration(
                  pickerStrokeWidth: 30.0,
                  pickerColor: Color(0xFF490C95),
                  showConnector: true,
                ),
                initHandlerDecoration: TimePickerHandlerDecoration(
                  color: Color(0xFF490C95),
                  shape: BoxShape.circle,
                  radius: 12.0,
                ),
                endHandlerDecoration: TimePickerHandlerDecoration(
                  color: Color(0xFF141925),
                  shape: BoxShape.circle,
                  radius: 20.0,
                  useRoundedPickerCap: true
                ),
                clockNumberDecoration: TimePickerClockNumberDecoration(
                  defaultTextColor: Colors.white,
                  defaultFontSize: 12.0,
                  scaleFactor: 2.0,
                  showNumberIndicators: true,
                  clockTimeFormat: _clockTimeFormat,
                ),
              ),
              child: Center(child: Text(((((_pickedTime.h)*60 + _pickedTime.m) * 120)/1440).toStringAsFixed(0), style: GoogleFonts.roboto(fontSize: 64),)),
            ),

            SizedBox(width: 160, height: 80, child: FilledButton(style: ButtonStyle(backgroundColor: WidgetStateProperty.all(
              Color(0xFF490C95),
            ),),onPressed: (){}, child: Text("Start", style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),),)),
          ],
        ),
      ),
    );
  }
}
