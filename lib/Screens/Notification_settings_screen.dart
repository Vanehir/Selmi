import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import '../Texts/Text.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool isSwitchOn = false;
  final List<bool> checkValues = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: variant,
      appBar: AppBar(
        backgroundColor: primary,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        iconTheme: const IconThemeData(color: neutral),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("NOTIFICATIONS", style: TextStyle(color: neutral)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Push Notification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Expanded(child: Text(DescriptionNotification)),
                Switch(
                  value: isSwitchOn,
                  onChanged: (newValue) => setState(() => isSwitchOn = newValue),
                  activeColor: primary,
                ),
              ],
            ),
          ),
          // Primo blocco con i primi due elementi
          ..._buildCheckboxList(0, 2),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 16),
            child: Text("Email notification", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          // Secondo blocco con i restanti elementi
          ..._buildCheckboxList(2, checkValues.length),
        ],
      ),
    );
  }

  List<Widget> _buildCheckboxList(int start, int end) {
    const List<String> checkboxTitles = [
      "Your documentation",
      "Your documentation",
      "Your documentation",
      "Your documentation",
    ];

    return List<Widget>.generate(end - start, (index) {
      return SettingCheckbox(
        title: checkboxTitles[start + index],
        value: checkValues[start + index],
        onChanged: isSwitchOn
            ? (newValue) => setState(() => checkValues[start + index] = newValue ?? false)
            : null,
      );
    });
  }
}

class SettingCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const SettingCheckbox({
    Key? key,
    required this.title,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: neutral, width: 2)),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Checkbox(
            value: value,
            activeColor: primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
