import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/insurance/insurance_provider.dart';
import 'package:kokok_pay/screens/painter/background_painter.dart';
import 'package:provider/provider.dart';

class InsuranceScreen extends StatefulWidget {
  const InsuranceScreen({Key? key}) : super(key: key);

  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InsuranceProvider>(
      create: (ctx) => InsuranceProvider(context)..init(),
      child: const _InsuranceScreenMain(),
    );
  }
}

///
class _InsuranceScreenMain extends StatefulWidget {
  const _InsuranceScreenMain({Key? key}) : super(key: key);

  @override
  State<_InsuranceScreenMain> createState() => _InsuranceScreenMainState();
}

class _InsuranceScreenMainState extends State<_InsuranceScreenMain> {
  final TextEditingController _insuranceController = TextEditingController();
  String customerType = 'New Customer';
  String motorType = 'Motor Bike';
  String motorPackage = 'LVI-A0-54,545.45 LAK';
  final ImagePicker _picker = ImagePicker();
  Uint8List? docImage;
  List<String> motorTypes = [
    'Motor Bike',
    'Truck',
    'Bus 8-12 seats (MINI-BUS)',
    'Bus 5-7 seats (PICKUP, SUV)',
    'Bus 4 seats (COUPER, SEDAN)',
    'Auto',
  ];

  List<String> motorPackages = [
    'LVI-A0-54,545.45 LAK',
    'LVI-A1-81,818.81 LAK',
    'LVI-A2-172,727.27 LAK',
  ];

  void getImage(ImageSource imageSource) async {
    XFile? pickedImage = await _picker.pickImage(source: imageSource);
    if (pickedImage != null) {
      docImage = await pickedImage.readAsBytes();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _insuranceController.text = 'Motor Insurance';
  }

  @override
  void dispose() {
    super.dispose();
    _insuranceController.dispose();
  }

  void changeCustomerType(String? cusType) {
    if (cusType != null && customerType != cusType) {
      customerType = cusType;
      setState(() {});
    }
  }

  void onChangeMotorType(String? motor) {
    if (motor != null && motorType != motor) {
      motorType = motor;
      setState(() {});
    }
  }

  void onChangeMotorPackage(String? package) {
    if (package != null && package != motorPackage) {
      motorPackage = package;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance'),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.primaryContainer,
        ),
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
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                  child: Image.asset(
                    UtilLogo.insurance,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 80),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(22),
                        topLeft: Radius.circular(22),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          TextField(
                            controller: _insuranceController,
                            readOnly: true,
                            decoration: const InputDecoration(
                                labelText: 'Insurance Type',
                                prefixIcon: Icon(Icons.security_sharp)),
                          ),
                          const SizedBox(height: 16),
                          Text('Customer type', style: textTheme.bodyMedium),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: ['New Customer', 'Existing Customer'].map((e) {
                                return RadioMenuButton<String>(
                                  value: e,
                                  groupValue: customerType,
                                  onChanged: changeCustomerType,
                                  child: Text(e),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text('Motor Type type', style: textTheme.bodyMedium),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: motorType,
                                borderRadius: BorderRadius.circular(12),
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                onChanged: onChangeMotorType,
                                items: motorTypes.map(
                                  (e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text('Select Package', style: textTheme.bodyMedium),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: motorPackage,
                                borderRadius: BorderRadius.circular(12),
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                onChanged: onChangeMotorPackage,
                                items: motorPackages.map(
                                  (e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(),
                          const Text('Buyer Details'),
                          const SizedBox(height: 12),
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Buyer Name',
                              hintText: 'Buyer Name',
                              prefixIcon: Icon(Icons.person),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 22),
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Vehicle No',
                              hintText: 'Vehicle No',
                              prefixIcon: Icon(Icons.directions_bike_sharp),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 22),
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              hintText: 'Mobile Number',
                              prefixIcon: Icon(Icons.phone_android),
                            ),
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(height: 8),
                          const Divider(),
                          const SizedBox(height: 12),
                          const Text('Upload Document'),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            width: double.infinity,
                            height: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black)),
                            child: docImage != null
                                ? Image.memory(docImage!, fit: BoxFit.fill,)
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(onPressed: () {
                                        getImage(ImageSource.gallery);
                                      }, icon: const Icon(Icons.image)),
                                      const SizedBox(width: 10),
                                      IconButton(onPressed: () {
                                        getImage(ImageSource.camera);
                                      }, icon: const Icon(Icons.camera)),
                                    ],
                                  ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(),
                          const SizedBox(height: 12),
                          const Text('Payment method'),
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            decoration: BoxDecoration(
                                border: Border.all(), borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              title: const Text('Mr. Inpone'),
                              subtitle: const Text('Wallet|832748278234'),
                              trailing: Text('LAK 12324', style: textTheme.titleMedium),
                              titleTextStyle: textTheme.titleMedium,
                              subtitleTextStyle: textTheme.bodyLarge,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  ImagesFile.avatar,
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 280),
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
    );
  }
}
