import 'package:flutter/material.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  ClockTimeFormat _clockTimeFormat = ClockTimeFormat.twentyFourHours;

  PickedTime _initialTime = PickedTime(h: 0, m: 0);
  PickedTime _pickedTime = PickedTime(h: 8, m: 0);
  PickedTime _intervalTime = PickedTime(h: 0, m: 0);

  PickedTime pickedTime = PickedTime(h: 2, m: 0);

  void _updateLabels(PickedTime init, PickedTime end, bool? isDisableRange) {
    setState(() {
      pickedTime = end;
    });
  }

  @override
  void initState() {
    super.initState();
    _intervalTime = formatIntervalTime(
        init: _initialTime, end: _pickedTime, clockTimeFormat: _clockTimeFormat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text("P O D O M O R O", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimePicker(
              initTime: _initialTime,
              endTime: pickedTime,
              height: 260.0,
              width: 260.0,
              primarySectors: _clockTimeFormat.value,
              secondarySectors: _clockTimeFormat.value * 2,
              onSelectionChange: _updateLabels,
              isInitHandlerSelectable: false,
              isSelectableHandlerMoveAble: false,
              onSelectionEnd: (a, b, c) => print('onSelectionEnd => init : ${a.h}:${a.m}, end : ${b.h}:${b.m}'),
              decoration: TimePickerDecoration(
                baseColor: Colors.purple[900]!,
                pickerBaseCirclePadding: 15.0,
                sweepDecoration: TimePickerSweepDecoration(
                  pickerStrokeWidth: 30.0,
                  pickerColor: Colors.purple,
                  showConnector: true,
                ),
                initHandlerDecoration: TimePickerHandlerDecoration(
                  color: Color(0xFF141925),
                  shape: BoxShape.circle,
                  radius: 12.0,
                  icon: Icon(
                    Icons.power_settings_new_outlined,
                    size: 20.0,
                    color: Color(0xFF3CDAF7),
                  ),
                ),
                endHandlerDecoration: TimePickerHandlerDecoration(
                  color: Color(0xFF141925),
                  shape: BoxShape.circle,
                  radius: 12.0,
                ),
                primarySectorsDecoration: TimePickerSectorDecoration(
                  color: Colors.white,
                  width: 1.0,
                  size: 4.0,
                  radiusPadding: 25.0,
                ),
                secondarySectorsDecoration: TimePickerSectorDecoration(
                  color: Color(0xFF3CDAF7),
                  width: 1.0,
                  size: 2.0,
                  radiusPadding: 25.0,
                ),
                clockNumberDecoration: TimePickerClockNumberDecoration(
                  defaultTextColor: Colors.white,
                  defaultFontSize: 12.0,
                  scaleFactor: 2.0,
                  showNumberIndicators: true,
                  clockTimeFormat: _clockTimeFormat,
                ),
              ),
              child: Center(child: Text(((((pickedTime.h)*60 + pickedTime.m) * 120)/1440).toStringAsFixed(0))),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Start"))
          ],
        ),
      ),
    );
  }
}
