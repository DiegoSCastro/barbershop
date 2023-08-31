import 'package:flutter/material.dart';

import '../constants.dart';

class WeedDaysPanel extends StatelessWidget {
  final ValueChanged<String> onTapDay;
  const WeedDaysPanel({super.key, required this.onTapDay});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecione os dias da semana',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonDay(label: 'Seg', onTapDay: onTapDay),
                ButtonDay(label: 'Ter', onTapDay: onTapDay),
                ButtonDay(label: 'Qua', onTapDay: onTapDay),
                ButtonDay(label: 'Qui', onTapDay: onTapDay),
                ButtonDay(label: 'Sex', onTapDay: onTapDay),
                ButtonDay(label: 'Sab', onTapDay: onTapDay),
                ButtonDay(label: 'Dom', onTapDay: onTapDay),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonDay extends StatefulWidget {
  final String label;
  final ValueChanged<String> onTapDay;
  const ButtonDay({
    super.key,
    required this.label,
    required this.onTapDay,
  });

  @override
  State<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends State<ButtonDay> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : AppColors.grey;
    final buttonColor = selected ? AppColors.brown : AppColors.white;
    final borderColor = selected ? AppColors.brown : AppColors.grey;
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () {
            widget.onTapDay(widget.label);
            setState(() {
              selected = !selected;
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 40,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor),
              color: buttonColor,
            ),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
