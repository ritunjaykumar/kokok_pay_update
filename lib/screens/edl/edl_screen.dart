import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/resources/routes_manager.dart';
import 'package:kokok_pay/screens/edl/edl_provider.dart';
import 'package:provider/provider.dart';

class EdlScreen extends StatefulWidget {
  const EdlScreen({Key? key}) : super(key: key);

  @override
  State<EdlScreen> createState() => _EdlScreenState();
}

class _EdlScreenState extends State<EdlScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EdlProvider>(
      create: (ctx) => EdlProvider(context)..init(),
      child: const _EdlScreenMain(),
    );
  }
}

///
class _EdlScreenMain extends StatefulWidget {
  const _EdlScreenMain({Key? key}) : super(key: key);

  @override
  State<_EdlScreenMain> createState() => _EdlScreenMainState();
}

class _EdlScreenMainState extends State<_EdlScreenMain> {
  final Color color = const Color(0xFF74b6d9);

  // final Color color = const Color(0xff55b5e1);
  final GlobalKey<FormState> _formKey = GlobalKey();
  String zone = 'North';
  String amount = '0';
  String description = '';
  bool search = false;
  String billNumber = '';

  // void searchBill() {
  //   search = true;
  //   setState(() {});
  // }

  void validateForm() {
    var validate = _formKey.currentState!.validate();
    print('validate: $validate');
    if (validate == false) return;
    _formKey.currentState!.save();
    search = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('EDL'),
        backgroundColor: color,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            ImagesFile.edlBanner,
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          // const SizedBox(height: 28),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 28),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22),
                  topLeft: Radius.circular(22),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('EDL Payment', style: textTheme.titleMedium),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Select Province'),
                            DropdownButtonFormField(
                              value: 'Test 1 Province',
                              items: ['Test 1 Province', 'Test 2 Province']
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: search ? null : (String? item) {},
                              isExpanded: true,
                              onSaved: (zone) {},
                            ),
                            const SizedBox(height: 12),
                            const Text('Bill Number'),
                            TextFormField(
                              readOnly: search,
                              decoration: InputDecoration(
                                hintText: 'Please Enter Bill Number',
                                suffixIcon: search
                                    ? null
                                    : IconButton(
                                        onPressed: validateForm,
                                        icon: const Icon(Icons.search),
                                      ),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (billNumber) {
                                if (billNumber == null || billNumber.isEmpty) {
                                  return 'Please enter Bill number';
                                }
                                return null;
                              },
                              onSaved: (billNumber) {
                                this.billNumber = billNumber!;
                              },
                            ),
                            if (search)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 12),
                                  const Text('Description'),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'please enter Description',
                                    ),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (amount) {
                                      this.amount = amount!;
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  const Text('Bill amount'),
                                  TextFormField(
                                    initialValue: '126335',
                                    decoration: const InputDecoration(
                                      hintText: 'Please enter bill amount',
                                    ),
                                    keyboardType: TextInputType.number,
                                    onSaved: (description) {
                                      this.description = description!;
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (search)
                      Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bill Details',
                                style:
                                    textTheme.titleMedium?.copyWith(color: colorScheme.primary),
                              ),
                              const SizedBox(height: 8),
                              _billInfoWidget('Bill Number', billNumber),
                              _billInfoWidget('Due Amount', '₭ 126335'),
                              _billInfoWidget('Due Month', 'June'),
                              _billInfoWidget('Year', '2023'),
                              _billInfoWidget('Address', '1A, Rue new, Vientiane'),
                            ],
                          ),
                        ),
                      ),
                    if (search)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(Routes.resultEdlScreen);
                            },
                            child: const Text('Pay Bill'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _billInfoWidget(String title, String value) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: textTheme.titleSmall),
            Text(value, style: textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

///#74b6d9
