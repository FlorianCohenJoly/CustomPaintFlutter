import 'package:flutter/material.dart';
import 'package:custom_paint_flutter/widgets/semi_circle_widget.dart';
import 'package:custom_paint_flutter/widgets/happiness_widget.dart';
import 'package:custom_paint_flutter/models/view_model.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final myData = ViewModel().hapiness;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: getBackColor(myData.value)!,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SizedBox(height: 20),
              Text(
                "Comment s'est passée votre journée ?",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 70),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 260,
                          height: 260,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SemiCircleWidget(
                          sweepAngle: myData.value * 1.8,
                          color: getSliderColor(myData.value),
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${getEmojis(myData.value)}',
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    HappinessWidget(
                      happiness: myData,
                      onChanged: (value) {
                        setState(() {
                          ViewModel().changeValue(value);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int convertToInt(double value) {
    return value.toInt();
  }

  List<Color>? getBackColor(double value) {
    int newValue = value.toInt();
    if (newValue >= 0 && newValue < 20) {
      return gradientRed;
    } else if (newValue >= 20 && newValue < 40) {
      return gradientTeal;
    } else if (newValue >= 40 && newValue < 60) {
      return gradientGreen;
    } else if (newValue >= 60 && newValue < 80) {
      return gradientBlue;
    } else if (newValue >= 80) {
      return gradientViolet;
    }
    return null;
  }

  Color getSliderColor(double value) {
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

    return newColor!;
  }

  String? getEmojis(double value) {
    int newValue = value.toInt();
    String? newEmojis;
    if (newValue >= 0 && newValue < 20) {
      newEmojis = '🤯';
    } else if (newValue >= 20 && newValue < 40) {
      newEmojis = '😐';
    } else if (newValue >= 40 && newValue < 60) {
      newEmojis = '🙂';
    } else if (newValue >= 60 && newValue < 80) {
      newEmojis = '😀';
    } else if (newValue >= 80) {
      newEmojis = '🤩';
    }

    return newEmojis!;
  }
}

final gradientRed = [
  const Color(0xFFff5252).withOpacity(0.2),
  const Color(0xFFff1744).withOpacity(0.4),
  const Color(0xFFff1744).withOpacity(0.4),
  const Color(0xFFd50000).withOpacity(0.6),
];

final gradientViolet = [
  const Color(0xFFE9E1FF),
  const Color(0xFFD6C9FE),
  const Color(0xFFD6C9FE),
  const Color(0xFF784CFC).withOpacity(0.6),
];

final gradientBlue = [
  const Color(0xFF448aff).withOpacity(0.2),
  const Color(0xFF2979ff).withOpacity(0.4),
  const Color(0xFF2979ff).withOpacity(0.4),
  const Color(0xFF2962ff).withOpacity(0.6),
];

final gradientTeal = [
  const Color(0xFF64ffda).withOpacity(0.2),
  const Color(0xFF1de9b6).withOpacity(0.4),
  const Color(0xFF1de9b6).withOpacity(0.4),
  const Color(0xFF00bfa5).withOpacity(0.6),
];

final gradientGreen = [
  const Color(0xFF69f0ae).withOpacity(0.2),
  const Color(0xFF00e676).withOpacity(0.4),
  const Color(0xFF00e676).withOpacity(0.4),
  const Color(0xFF00c853).withOpacity(0.6),
];

const colorGreen = Color(0xFF00c853);
const colorTeal = Color(0xFF00bfa5);
const colorBlue = Color(0xFF2962ff);
const colorViolet = Color(0xFF784CFC);
const colorRed = Color.fromRGBO(253, 51, 51, 1);
