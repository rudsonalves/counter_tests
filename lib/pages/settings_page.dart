import 'package:flutter/material.dart';

import '../models/counter.dart';
import '../models/limited_counter.dart';
import '../models/person.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

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
            ValueListenableBuilder(
              valueListenable: _counter1.$value,
              builder: (context, value, _) {
                return Row(
                  children: [
                    Text('Reset Counter 1: $value'),
                    IconButton(
                      onPressed: _counter1.reset,
                      icon: Icon(_counter1.value != 0
                          ? Icons.radio_button_unchecked_sharp
                          : Icons.check),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _counter2.$value,
              builder: (context, value, _) {
                return Row(
                  children: [
                    Text('Reset Counter 2: $value'),
                    IconButton(
                      onPressed: _counter2.reset,
                      icon: Icon(_counter2.value != 0
                          ? Icons.radio_button_unchecked_sharp
                          : Icons.check),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _person.$name,
              builder: (context, name, _) {
                return Row(
                  children: [
                    Text('Clear Name: "$name"'),
                    IconButton(
                      onPressed: () => _person.name = '',
                      icon: Icon(
                        _person.name.isNotEmpty
                            ? Icons.radio_button_unchecked_sharp
                            : Icons.check,
                      ),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _person.$surname,
              builder: (context, surname, _) {
                return Row(
                  children: [
                    Text('Clear Surname: "$surname"'),
                    IconButton(
                      onPressed: () => _person.surname = '',
                      icon: Icon(
                        _person.surname.isNotEmpty
                            ? Icons.radio_button_unchecked_sharp
                            : Icons.check,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
