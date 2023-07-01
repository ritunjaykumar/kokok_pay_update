import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/result/result_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResultProvider>(
      create: (ctx) => ResultProvider(context)..init(),
      child: const _ResultScreenMain(),
    );
  }
}

///
class _ResultScreenMain extends StatefulWidget {
  const _ResultScreenMain({Key? key}) : super(key: key);

  @override
  State<_ResultScreenMain> createState() => _ResultScreenMainState();
}

class _ResultScreenMainState extends State<_ResultScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Lottie.asset(
              LottieFile.successLottie2,
              width: 100,
              height: 100,
            ),
            Text(
              'Payment Success',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction Amount',
                  style: textTheme.bodyLarge,
                ),
                Text(
                  '₭ 1234780',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.shade500,
              margin: const EdgeInsets.only(top: 8),
            ),
            const SizedBox(height: 10),
            Card(
              margin: EdgeInsets.zero,
              elevation: 0.8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _getTileList('transaction fee', '₭ 300'),
                    _getTileList('Transaction Id', '1238763492347'),
                    _getTileList('Sender', 'Mr. Inpone'),
                    _getTileList('Receiver', 'Mr. Fragrance'),
                    _getTileList('Date', '2023-06-20'),
                    _getTileList('Time', '12:34:97 PM'),
                    _getTileList('Description', 'paying my friends'),
                    _getTileList('transaction type', 'customer'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.star_border,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text('Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTileList(String title, String value) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium,
          ),
          Text(
            value,
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
