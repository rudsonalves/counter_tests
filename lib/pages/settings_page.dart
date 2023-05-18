import 'package:flutter/material.dart';

import '../models/counter.dart';
import '../models/limited_counter.dart';
import '../models/person.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Object> _list =
        ModalRoute.of(context)!.settings.arguments as List<Object>;

    final Counter _counter1 = _list[0] as Counter;
    final LimitedCounter _counter2 = _list[1] as LimitedCounter;
    final Person _person = _list[2] as Person;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Text('Reset Counter 1: ${_counter1.value}'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _counter1.reset();
                    });
                  },
                  icon: Icon(_counter1.value != 0
                      ? Icons.radio_button_unchecked_sharp
                      : Icons.check),
                ),
              ],
            ),
            Row(
              children: [
                Text('Reset Counter 2: ${_counter2.value}'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _counter2.reset();
                    });
                  },
                  icon: Icon(_counter2.value != 0
                      ? Icons.radio_button_unchecked_sharp
                      : Icons.check),
                ),
              ],
            ),
            Row(
              children: [
                Text('Clear Name: ${_person.name}'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _person.name = '';
                    });
                  },
                  icon: Icon(
                    _person.name.isNotEmpty
                        ? Icons.radio_button_unchecked_sharp
                        : Icons.check,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Clear Surname: ${_person.surname}'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _person.surname = '';
                    });
                  },
                  icon: Icon(
                    _person.surname.isNotEmpty
                        ? Icons.radio_button_unchecked_sharp
                        : Icons.check,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
