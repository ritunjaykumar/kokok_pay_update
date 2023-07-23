import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/topup/topup_provider.dart';
import 'package:provider/provider.dart';

class TopupScreen extends StatefulWidget {
  const TopupScreen({Key? key}) : super(key: key);

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TopupProvider>(
      create: (ctx) => TopupProvider(context)..init(),
      child: const _TopupScreenMain(),
    );
  }
}

///
class _TopupScreenMain extends StatefulWidget {
  const _TopupScreenMain({Key? key}) : super(key: key);

  @override
  State<_TopupScreenMain> createState() => _TopupScreenMainState();
}

class _TopupScreenMainState extends State<_TopupScreenMain> {
  String _topupType = 'Post Paid';
  final TextEditingController _mobileNumberController = TextEditingController();
  void _changeTopType(String? topup) {
    if (topup != null && _topupType != topup) {
      _topupType = topup;
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _mobileNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Topup')),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Topup Type', style: textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ["Pre Paid", 'Post Paid'].map((e) {
                      return RadioMenuButton<String>(
                        value: e,
                        groupValue: _topupType,
                        onChanged: _changeTopType,
                        child: Text(e, style: textTheme.titleMedium),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mobileNumberController,
                      decoration: InputDecoration(
                        label: const Text('Mobile Number'),
                        hintText: 'Mobile Number',
                        prefixIcon: const Icon(Icons.phone_android),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.person_add_alt_1),
                          onPressed: () async{
                            var mobileNumber =
                                await context.read<TopupProvider>().readContact();
                            if (mobileNumber != null) {
                              _mobileNumberController.text = mobileNumber;
                            }
                          },
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
}
