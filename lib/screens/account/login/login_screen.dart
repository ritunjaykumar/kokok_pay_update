import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/resources/custom_icon.dart';
import 'package:kokok_pay/screens/painter/background_painter.dart';
import 'package:kokok_pay/screens/widgets/common/language_widget.dart';
import 'package:provider/provider.dart';

import '/resources/asset_manager.dart';
import '/resources/size_manager.dart';
import '/screens/account/login/login_provider.dart';
import '/screens/widgets/common/bank_logo.dart';
import '/screens/widgets/utils/utils.dart';
import '/utils/methods/support_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(context),
      child: const _LoginScreenMain(),
    );
  }
}

///
class _LoginScreenMain extends StatefulWidget {
  const _LoginScreenMain({Key? key}) : super(key: key);

  @override
  State<_LoginScreenMain> createState() => _LoginScreenMainState();
}

class _LoginScreenMainState extends State<_LoginScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: SizeResource.value_0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(systemNavigationBarColor: colorScheme.background),
        actions: const [LanguageWidget()],
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: CustomPaint(
        painter: BackgroundPainter(colorScheme.primary),
        child: const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BankLogo(),
                  SizedBox(height: 100),
                  _PinFormUI(),
                ],
              ),
            ),
          ),
        ),
      ),
      /* body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesFile.loginBg),
              fit: BoxFit.fill,
            ),
          ),
          child:  Stack(
            children: [
              const Positioned(
                right: 60,
                top: 100,
                child: BankLogo(),
              ),
              Positioned.fill(
                top: MediaQuery.sizeOf(context).height * .40,
                child: const Padding(
                  padding: EdgeInsets.all(SizeResource.value_22),
                  child: _LoginForm(),
                ),
              ),
              const Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: _VersionWidget(),
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}

//////////////+++++++++++++++++++++++++++++++++++++++++
class _PinFormUI extends StatefulWidget {
  const _PinFormUI({super.key});

  @override
  State<_PinFormUI> createState() => _PinFormUIState();
}

class _PinFormUIState extends State<_PinFormUI> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  bool showPin = false;

  void _toggleShowPin() {
    showPin = !showPin;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
  }
  void _login() {
    bool validate = _formKey.currentState!.validate();
    if (validate == false) {
      return;
    }
    _formKey.currentState!.save();
    context.read<LoginProvider>().mpinLogin(_pinController.text);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pin Code',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
              TextFormField(
                controller: _pinController,
                obscureText: showPin,
                obscuringCharacter: 'x',
                decoration: InputDecoration(
                  hintText: 'Pin',
                  suffixIcon: IconButton(
                    icon: Icon(showPin ? Icons.visibility : Icons.visibility_off),
                    color: colorScheme.primary,
                    onPressed: _toggleShowPin,
                  ),
                ),
                onFieldSubmitted: (pin) {},
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                onTapOutside: (PointerDownEvent event) {
                  SupportMethods.closeKeyboard();
                },
                validator: (pin) {
                  if (pin == null || pin.isEmpty) {
                    return 'please enter the pin';
                  }
                  if (pin.length < 6) {
                    return 'pin is not valid';
                  }
                  return null;
                },
                onSaved: (pin) {},
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: context.read<LoginProvider>().forgotPassword,
                  child: const Text('Forget Pin? Reset here'),
                ),
              ),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconButton(Icons.fingerprint, context.read<LoginProvider>().biometricLogin),
                  const SizedBox(width: 12),
                  _iconButton(Icons.face, context.read<LoginProvider>().biometricLogin),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback callback) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 44,
      height: 44,
      child: IconButton(
        onPressed: callback,
        icon: Icon(icon),
        color: colorScheme.primary,
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeResource.value_12,
            ),
            side: BorderSide(
              color: colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}

///=============version widget

class _VersionWidget extends StatelessWidget {
  const _VersionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<LoginProvider>(builder: (_, loginProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            loginProvider.appPackageInfo.version,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'App Version',
            style: theme.textTheme.labelLarge!.copyWith(
              color: theme.colorScheme.background,
            ),
          ),
        ],
      );
    });
  }
}

///===============form
class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
  }

  void _login() {
    bool validate = _formKey.currentState!.validate();
    if (validate == false) {
      return;
    }
    _formKey.currentState!.save();
    context.read<LoginProvider>().mpinLogin(_pinController.text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<LoginProvider>(
      builder: (ctx, loginProvider, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _pinController,
                obscureText: loginProvider.isObscure,
                obscuringCharacter: 'x',
                decoration: InputDecoration(
                  hintText: 'Pin',
                  suffixIcon: IconButton(
                    icon: Icon(
                      loginProvider.isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    color: theme.colorScheme.primary,
                    onPressed: loginProvider.setObscure,
                  ),
                  enabledBorder: Utils.getUnderLineInputBoarder(
                    theme.colorScheme.primary,
                  ),
                  errorBorder: Utils.getUnderLineInputBoarder(
                    theme.colorScheme.onError,
                  ),
                  focusedBorder: Utils.getUnderLineInputBoarder(
                    theme.colorScheme.secondary,
                  ),
                  focusedErrorBorder: Utils.getUnderLineInputBoarder(
                    theme.colorScheme.error,
                  ),
                  disabledBorder: Utils.getUnderLineInputBoarder(
                    theme.colorScheme.primary.withOpacity(0.5),
                  ),
                ),
                onFieldSubmitted: (pin) {
                  _login();
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                onTapOutside: (PointerDownEvent event) {
                  SupportMethods.closeKeyboard();
                },
                validator: (pin) {
                  if (pin == null || pin.isEmpty) {
                    return 'please enter the pin';
                  }
                  if (pin.length < 6) {
                    return 'pin is not valid';
                  }
                  return null;
                },
                onSaved: (pin) {},
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: loginProvider.forgotPassword,
                    child: const Text('Forgot pin? Reset Here'),
                  ),
                  SizedBox(
                    width: SizeResource.value_120,
                    child: ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
                  ),
                  const _BiometricWidget(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

///===================finger and face ui
class _BiometricWidget extends StatelessWidget {
  const _BiometricWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: SizeResource.value_8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: context.read<LoginProvider>().biometricLogin,
            icon: const Icon(CustomIcon.face),
            color: theme.primaryColor,
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeResource.value_12,
                ),
                side: BorderSide(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: SizeResource.value_8,
          ),
          IconButton(
            onPressed: context.read<LoginProvider>().biometricLogin,
            icon: const Icon(Icons.fingerprint),
            color: theme.primaryColor,
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeResource.value_12,
                ),
                side: BorderSide(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
