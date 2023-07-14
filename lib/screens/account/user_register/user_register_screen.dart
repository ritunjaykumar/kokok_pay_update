import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/account/device_register/device_register_provider.dart';
import 'package:kokok_pay/screens/painter/background_painter.dart';
import 'package:provider/provider.dart';

import '../../../models/enums/enums.dart';
import '../../../service/gps/gps.dart';
import '/screens/account/user_register/user_register_provider.dart';
import '../../../models/model/models.dart';
import '../../../resources/asset_manager.dart';
import '../../../resources/size_manager.dart';
import '../../../utils/methods/support_methods.dart';
import '../../widgets/dialog/calender_dialog.dart';
import '/utils/extensions/string_extension.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({Key? key}) : super(key: key);

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  bool _init = true;
  String? mobileNo;
  String? otpRefId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      Map<String, String>? args =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
      if (args != null) {
        mobileNo = args[DeviceRegisterProvider.mobileNumberKey];
        otpRefId = args[DeviceRegisterProvider.otpRefIdKey];
      } else {
        mobileNo = null;
        mobileNo = null;
      }
      _init = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserRegisterProvider>(
      create: (_) => UserRegisterProvider(context, mobileNo, otpRefId),
      child: const _UserRegisterScreenMain(),
    );
    return const _UserRegisterScreenMain();
  }
}

class _UserRegisterScreenMain extends StatefulWidget {
  const _UserRegisterScreenMain({Key? key}) : super(key: key);

  @override
  State<_UserRegisterScreenMain> createState() => _UserRegisterScreenMainState();
}

class _UserRegisterScreenMainState extends State<_UserRegisterScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          if (context.read<UserRegisterProvider>().isAddress) {
            context.read<UserRegisterProvider>().isAddress = false;
            return false;
          }
          return true;
        },
        child: CustomPaint(
          painter: BackgroundPainter(colorScheme.primary),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ResourceFile.appLogo),
                  const SizedBox(height: 80),
                  Text('Sign Up', style: textTheme.titleLarge),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          context.watch<UserRegisterProvider>().isAddress
                              ? const _AddressWidget()
                              : const _FormWidget(),
                          Container(height: 200),
                        ],
                      ),
                    ),
                  ),
                  // Container(height: 200),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//==========================
