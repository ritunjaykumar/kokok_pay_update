import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/size_manager.dart';

import '../../models/model/models.dart';

class CountryList {
  final void Function(String) _callback;
  final BuildContext context;

  CountryList(this.context, this._callback);

  void show() {
    final theme = Theme.of(context);
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: theme.colorScheme.background,
        textStyle: theme.textTheme.titleMedium,
        bottomSheetHeight: 500,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(SizeResource.value_12),
          topRight: Radius.circular(SizeResource.value_12),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Start typing to search',
            prefixIcon: const Icon(Icons.search),
            border: theme.inputDecorationTheme.enabledBorder),
      ),
      onSelect: (Country country) => _callback(country.name),
    );
  }
}

class StateListView {
  StateListView(
    this.context,
    this._callback,
  );

  final void Function(KeyPair<String>) _callback;

  final BuildContext context;

  void show(List<KeyPair<String>> states) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      constraints: const BoxConstraints(
        maxHeight: 500,
        minHeight: 300,
      ),
      enableDrag: true,
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(SizeResource.value_12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(SizeResource.value_12),
                  topLeft: Radius.circular(SizeResource.value_12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select State/Province',
                      style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.background)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: theme.colorScheme.background,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: states.length,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    title: Text(states[i].key),
                    onTap: () {
                      Navigator.of(context).pop();
                      _callback(states[i]);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class DistrictListView {
  DistrictListView(
    this.context,
    this._callback,
  );

  final void Function(String) _callback;

  final BuildContext context;

  void show(List<String> districts) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      constraints: const BoxConstraints(
        maxHeight: 400,
        minHeight: 300,
      ),

      enableDrag: true,
      isDismissible: false,
      context: context,
      elevation: SizeResource.value_4,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(SizeResource.value_12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(SizeResource.value_12),
                  topLeft: Radius.circular(SizeResource.value_12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select District',
                      style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.background)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: theme.colorScheme.background,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: districts.length,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    title: Text(districts[i]),
                    onTap: () {
                      Navigator.of(context).pop();
                      _callback(districts[i]);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
