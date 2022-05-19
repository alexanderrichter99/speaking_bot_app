import 'package:flutter/material.dart';
import 'package:speaking_bot_app/widgets/service_widget.dart';

class ToggleButtonEile extends StatefulWidget {
  const ToggleButtonEile({Key? key}) : super(key: key);

  @override
  _ToggleButtonEileState createState() => _ToggleButtonEileState();
}

class _ToggleButtonEileState extends State<ToggleButtonEile> {
  List<bool> isSelected = [false, true];

  @override
  Widget build(BuildContext context) => Center(
        child: ToggleButtons(
          isSelected: isSelected,
          selectedColor: Colors.white,
          color: Colors.black,
          fillColor: Colors.red.shade600,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('EILE', style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('Nicht in EILE', style: TextStyle(fontSize: 18)),
            ),
          ],
          onPressed: (int newIndex) {
            setState(() {
              for (int index = 0; index < isSelected.length; index++) {
                if (index == newIndex) {
                  isSelected[index] = true;
                } else {
                  isSelected[index] = false;
                }
              }
            });

            ServiceWidget.of(context)?.coreService.setEile =
                newIndex == 0 ? true : false;
          },
        ),
      );
}