class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _mobileController.text = context.read<UserRegisterProvider>().mobileNo.notNull();
    var registrationData = context.read<UserRegisterProvider>().registrationData;
    _firstNameController.text = registrationData.firstName;
    _lastNameController.text = registrationData.lastName;
    _emailController.text = registrationData.emailId;
    _dobController.text = registrationData.dob;
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _dobController.dispose();
  }

  void _onNext() {
    var valid = _formKey.currentState?.validate() ?? false;
    if (valid == false) {
      return;
    }

    _formKey.currentState?.save();

    context.read<UserRegisterProvider>().registrationData
      ..firstName = _firstNameController.text
      ..lastName = _lastNameController.text
      ..emailId = _emailController.text
      ..mobileNumber = _mobileController.text
      ..dob = _dobController.text;
    context.read<UserRegisterProvider>().isAddress = true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(SizeResource.value_16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(SizeResource.value_16),
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.primary,
                width: SizeResource.value_1,
              ),
              borderRadius: BorderRadius.circular(SizeResource.value_12),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    readOnly: true,
                    controller: _mobileController,
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: "Mobile Number",
                      prefixIcon: Icon(Icons.phone_android),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (firstName) {
                      if (firstName.empty()) {
                        return 'Number does not find';
                      }
                      return null;
                    },
                    onTapOutside: (PointerDownEvent pde) {
                      SupportMethods.closeKeyboard();
                    },
                    onSaved: (firstName) {},
                  ),
                  const SizedBox(height: SizeResource.value_16),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      hintText: "First Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (firstName) {
                      if (firstName.empty()) {
                        return 'please enter the First name';
                      }
                      return null;
                    },
                    onSaved: (firstName) {},
                  ),
                  const SizedBox(height: SizeResource.value_16),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      hintText: "Last Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (lastName) {
                      if (lastName.empty()) {
                        return 'please enter the Last name';
                      }
                      return null;
                    },
                    onSaved: (lastName) {},
                  ),
                  const SizedBox(height: SizeResource.value_16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Id',
                      hintText: "email id",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validator: (lastName) {
                      if (lastName.empty()) {
                        return 'please enter email id';
                      }
                      if (lastName.isEmailId() == false) {
                        return 'please enter valid email id';
                      }
                      return null;
                    },
                    onSaved: (lastName) {},
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
                        onPressed: () async {
                          CalenderDialog((String date) {
                            _dobController.text = date;
                          }).show(context);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (lastName) {
                      if (lastName.empty()) {
                        return 'please select date of birth';
                      }
                      return null;
                    },
                    onSaved: (lastName) {},
                  ),
                  const GenderWidget(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: SizeResource.value_16),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _onNext,
                child: const Text('Next'),
              ),
            ),
          ),
        ],
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
    return Consumer<UserRegisterProvider>(
      builder: (_, registerProvider, chile) {
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

// =======================================address widget=====================

class _AddressWidget extends StatefulWidget {
  const _AddressWidget({Key? key}) : super(key: key);

  @override
  State<_AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<_AddressWidget> {
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nationalityController.dispose();
    _provinceController.dispose();
    _districtController.dispose();
    _addressController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nationalityController.text = UserRegisterProvider.defaultCountryName;
  }

  void _showCountryBottomSheet() {
    context.read<UserRegisterProvider>().showCountryBottomSheet((countryName) {
      _nationalityController.text = countryName;
    });
  }

  void _showStateBottomSheet() {
    context.read<UserRegisterProvider>().showStateBottomSheet((stateName, isClear) {
      _provinceController.text = stateName;
      if (isClear) {
        _districtController.clear();
      }
    });
  }

  void _onAddressPicked(CurrentLocationInfo currentLocationInfo) {
    _nationalityController.text = currentLocationInfo.country;
    _provinceController.text = currentLocationInfo.state;
    _districtController.text = currentLocationInfo.district;
    _addressController.text = currentLocationInfo.address;
  }

  void _getCurrentLocation() {
    context.read<UserRegisterProvider>().getCurrentLocation(_onAddressPicked);
  }

  void _showDistrictBottomSheet() {
    context.read<UserRegisterProvider>().showDistrictBottomSheet((district) {
      _districtController.text = district;
    });
  }

  void _onClickNext() {
    bool valid = _formKey.currentState?.validate() ?? false;
    if (valid == false) {
      return;
    }
    _formKey.currentState?.save();

    context.read<UserRegisterProvider>().registrationData
      ..country = _nationalityController.text
      ..state = _provinceController.text
      ..district = _districtController.text
      ..address = _addressController.text;

    context.read<UserRegisterProvider>().onClickNext();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(SizeResource.value_16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.primary,
                width: SizeResource.value_1,
              ),
              borderRadius: BorderRadius.circular(SizeResource.value_12),
            ),
            child: Consumer<UserRegisterProvider>(
              builder: (_, userProvider, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(SizeResource.value_8),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.outlineVariant.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(SizeResource.value_12),
                          topRight: Radius.circular(SizeResource.value_12),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Fill your Address Or Click here to auto detect the address',
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.tertiary.withOpacity(.7),
                              ),
                              maxLines: 2,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.location_on),
                            onPressed: _getCurrentLocation,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(SizeResource.value_12),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: SizeResource.value_12),
                            TextFormField(
                              readOnly: true,
                              controller: _nationalityController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  onPressed: _showCountryBottomSheet,
                                ),
                                prefixIcon: const Icon(Icons.language_sharp),
                                hintText: 'Select country',
                                labelText: "Country",
                              ),
                              onTapOutside: (PointerDownEvent event) {
                                SupportMethods.closeKeyboard();
                              },
                              validator: (country) {
                                if (country.empty()) {
                                  return 'please enter Country';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: SizeResource.value_16),
                            TextFormField(
                              controller: _provinceController,
                              readOnly: userProvider.isReadOnly(),
                              decoration: InputDecoration(
                                suffixIcon: userProvider.isReadOnly()
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                        onPressed: _showStateBottomSheet,
                                      )
                                    : null,
                                prefixIcon: const Icon(Icons.language_sharp),
                                hintText: 'State/Province',
                                labelText: "State/Province",
                              ),
                              validator: (state) {
                                if (state.empty()) {
                                  return 'please enter State/Province';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: SizeResource.value_16),
                            TextFormField(
                              controller: _districtController,
                              readOnly: userProvider.isReadOnly(),
                              decoration: InputDecoration(
                                suffixIcon: userProvider.isReadOnly()
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                        onPressed: _showDistrictBottomSheet,
                                      )
                                    : null,
                                prefixIcon: const Icon(Icons.language_sharp),
                                hintText: 'District',
                                labelText: "district",
                              ),
                              validator: (district) {
                                if (district.empty()) {
                                  return 'please enter district';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: SizeResource.value_16),
                            TextFormField(
                              controller: _addressController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.my_location),
                                hintText: 'Address',
                                labelText: "Address",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              child: Container(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: SizeResource.value_22,
              left: SizeResource.value_8,
              right: SizeResource.value_8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    context.read<UserRegisterProvider>().isAddress = false;
                    // userProvider.isAddress = false;
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: _onClickNext,
                  child: const Text('Sign Up'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
