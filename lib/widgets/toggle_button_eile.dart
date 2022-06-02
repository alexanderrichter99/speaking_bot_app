import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speaking_bot_app/states/maneuver_state.dart';
import 'package:speaking_bot_app/widgets/service_widget.dart';

class ToggleButtonEile extends StatefulWidget {
  const ToggleButtonEile({Key? key}) : super(key: key);

  @override
  _ToggleButtonEileState createState() => _ToggleButtonEileState();
}

Function(int newIndex)? onPressedConditionaly(
    bool ongoing, BuildContext context, ManeuverState maneuverState) {
  if (ongoing) {
    return null;
  } else {
    return (int newIndex) {
      maneuverState.setEile(newIndex, context);
    };
  }
}

class _ToggleButtonEileState extends State<ToggleButtonEile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ManeuverState>(
      builder: (context, maneuverState, child) {
        return Center(
          child: ToggleButtons(
            isSelected: maneuverState.isSelectedEile,
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
            onPressed: onPressedConditionaly(
                maneuverState.ongoing, context, maneuverState),
          ),
        );
      },
    );
  }
}
