import 'package:flutter/material.dart';

import '../../../resources/asset_manager.dart';
import '../../../resources/size_manager.dart';

class BankLogo extends StatelessWidget {
  const BankLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesFile.bankLogo,
      width: SizeResource.value_100,
    );
  }
}
