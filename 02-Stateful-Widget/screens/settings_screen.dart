import 'package:flutter/material.dart';
import 'package:mindful_app/data/sp_hemler.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController txtName = TextEditingController();
  final List<String> _images = ['lake', 'mountain', 'sea', 'country'];
  String _selectedImage = 'lake';
  final helper = SPHelper();

  @override
  void initState() {
    super.initState();
    _getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: txtName,
            decoration:
                const InputDecoration(hintText: 'Please enter your name'),
          ),
          DropdownButton<String>(
            value: _selectedImage,
            onChanged: (String? newValue) {
              _selectedImage = newValue ?? 'lake';
              setState(() {});
            },
            items: _images.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _saveSettings().then((value) {
              final String message = value
                  ? 'The settings have been saved'
                  : 'Error: the settings were not saved';
              // Showing the Snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  duration: const Duration(seconds: 3),
                ),
              );
            });
          },
          child: const Icon(Icons.save)),
    );
  }

  Future<bool> _saveSettings() async {
    return await helper.setSettings(txtName.text, _selectedImage);
  }

  Future<void> _getSettings() async {
    final settings = await helper.getSettings();
    _selectedImage = settings['image'] ?? 'lake';
    txtName.text = settings['name'] ?? '';
    setState(() {});
  }

  @override
  void dispose() {
    txtName.dispose();
    super.dispose();
  }
}
