import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:tops/constants/colorPallet.dart';

class ModelComponentProfile extends StatelessWidget {
  final IconData prefixIconComp;
  final String textComp;
  final IconData suffixIconComp;
  final void Function() actionTo;

  ModelComponentProfile({
    required this.prefixIconComp,
    required this.textComp,
    required this.suffixIconComp,
    required this.actionTo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return InkWell(
      onTap: actionTo,
      child: Container(
        width: _size.width * 0.9,
        height: 40,
        padding: EdgeInsets.only(top: 20),
        color: ColorPallet.whiteBasic,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 10.0,
              direction: Axis.horizontal,
              children: [
                Icon(
                  prefixIconComp,
                  size: 22,
                ),
                Text(textComp),
              ],
            ),
            Icon(
              suffixIconComp,
              color: Color.fromARGB(255, 129, 129, 129),
            ),
          ],
        ),
      ),
    );
  }
}

// Component 2 with Switch
class ModelComponentProfile2 extends StatefulWidget {
  final IconData prefixIconComp;
  final String textComp;

  ModelComponentProfile2({
    required this.prefixIconComp,
    required this.textComp,
    super.key,
  });

  @override
  State<ModelComponentProfile2> createState() => _ModelComponentProfile2State();
}

class _ModelComponentProfile2State extends State<ModelComponentProfile2> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.9,
      height: 50,
      padding: EdgeInsets.only(top: 20),
      color: ColorPallet.whiteBasic,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: 10.0,
            direction: Axis.horizontal,
            children: [
              Icon(
                widget.prefixIconComp,
                size: 22,
              ),
              Text(widget.textComp),
            ],
          ),
          FlutterSwitch(
            width: 50,
            height: 26,
            inactiveColor: Color.fromARGB(255, 203, 203, 203),
            activeColor: ColorPallet.greenPrimary,
            value: _switchValue,
            onToggle: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
