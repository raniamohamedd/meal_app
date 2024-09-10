import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/filter-provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class filters extends ConsumerWidget {
  filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activee = ref.watch(filterprovider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: Column(children: [
          cu(context, 'Glutten free', 'only include glutten free meals',
              activee[fil.glutenfree]!, (bool value) {
            ref.read(filterprovider.notifier).setfilter(fil.glutenfree, value);
          }),
          cu(context, 'Lactose free', 'only include lactose free meals',
              activee[fil.lacfree]!, (bool value) {
            ref.read(filterprovider.notifier).setfilter(fil.lacfree, value);
          }),
          cu(context, 'Vegan', 'only include vegan meals ',
              activee[fil.vegefree]!, (bool value) {
            ref.read(filterprovider.notifier).setfilter(fil.vegefree, value);
          }),
          cu(context, 'Vegetarian', 'only include vegetarian meals',
              activee[fil.vegfree]!, (bool value) {
            ref.read(filterprovider.notifier).setfilter(fil.vegfree, value);
          }),
        ]));
  }

  SwitchListTile cu(BuildContext context, String title, String subtitle,
      bool filter, Function(bool neww) onchanged) {
    return SwitchListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        activeColor: Colors.black87,
        contentPadding: EdgeInsets.only(left: 34, right: 22),
        value: filter,
        onChanged: onchanged);
  }
}
