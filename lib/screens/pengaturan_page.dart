import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _notificationEnabled = false;
  double _volumeValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'General',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Notifications'),
            value: _notificationEnabled,
            onChanged: (value) {
              setState(() {
                _notificationEnabled = value;
              });
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Audio',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Volume'),
            trailing: Text('${_volumeValue.toInt()}'),
            subtitle: Slider(
              value: _volumeValue,
              min: 0.0,
              max: 100.0,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _volumeValue = value;
                });
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'About',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Version'),
            subtitle: const Text('1.0.0'),
            enabled: false,
          ),
        ],
      ),
    );
  }
}
