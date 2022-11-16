import 'package:custom_paint_flutter/models/happiness.dart';
import 'package:custom_paint_flutter/pages/home.dart';
import 'package:flutter/material.dart';


class HappinessWidget extends StatefulWidget {
  const HappinessWidget({
    super.key,
    required this.happiness,
    required this.onChanged,
  });
  final Happiness happiness;
  final Function(double) onChanged;

  @override
  State<HappinessWidget> createState() => _HappinessWidgetState();
}

class _HappinessWidgetState extends State<HappinessWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: getBackColor(widget.happiness.value),
      ),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Notez votre journée',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              Expanded(
                child: Slider(
                  min: 0,
                  max: 100,
                  value: widget.happiness.value,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withOpacity(0.2),
                  onChanged: (value) {
                    setState(() {
                      widget.onChanged(value);
                    });
                  },
                ),
              ),
              const Text(
                '100',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color? getBackColor(double value) {
    int newValue = value.toInt();

    Color? newColor;
    if (newValue >= 0 && newValue < 20) {
      newColor = colorRed;
    } else if (newValue >= 20 && newValue < 40) {
      newColor = colorTeal;
    } else if (newValue >= 40 && newValue < 60) {
      newColor = colorGreen;
    } else if (newValue >= 60 && newValue < 80) {
      newColor = colorBlue;
    } else if (newValue >= 80) {
      newColor = colorViolet;
    }

    return newColor!.withOpacity(0.7);
  }
}