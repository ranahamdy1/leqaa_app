import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(100, 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('التصنيف', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              items: const [
                DropdownMenuItem(value: '1', child: Text('Option 1')),
                DropdownMenuItem(value: '2', child: Text('Option 2')),
              ],
              onChanged: (value) {
                // Handle selection
              },
              hint: const Text('اختر'),
              isExpanded: true,
            ),
            20.hSize,
            const Text('السعر', style: TextStyle(fontSize: 16)),
            Text(
              'Start ${_currentRangeValues.start.round()} - End ${_currentRangeValues.end.round()}',
              style: const TextStyle(fontSize: 16),
            ),
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 1000,
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_currentRangeValues.start.round()}'),
                Text('${_currentRangeValues.end.round()}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
