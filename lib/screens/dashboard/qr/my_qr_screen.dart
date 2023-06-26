import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/models/model/model_resp.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/dashboard/qr/my_qr_provider.dart';
import 'package:kokok_pay/screens/widgets/widget/widgets.dart';
import 'package:kokok_pay/utils/methods/support_methods.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrScreen extends StatefulWidget {
  const MyQrScreen({Key? key}) : super(key: key);

  @override
  State<MyQrScreen> createState() => _MyQrScreenState();
}

class _MyQrScreenState extends State<MyQrScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyQrProvider>(
      create: (ctx) => MyQrProvider(context),
      child: const _MessageScreenMain(),
    );
  }
}

///
class _MessageScreenMain extends StatefulWidget {
  const _MessageScreenMain({Key? key}) : super(key: key);

  @override
  State<_MessageScreenMain> createState() => _MessageScreenMainState();
}

class _MessageScreenMainState extends State<_MessageScreenMain> {
  final GlobalKey _repaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getQrWidget(),
          _getOptionWidget(),
          _getSelectedBank(),
        ],
      ),
    );
  }

  Widget _getQrWidget() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Consumer<MyQrProvider>(
      builder: (ctx, qrProvider, child) {
        return RepaintBoundary(
          key: _repaintKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 18,
                  ),
                  margin: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 24,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Mr. Inpone',
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      Text(
                        '+856 8083816290',
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      QrImageView(
                        data: qrProvider.qrString,
                        version: QrVersions.auto,
                        size: 320,
                        backgroundColor: colorScheme.onPrimary,
                        embeddedImage: const AssetImage(
                          ImagesFile.laoQRLogo,
                        ),
                        embeddedImageStyle: const QrEmbeddedImageStyle(
                          size: Size(50, 50),
                        ),
                        errorStateBuilder: (cxt, err) {
                          return const Center(
                            child: Text(
                              "Uh oh! Something went wrong...",
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                        padding: const EdgeInsets.all(12),
                        semanticsLabel: 'Qr image',
                      ),
                    ],
                  ),
                ),
                const Align(
                  child: CircleAvatar(
                    radius: 22,
                    foregroundImage: AssetImage(ImagesFile.myPic),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(ImagesFile.placeholder),
      ),
    );
  }

  Widget _getOptionWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: context.read<MyQrProvider>().showBankListBottomSheet,
            icon: const Icon(Icons.account_balance),
          ),
          IconButton(
            onPressed: context.read<MyQrProvider>().qrAmountBottomSheet,
            icon: const Icon(Icons.qr_code),
          ),
          IconButton(
            onPressed: () {
              context.read<MyQrProvider>().saveImage(_repaintKey);
            },
            icon: const Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {
              context.read<MyQrProvider>().shareImage(_repaintKey);
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
    );
  }

  Widget _getSelectedBank() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Consumer<MyQrProvider>(
      builder: (ctx, myQrProvider, child) {
        return myQrProvider.bankDataResp == null
            ? child!
            : Container(
                margin: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: const Text('Selected Bank'),
                  subtitle: Text(myQrProvider.bankDataResp!.name),
                  leading: const CircleAvatar(
                    foregroundImage: AssetImage(ImagesFile.bankLogo),
                    radius: 18,
                  ),
                ),
              );
      },
      child: Container(),
    );
  }
}

//////////for enter amount widget

class DynamicQrEditor extends StatefulWidget {
  const DynamicQrEditor({super.key});

  @override
  State<DynamicQrEditor> createState() => _DynamicQrEditorState();
}

class _DynamicQrEditorState extends State<DynamicQrEditor> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  double amount = 0;
  String description = '';

  void _onFormSubmit() {
    _formKey.currentState!.save();
    Navigator.of(context).pop({'amount': amount, 'description': description});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DialogAppbar(
          title: 'Generate Qr with Amount',
          icon: Icons.close,
          callback: () {
            Navigator.of(context).pop();
          },
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 12,
            left: 12,
            right: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Enter Amount'),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Please Enter Amount',
                    prefix: Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Text('LAK'),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onTapOutside: (event) {
                    SupportMethods.closeKeyboard();
                  },
                  onSaved: (amount) {
                    this.amount = double.parse(amount!);
                  },
                  validator: (amount) {
                    if (amount == null) return null;
                    try {
                      double.parse(amount);
                    } catch (error) {
                      return 'invalid amount format';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                const Text('Description'),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Please Enter Description',
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onSaved: (description) {
                    this.description = description!;
                  },
                  onFieldSubmitted: (description) {
                    _onFormSubmit();
                  },
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onFormSubmit,
                    child: const Text('Generate QR'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//////
class SelectBankWidget extends StatelessWidget {
  const SelectBankWidget({super.key, required this.bankList});

  final List<BankDataResp> bankList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Column(
        children: [
          DialogAppbar(
            title: 'Select Bank',
            icon: Icons.close,
            callback: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bankList.length,
              itemBuilder: (ctx, i) {
                final bankData = bankList[i];
                return ListTile(
                  leading: const CircleAvatar(foregroundImage: AssetImage(ImagesFile.bankLogo)),
                  title: Text(bankData.name),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(bankData);
                    },
                    child: const Text('Select'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
