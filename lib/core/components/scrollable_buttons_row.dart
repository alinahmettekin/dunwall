import 'package:flutter/material.dart';

class ButtonInfo {
  final String label;
  final IconData icon;

  ButtonInfo(this.label, this.icon);
}

class ScrollableButtonsRow extends StatelessWidget {
  final List<ButtonInfo> buttons;
  final Function(int) onButtonPressed;

  const ScrollableButtonsRow({super.key, required this.buttons, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ElevatedButton(
              onPressed: () => onButtonPressed(index),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.all(10),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(buttons[index].icon, size: 25),
                  const SizedBox(width: 15),
                  Text(
                    buttons[index].label,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
