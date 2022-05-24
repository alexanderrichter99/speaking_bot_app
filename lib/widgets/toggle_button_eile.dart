import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/states/maneuver_state.dart';
import 'package:speaking_bot_app/widgets/service_widget.dart';

class ToggleButtonEile extends StatefulWidget {
  const ToggleButtonEile({Key? key}) : super(key: key);

  @override
  _ToggleButtonEileState createState() => _ToggleButtonEileState();
}

class _ToggleButtonEileState extends State<ToggleButtonEile> {
  List<bool> isSelected = [false, true];

  Function(int newIndex)? onPressedConditionaly(bool ongoing) {
    if (ongoing) {
      return null;
    } else {
      return (int newIndex) {
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
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ManeuverState>(
      builder: (context, value, child) {
        return Center(
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
            onPressed: onPressedConditionaly(value.ongoing),
          ),
        );
      },
    );
  }
}
