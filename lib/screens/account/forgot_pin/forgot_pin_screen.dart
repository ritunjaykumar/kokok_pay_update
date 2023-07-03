import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/resources/asset_manager.dart';
import '/resources/size_manager.dart';
import '/screens/account/forgot_pin/forgot_pin_provider.dart';
import '/utils/extensions/string_extension.dart';
import '/utils/methods/support_methods.dart';

class ForgotPinScreen extends StatefulWidget {
  const ForgotPinScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPinScreen> createState() => _ForgotPinScreenState();
}

class _ForgotPinScreenState extends State<ForgotPinScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotPinProvider(context),
      child: const _ForgotPinScreenMain(),
    );
  }
}

///=======

class _ForgotPinScreenMain extends StatefulWidget {
  const _ForgotPinScreenMain({Key? key}) : super(key: key);

  @override
  State<_ForgotPinScreenMain> createState() => _ForgotPinScreenMainState();
}

class _ForgotPinScreenMainState extends State<_ForgotPinScreenMain> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot PIN'),
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: theme.colorScheme.background
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              elevation: SizeResource.value_2,
              child: Container(
                height: SizeResource.value_32,
                color: theme.colorScheme.primaryContainer,
                alignment: Alignment.center,
                child: Text(
                  'Enter OTP and PIN',
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: SizeResource.value_16),
            Card(
              elevation: SizeResource.value_1,
              child: Padding(
                padding: const EdgeInsets.all(SizeResource.value_16),
                child: Column(
                  children: [
                    Image.asset(ImagesFile.forgotPassword),
                    const _ForgotPinForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///==-=-=-=-=-=-=-form widget

class _ForgotPinForm extends StatefulWidget {
  const _ForgotPinForm({Key? key}) : super(key: key);

  @override
  State<_ForgotPinForm> createState() => _ForgotPinFormState();
}

class _ForgotPinFormState extends State<_ForgotPinForm> {
  final _formKey = GlobalKey<FormState>();
  final _otpTextController = TextEditingController();
  final _newPinTextController = TextEditingController();
  final _newPinConfirmTextController = TextEditingController();

  final _pinFocusNode = FocusNode();
  final _confirmPinFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _otpTextController.dispose();
    _newPinConfirmTextController.dispose();
    _newPinTextController.dispose();
    _confirmPinFocusNode.dispose();
    _pinFocusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ForgotPinProvider>().sendOtp();
    });
  }

  void _changePin() {
    final valid = _formKey.currentState!.validate();
    if (valid == false) {
      return;
    }
    context
        .read<ForgotPinProvider>()
        .resetMpin(_newPinTextController.text, _otpTextController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SizeResource.value_16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter OTP'),
            const SizedBox(height: SizeResource.value_12),
            TextFormField(
              controller: _otpTextController,
              decoration: const InputDecoration(
                hintText: 'OTP',
              ),
              onTapOutside: (event) {
                SupportMethods.closeKeyboard();
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
                FilteringTextInputFormatter.digitsOnly,
              ],
              textInputAction: TextInputAction.next,
              onChanged: (String otp) {
                if (otp.length == 6) {
                  _pinFocusNode.nextFocus();
                }
              },
              validator: (otp) {
                if (otp.empty()) {
                  return 'please enter otp!';
                }
                if (otp.getLength() < 6) {
                  return 'please enter valid otp';
                }
                return null;
              },
            ),
            const SizedBox(height: SizeResource.value_18),
            const Text('Enter New PIN'),
            const SizedBox(height: SizeResource.value_12),
            TextFormField(
              focusNode: _pinFocusNode,
              obscureText: true,
              obscuringCharacter: 'x',
              controller: _newPinTextController,
              decoration: const InputDecoration(
                hintText: 'PIN',
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (String otp) {
                if (otp.length == 6) {
                  _confirmPinFocusNode.nextFocus();
                }
              },
              validator: (pin) {
                if (pin.empty()) {
                  return 'please enter pin!';
                }
                if (pin.getLength() < 6) {
                  return 'please enter valid pin';
                }
                return null;
              },
            ),
            const SizedBox(height: SizeResource.value_18),
            const Text('Enter Confirm PIN'),
            const SizedBox(height: SizeResource.value_12),
            TextFormField(
              focusNode: _confirmPinFocusNode,
              obscureText: true,
              obscuringCharacter: 'x',
              controller: _newPinConfirmTextController,
              decoration: const InputDecoration(
                hintText: 'Enter Confirm PIN',
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (pin) {
                if (pin.empty()) {
                  return 'please enter confirm pin!';
                }
                if (pin.getLength() < 6) {
                  return 'please enter valid pin';
                }
                if (_newPinTextController.text != pin) {
                  return 'new pin and confirm pin did not match';
                }
                return null;
              },
              onFieldSubmitted: (newPin) {},
            ),
            const SizedBox(height: SizeResource.value_18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _changePin,
                child: const Text('Change PIN'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
