import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/resources/size_manager.dart';
import '/service/provider/settings_provider.dart';
import '/utils/extensions/string_extension.dart';
import '/utils/methods/support_methods.dart';
import '../../../resources/asset_manager.dart';
import '../../../utils/validator/input_validator.dart';
import '../../widgets/common/language_widget.dart';
import 'device_register_provider.dart';

class DeviceRegisterScreen extends StatefulWidget {
  const DeviceRegisterScreen({Key? key}) : super(key: key);

  @override
  State<DeviceRegisterScreen> createState() => _DeviceRegisterScreenState();
}

class _DeviceRegisterScreenState extends State<DeviceRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<AppSettingProvider, DeviceRegisterProvider>(
      create: (ctx) => DeviceRegisterProvider(context),
      update: (ctx, settingProvider, deviceRegistrationProvider) {
        return deviceRegistrationProvider!..appSettingProvider = settingProvider;
      },
      child: const _DeviceRegisterScreenMain(),
    );

    /*return ChangeNotifierProvider<DeviceRegisterProvider>(
      create: (ctx) => DeviceRegisterProvider(context),
      child: const _DeviceRegisterScreenMain(),
    );*/
  }
}

//==============================================
class _DeviceRegisterScreenMain extends StatefulWidget {
  const _DeviceRegisterScreenMain({Key? key}) : super(key: key);

  @override
  State<_DeviceRegisterScreenMain> createState() => _DeviceRegisterScreenMainState();
}

class _DeviceRegisterScreenMainState extends State<_DeviceRegisterScreenMain> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: SizeResource.value_8),
            child: LanguageWidget(),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: SizeResource.value_16,
            ),
            child: Image.asset(
              ImagesFile.bankLogo,
              height: SizeResource.value_150,
            ),
          ),
          const _RegistrationFormWidget(),
        ],
      ),
    );
  }
}
//==============registration widget=============================================

class _RegistrationFormWidget extends StatefulWidget {
  const _RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  State<_RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<_RegistrationFormWidget> {
  late final TextEditingController _mobileEditingController;
  late final TextEditingController _otpEditingController;
  late final _formKey = GlobalKey<FormState>();
  late final TapGestureRecognizer _tapPrivacyPolicy;
  late final TapGestureRecognizer _tapTermCondition;

  @override
  void initState() {
    super.initState();
    _tapPrivacyPolicy = TapGestureRecognizer()
      ..onTap = context.read<DeviceRegisterProvider>().openPrivacyPolicy;
    _tapTermCondition = TapGestureRecognizer()
      ..onTap = context.read<DeviceRegisterProvider>().openTermCondition;
    _mobileEditingController = TextEditingController();
    _otpEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileEditingController.dispose();
    _otpEditingController.dispose();
    _tapPrivacyPolicy.dispose();
    super.dispose();
  }

  void _onClickNext() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<DeviceRegisterProvider>().validateMobileNo(_mobileEditingController.text);
    }
  }

  void _onClickOtp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<DeviceRegisterProvider>().validateOtp(_otpEditingController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<DeviceRegisterProvider>(
      builder: (_, registerProvider, child) {
        return Expanded(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SizeResource.value_16,
                vertical: SizeResource.value_32,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      readOnly: registerProvider.isOtpSent,
                      controller: _mobileEditingController,
                      decoration: const InputDecoration(
                          label: Text('Mobile Number'),
                          hintText: 'XXXXXXXXXXX',
                          prefixIcon: Icon(Icons.phone_android)),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        MobileNumberFormatter(),
                      ],
                      keyboardType: TextInputType.phone,
                      autofocus: true,
                      onTapOutside: (PointerDownEvent pe) {
                        SupportMethods.closeKeyboard();
                      },
                      validator: (text) {
                        if (text.empty()) {
                          return 'Mobile number should not be null';
                        }
                        if (text.getLength() < 13) {
                          return 'Invalid Mobile number';
                        }
                        return null;
                      },
                      onFieldSubmitted: (ddd) {
                        _onClickNext();
                      },
                      onSaved: (saved) {},
                    ),
                    const ResendOptWidget(),
                    if (context.watch<DeviceRegisterProvider>().isOtpSent)
                      TextFormField(
                        controller: _otpEditingController,
                        decoration: const InputDecoration(
                          label: Text('Otp'),
                          hintText: 'Enter OTP',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6),
                        ],
                        validator: (otp) {
                          if (otp.empty()) {
                            return 'Please enter the otp';
                          }
                          if (otp!.length < 6) {
                            return 'please enter valid otp';
                          }
                          return null;
                        },
                        onFieldSubmitted: (ddd) {
                          _onClickOtp();
                        },
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: SizeResource.value_16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: registerProvider.isOtpSent ? _onClickOtp : _onClickNext,
                          child: Text(
                            registerProvider.isOtpSent ? 'Verify Otp' : 'Next',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: SizeResource.value_16),
                      child: RichText(
                        text: TextSpan(
                          text: 'By signing up, you agree to our ',
                          style: theme.textTheme.bodySmall,
                          children: [
                            TextSpan(
                                text: 'Terms & Conditions ',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.colorScheme.error,
                                ),
                                recognizer: _tapTermCondition),
                            TextSpan(
                              text: 'And ',
                              style: theme.textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.error,
                              ),
                              recognizer: _tapPrivacyPolicy,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//=====================otp widget====================================
class ResendOptWidget extends StatelessWidget {
  const ResendOptWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerRight,
      child: Consumer<DeviceRegisterProvider>(
        builder: (_, registerProvider, child) {
          return (registerProvider.isOtpSent == false)
              ? child!
              : registerProvider.ticValue == 0
                  ? TextButton(
                      onPressed: registerProvider.resendOtp,
                      child: const Text('Resend Otp'),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(SizeResource.value_12),
                      child: RichText(
                        text: TextSpan(
                          text: 'Resend Otp ',
                          style: theme.textTheme.titleMedium,
                          children: [
                            TextSpan(
                              text: (registerProvider.ticValue / 100)
                                  .toStringAsFixed(2)
                                  .toString()
                                  .replaceAll('.', ':'),
                            ),
                          ],
                        ),
                      ),
                    );
        },
        child: const SizedBox(),
      ),
    );
  }
}
