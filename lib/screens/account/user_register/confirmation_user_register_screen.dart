import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/painter/background_painter.dart';
import 'package:provider/provider.dart';

import '/models/model/models.dart';
import '/resources/size_manager.dart';
import '/screens/account/user_register/confirmation_user_register_provider.dart';
import '/screens/widgets/dialog/dialog_impl.dart';
import '/utils/extensions/string_extension.dart';
import '/utils/methods/support_methods.dart';
import '../../../models/enums/enums.dart';
import '../../widgets/dialog/calender_dialog.dart';

class ConfirmationUserRegisterScreen extends StatefulWidget {
  const ConfirmationUserRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationUserRegisterScreen> createState() => _ConfirmationUserRegisterScreenState();
}

class _ConfirmationUserRegisterScreenState extends State<ConfirmationUserRegisterScreen> {
  bool isFirstTime = true;
  late RegistrationData _registrationData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstTime) {
      _registrationData = ModalRoute.of(context)?.settings.arguments as RegistrationData;
      isFirstTime = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConfirmationUserRegisterProvider>(
      create: (ctx) => ConfirmationUserRegisterProvider(ctx, _registrationData),
      child: const _ConfirmationUserRegisterScreenMain(),
    );
  }
}

//================================== Main Class ================================================
class _ConfirmationUserRegisterScreenMain extends StatefulWidget {
  const _ConfirmationUserRegisterScreenMain({Key? key}) : super(key: key);

  @override
  State<_ConfirmationUserRegisterScreenMain> createState() =>
      _ConfirmationUserRegisterScreenMainState();
}

