import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/resources/size_manager.dart';
import 'package:kokok_pay/resources/string_manager.dart';
import 'package:kokok_pay/screens/qr/qr_screen/qr_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../models/model/model_resp.dart';
import '../../painter/qr_screen_painter.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => QrProvider(context),
      child: const _QrScreenMain(),
    );
  }
}

//
class _QrScreenMain extends StatefulWidget {
  const _QrScreenMain({Key? key}) : super(key: key);

  @override
  State<_QrScreenMain> createState() => _QrScreenMainState();
}

class _QrScreenMainState extends State<_QrScreenMain> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<QrProvider>().getProfileInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My QR'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: CustomPaint(
        painter: QrScreenPainter(theme.colorScheme.primary),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _QrWidget(),
              Expanded(child: _AmountFormWidget()),
            ],
          ),
        ),
      ),
      bottomSheet: context.watch<QrProvider>().selectedBank != null
          ? Padding(
              padding: const EdgeInsets.all(SizeResource.value_8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Share'),
                ),
              ),
            )
          : null,
    );
  }
}

class _QrWidget extends StatelessWidget {
  const _QrWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: SizeResource.value_12,
        vertical: SizeResource.value_22,
      ),
      child: Padding(
        padding: const EdgeInsets.all(SizeResource.value_22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _UserInfo(),
            Consumer<QrProvider>(
              builder: (ctx, qrProvider, child) {
                return qrProvider.qrString.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(SizeResource.value_12),
                        child: QrImageView(
                          data: qrProvider.qrString,
                          version: QrVersions.auto,
                          size: 320,
                          backgroundColor: theme.colorScheme.onPrimary,
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
                      )
                    : child!;
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeResource.value_12),
                child: Image.asset(ImagesFile.placeholder),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<QrProvider>(
      builder: (ctx, qrProvider, child) {
        return qrProvider.isLoadUserProfile == false
            ? child!
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: SizeResource.value_4),
                    child: Text(
                      '${qrProvider.userProfileResp.firstName} ${qrProvider.userProfileResp.lastName}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: SizeResource.value_8),
                    child: Text(
                      '+856 ${qrProvider.userProfileResp.mobile}',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Loading ...',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

class _AmountFormWidget extends StatefulWidget {
  const _AmountFormWidget({Key? key}) : super(key: key);

  @override
  State<_AmountFormWidget> createState() => _AmountFormWidgetState();
}

class _AmountFormWidgetState extends State<_AmountFormWidget> {
  bool _selectedOption = false;

  void _onChangeSelectionOption(bool? option) {
    if (option != null && _selectedOption != option) {
      _selectedOption = option;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(SizeResource.value_16),
          child: Column(
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeResource.value_12),
                  side: BorderSide(color: theme.colorScheme.primary),
                ),
                title: Text(
                  'Generate QR with Amount',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                tileColor: theme.colorScheme.onPrimary,
                onTap: context.read<QrProvider>().routeQrAmountScreen,
              ),
              const SizedBox(height: SizeResource.value_18),
              Consumer<QrProvider>(
                builder: (ctx, qrProvider, child) {
                  return qrProvider.selectedBank == null
                      ? child!
                      : ListTile(
                          title: const Text('Pay from'),
                          // titleTextStyle: theme.textTheme.bodyMedium,
                          // subtitleTextStyle: theme.textTheme.labelLarge,
                          subtitle: Text(qrProvider.selectedBank!.name),
                          /*leading: Image.network(
                            qrProvider.selectedBank!.url,
                            height: SizeResource.value_36,
                          ),*/
                          leading: FadeInImage(
                            image: NetworkImage(qrProvider.selectedBank!.url),
                            placeholder: const AssetImage(ImagesFile.placeholder),
                            height: SizeResource.value_36,
                          ),
                          tileColor: theme.colorScheme.onPrimary,
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: qrProvider.getBankData,
                        );
                },
                child: ListTile(
                  title: const Text('Select Member Bank'),
                  // titleTextStyle: theme.textTheme.titleMedium?.copyWith(
                  //   fontWeight: FontWeight.w700,
                  // ),
                  tileColor: theme.colorScheme.onPrimary,
                  trailing: OutlinedButton(
                    onPressed: context.read<QrProvider>().getBankData,
                    child: const Text('Select'),
                  ),
                ),
              ),
              const SizedBox(height: SizeResource.value_18),
              RichText(
                text: TextSpan(
                  text: 'Note: ',
                  style: theme.textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: StringResource().qrMsg,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
