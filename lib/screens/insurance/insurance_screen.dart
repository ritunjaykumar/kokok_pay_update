import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                                    child: Text(e));
                              }).toList(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: motorType,
                              borderRadius: BorderRadius.circular(12),
                              padding: const EdgeInsets.all(8),
                              onChanged: onChangeMotorBy,
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
