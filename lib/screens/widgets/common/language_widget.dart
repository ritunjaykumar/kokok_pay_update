import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '/resources/size_manager.dart';
import '/service/provider/settings_provider.dart';
import '../../../models/enums/enums.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context)!;
    return Consumer<AppSettingProvider>(
      builder: (ctx, appSetting, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<AppLanguage>(
            style: theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.secondary),
            value: appSetting.appLanguage,
            borderRadius: BorderRadius.circular(SizeResource.value_16),
            items: [
              _getDropdownMenuItem(
                t.appLanguage(AppLanguage.defaultLang.language),
                AppLanguage.defaultLang,
              ),
              _getDropdownMenuItem(
                t.appLanguage(AppLanguage.english.language),
                AppLanguage.english,
              ),
              _getDropdownMenuItem(
                t.appLanguage(AppLanguage.lao.language),
                AppLanguage.lao,
              ),
            ],
            onChanged: (AppLanguage? value) {
              if (value != null) {
                appSetting.changeAppLanguage(value);
              }
            },
          ),
        );
      },
    );
  }

  DropdownMenuItem<AppLanguage> _getDropdownMenuItem(String title, AppLanguage value) {
    return DropdownMenuItem<AppLanguage>(
      value: value,
      child: Text(title),
    );
  }
}