class _ConfirmationUserRegisterScreenMainState extends State<_ConfirmationUserRegisterScreenMain> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _genderController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailIdController = TextEditingController();
  final _dobController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _provinceController = TextEditingController();
  final _districtController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var registrationData = context.read<ConfirmationUserRegisterProvider>().registrationData;
    _firstNameController.text = registrationData.firstName;
    _lastNameController.text = registrationData.lastName;
    _genderController.text = registrationData.gender;
    _mobileNumberController.text = registrationData.mobileNumber;
    _emailIdController.text = registrationData.emailId;
    _dobController.text = registrationData.dob;
    _nationalityController.text = registrationData.country;
    _provinceController.text = registrationData.state;
    _districtController.text = registrationData.district;
    _addressController.text = registrationData.address;
  }

  bool _isReadMode = true;

  void _makeReadable() {
    if (_isReadMode == true) {
      ConfirmationDialog confirmationDialog = ConfirmationDialog(
        context,
        title: 'Alert!',
        body: 'Do you want to edit your details?',
        callback: () {
          _isReadMode = false;
          setState(() {});
        },
      );
      confirmationDialog.show();
    }
  }

  void _proceed() {
    var valid = _formKey.currentState?.validate() ?? false;
    if (valid == false) {
      return;
    }
    _formKey.currentState?.save();
    context.read<ConfirmationUserRegisterProvider>().registrationData
      ..firstName = _firstNameController.text
      ..lastName = _lastNameController.text
      ..emailId = _emailIdController.text
      ..dob = _dobController.text
      ..country = _nationalityController.text
      ..state = _provinceController.text
      ..district = _districtController.text
      ..address = _addressController.text;

    context.read<ConfirmationUserRegisterProvider>().registration();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: BackgroundPainter(colorScheme.primary),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 180),
                Container(
                  width: double.infinity,
                  height: SizeResource.value_36,
                  // decoration: BoxDecoration(
                  //   color: theme.colorScheme.secondaryContainer,
                  // ),
                  alignment: Alignment.center,
                  child:  Text('Please Verify the Details', style: textTheme.titleMedium,),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(SizeResource.value_12),
                    margin: const EdgeInsets.all(SizeResource.value_12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(
                        SizeResource.value_12,
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _mobileNumberController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Mobile Number',
                              hintText: 'Mobile Number',
                              prefixIcon: Icon(Icons.person_2_sharp),
                            ),
                            onTapOutside: (PointerDownEvent event) {
                              SupportMethods.closeKeyboard();
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (mobile) {
                              if (mobile.empty()) {
                                return 'please enter the mobile number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: SizeResource.value_16),
                          TextFormField(
                            controller: _firstNameController,
                            readOnly: _isReadMode,
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                              hintText: 'First Name',
                              prefixIcon: Icon(Icons.person_2_sharp),
                            ),
                            onTapOutside: (PointerDownEvent event) {
                              SupportMethods.closeKeyboard();
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (firstName) {
                              if (firstName.empty()) {
                                return 'please enter the First name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: SizeResource.value_16),
                          TextFormField(
                            controller: _lastNameController,
                            readOnly: _isReadMode,
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                              hintText: 'Last Name',
                              prefixIcon: Icon(Icons.person_2_sharp),
                            ),
                            onTapOutside: (PointerDownEvent event) {
                              SupportMethods.closeKeyboard();
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (firstName) {
                              if (firstName.empty()) {
                                return 'please enter the Last name';
                              }
                              return null;
                            },
                          ),
                          const GenderWidget(),
                          const SizedBox(height: SizeResource.value_16),
                          TextFormField(
                            controller: _emailIdController,
                            readOnly: _isReadMode,
                            decoration: const InputDecoration(
                              labelText: 'Email Id',
                              hintText: 'Email Id',
                              prefixIcon: Icon(Icons.person_2_sharp),
                            ),
                            onTapOutside: (PointerDownEvent event) {
                              SupportMethods.closeKeyboard();
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (lastName) {
                              if (lastName.empty()) {
                                return 'please enter email id';
                              }
                              if (lastName.isEmailId() == false) {
                                return 'please enter valid email id';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: SizeResource.value_16),
                          TextFormField(
                            controller: _dobController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Date of birth',
                              hintText: "date of birth",
                              prefixIcon: const Icon(Icons.calendar_month),
                              suffixIcon: IconButton(
                                onPressed: _isReadMode == false
                                    ? () async {
                                        CalenderDialog((String date) {
                                          _dobController.text = date;
                                        }).show(context);
                                      }
                                    : null,
                                icon: const Icon(Icons.edit),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (dob) {
                              if (dob.empty()) {
                                return 'please select date of birth';
                              }
                              return null;
                            },
                            onSaved: (lastName) {},
                          ),
                          const SizedBox(height: SizeResource.value_16),
                          TextFormField(
                            controller: _nationalityController,
                            readOnly: _isReadMode,
                            decoration: const InputDecoration(
                              labelText: 'Country',
                              hintText: 'Country Name',
                              prefixIcon: Icon(Icons.language),
                            ),
                            onTapOutside: (PointerDownEvent event) {
                              SupportMethods.closeKeyboard();
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (country) {
                              if (country.empty()) {
                                return 'please enter the country name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: SizeResource.value_16),
                          TextFormField(
                            controller: _provinceController,
                            readOnly: _isReadMode,
                            decoration: const InputDecoration(
                              labelText: 'State/Province',
                              hintText: 'State/Province Name',
                              prefixIcon: Icon(Icons.language),
                            ),
                            onTapOutside: (PointerDownEvent event) {
                              SupportMethods.closeKeyboard();
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (country) {
                              if (country.empty()) {
                                return 'please enter the State/Province name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: SizeResource.value_16),
                          TextFormField(
                            controller: _districtController,
                            readOnly: _isReadMode,
                            decoration: const InputDecoration(
                              labelText: 'District',
                              hintText: 'District Name',
                              prefixIcon: Icon(Icons.language),
                            ),
                            onTapOutside: (PointerDownEvent event) {
                              SupportMethods.closeKeyboard();
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (country) {
                              if (country.empty()) {
                                return 'please enter the District name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: SizeResource.value_16),
                          TextFormField(
                            controller: _addressController,
                            readOnly: _isReadMode,
                            decoration: const InputDecoration(
                              labelText: 'Address',
                              hintText: 'address',
                              prefixIcon: Icon(Icons.language),
                            ),
                            onTapOutside: (PointerDownEvent event) {
                              SupportMethods.closeKeyboard();
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: (address) {
                              if (address.empty()) {
                                return 'please enter the address name';
                              }
                              return null;
                            },
                          ),
                          Container(height: 220,)
                        ],

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(SizeResource.value_12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _makeReadable,
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'),
                        ),
                      ),
                      const SizedBox(width: SizeResource.value_16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _proceed,
                          icon: const Icon(Icons.check_circle_outline),
                          label: const Text('Proceed'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//==========================gender widget==================================
class GenderWidget extends StatelessWidget {
  const GenderWidget({Key? key}) : super(key: key);
  final List<KeyPair<Gender>> _list = const [
    KeyPair<Gender>(key: 'Male', value: Gender.male),
    KeyPair<Gender>(key: 'Female', value: Gender.female),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<ConfirmationUserRegisterProvider>(
      builder: (_, registerProvider, child) {
        return Container(
          margin: const EdgeInsets.only(top: SizeResource.value_16),
          padding: const EdgeInsets.symmetric(horizontal: SizeResource.value_12),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colorScheme.primary,
              width: SizeResource.value_1,
            ),
            borderRadius: BorderRadius.circular(SizeResource.value_12),
          ),
          child: Row(
            children: [
              Text(
                'Gender',
                style: theme.textTheme.titleMedium,
              ),
              for (int i = 0; i < _list.length; i++)
                Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(SizeResource.value_0),
                    title: Text(_list[i].key),
                    leading: Radio<Gender>(
                      value: _list[i].value,
                      groupValue: registerProvider.gender,
                      onChanged: (value) {
                        registerProvider.gender = value!;
                      },
                    ),
                    // titleTextStyle: theme.textTheme.bodyMedium,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
