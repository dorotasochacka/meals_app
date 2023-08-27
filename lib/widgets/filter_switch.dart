import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool newValue) onChanged;

  const FilterSwitch(
      {required this.title,
      required this.value,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        'Only include $title meals.',
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
    //
    // SwitchListTile(
    //   title: Text(title),
    //   subtitle: Text(description),
    //   value: value,
    //   onChanged: (newValue) {
    //     setState(() {
    //       widget.value = newValue;
    //     });
    //   },
    // );
  }
}
