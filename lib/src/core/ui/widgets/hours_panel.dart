import 'package:flutter/material.dart';

import '../constants.dart';

class HoursPanel extends StatelessWidget {
  final int startTime;
  final int endTime;
  final ValueChanged<int> onTapHour;
  const HoursPanel({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.onTapHour,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Selecione os horários de atendimento',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            for (int i = startTime; i <= endTime; i++)
              TimeButton(
                label: '$i:00'.padLeft(5, '0'),
                value: i,
                onTapHour: onTapHour,
              ),
          ],
        )
      ],
    );
  }
}

class TimeButton extends StatefulWidget {
  final String label;
  final int value;
  final ValueChanged<int> onTapHour;
  const TimeButton({
    super.key,
    required this.label,
    required this.onTapHour,
    required this.value,
  });

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : AppColors.grey;
    final buttonColor = selected ? AppColors.brown : AppColors.white;
    final borderColor = selected ? AppColors.brown : AppColors.grey;
    return InkWell(
      onTap: () {
        widget.onTapHour(widget.value);
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        height: 36,
        width: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
          border: Border.all(color: borderColor),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 12,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
