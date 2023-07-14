import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/screens/painter/background_painter.dart';
import 'package:provider/provider.dart';

import '../../../models/model/model_resp.dart';
import '/resources/size_manager.dart';
import '/screens/account/pin_register/pin_register_provider.dart';
import '/screens/widgets/common/bank_logo.dart';
import '/utils/extensions/string_extension.dart';
import '/utils/methods/support_methods.dart';

class PinRegisterScreen extends StatefulWidget {
  const PinRegisterScreen({Key? key}) : super(key: key);

  @override
  State<PinRegisterScreen> createState() => _PinRegisterScreenState();
}

class _PinRegisterScreenState extends State<PinRegisterScreen> {
  bool isFirstTime = true;
  late UserRegistrationResp? _registrationData;
  String? userId;
  String? otpRefId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstTime) {
      _registrationData = ModalRoute.of(context)!.settings.arguments as UserRegistrationResp?;
      if (_registrationData != null) {
        userId = _registrationData!.userId;
        otpRefId = _registrationData!.otpRefId;
      } else {
        userId = null;
        otpRefId = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PinRegisterProvider(ctx, userId, otpRefId),
      child: const _PinRegisterScreenMain(),
    );
  }
}

//=========================================main===================

class _PinRegisterScreenMain extends StatefulWidget {
  const _PinRegisterScreenMain({Key? key}) : super(key: key);

  @override
  State<_PinRegisterScreenMain> createState() => _PinRegisterScreenMainState();
}

class _PinRegisterScreenMainState extends State<_PinRegisterScreenMain> {
  final _formKey = GlobalKey<FormState>();
  final _mpinController = TextEditingController();
  final _mpinVerifyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _mpinController.dispose();
    _mpinVerifyController.dispose();
  }

  void _onClickNext() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (valid == false) {
      return;
    }
    _formKey.currentState?.save();
    context.read<PinRegisterProvider>().onClickNext(_mpinController.text);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pin Setup'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: CustomPaint(
        painter: BackgroundPainter(colorScheme.primary),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BankLogo(),
                  const SizedBox(height: 100),
                  Card(
                    elevation: SizeResource.value_1,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        SizeResource.value_22,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: SizeResource.value_16,
                            ),
                            TextFormField(
                              controller: _mpinController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Mpin',
                                hintText: 'Enter New Pin',
                                prefixIcon: Icon(Icons.pin),
                              ),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              onTapOutside: (PointerDownEvent event) {
                                SupportMethods.closeKeyboard();
                              },
                              validator: (mpin) {
                                if (mpin.empty()) {
                                  return 'please enter the mpin';
                                }
                                if (mpin.getLength() < 6) {
                                  return 'please enter valid mpin';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: SizeResource.value_18),
                            TextFormField(
                              controller: _mpinVerifyController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Confirm Mpin',
                                hintText: 'Enter confirm Pin',
                                prefixIcon: Icon(Icons.pin),
                              ),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              validator: (mpin) {
                                if (mpin.empty()) {
                                  return 'please enter the mpin';
                                }
                                if (mpin.getLength() < 6) {
                                  return 'please enter valid mpin';
                                }
                                print('mpin: ${_mpinController.text} and mpinVerify: $mpin');
                                if (mpin != _mpinController.text) {
                                  return 'Mpin did not matched';
                                }
                                return null;
                              },
                              onFieldSubmitted: (mpin) {
                                _onClickNext();
                              },
                            ),
                            const SizedBox(height: SizeResource.value_18),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _onClickNext,
                                child: const Text('Next'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
