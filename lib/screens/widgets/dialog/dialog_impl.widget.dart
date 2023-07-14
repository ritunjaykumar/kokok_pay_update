part of 'dialog_impl.dart';

class _ErrorDialogWidget extends StatelessWidget {
  const _ErrorDialogWidget(
    this._callback, {
    Key? key,
    this.errorMsg,
  }) : super(key: key);
  final VoidCallback _callback;
  final String? errorMsg;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(SizeResource.value_16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            appLocal.alert,
            style: theme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.error),
          ),
          Lottie.asset(
            LottieFile.failedLottie,
            fit: BoxFit.fill,
            width: SizeResource.value_80,
          ),
          Text(
            errorMsg ?? appLocal.somethingWentWrong,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: _callback,
              child: Text(appLocal.close),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressDialogWidget extends StatelessWidget {
  const _ProgressDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      LottieFile.progressLottie,
      height: SizeResource.value_100,
      width: SizeResource.value_100,
      fit: BoxFit.contain,
    );

    /*Padding(
      padding: const EdgeInsets.all(SizeResource.value_16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            LottieFile.progressLottie,
            fit: BoxFit.fill,
          ),
          Text(
            appLocal.pleaseWait,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );*/
  }
}

class _SuccessDialogWidget extends StatelessWidget {
  const _SuccessDialogWidget(this.msg, this._callback, this._okCallback, {Key? key})
      : super(key: key);
  final String msg;
  final VoidCallback _callback;
  final VoidCallback? _okCallback;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(SizeResource.value_16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            appLocal.information,
            style: theme.textTheme.titleLarge,
          ),
          Lottie.asset(
            LottieFile.successLottie,
            width: SizeResource.value_150,
            height: SizeResource.value_150,
            fit: BoxFit.fill,
          ),
          Text(
            msg,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                _callback();
                if (_okCallback != null) {
                  _okCallback!();
                }
              },
              child: Text(appLocal.close),
            ),
          ),
        ],
      ),
    );
  }
}

class _NetworkErrorDialogWidget extends StatelessWidget {
  const _NetworkErrorDialogWidget(this._closeCallback, this._retryCallback, {Key? key})
      : super(key: key);
  final VoidCallback _closeCallback;
  final VoidCallback _retryCallback;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(SizeResource.value_16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            appLocal.networkErrorTitle,
            style: theme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.error),
          ),
          Lottie.asset(
            LottieFile.errorLottie,
            fit: BoxFit.fill,
          ),
          Text(
            appLocal.networkErrorBody,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _closeCallback,
                child: Text(appLocal.close),
              ),
              TextButton(
                onPressed: () {
                  _closeCallback();
                  _retryCallback();
                },
                child: Text(appLocal.retry),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ConfirmationDialogWidget extends StatelessWidget {
  const _ConfirmationDialogWidget(
    this.title,
    this.body,
    this._closeCallback,
    this._positiveAction, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String body;
  final VoidCallback _closeCallback;
  final VoidCallback _positiveAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(SizeResource.value_12),
      child: SizedBox(
        height: SizeResource.dialogSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              body,
              style: theme.textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: _closeCallback, child: const Text('No')),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    _closeCallback();
                    _positiveAction();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//==========================
class _YesNoDialogWidget extends StatelessWidget {
  const _YesNoDialogWidget(
    this._positiveAction,
    this._closeCallback,
    this._noCallback, {
    Key? key,
    required this.yesNoDialogData,
  }) : super(key: key);

  final YesNoDialogData yesNoDialogData;
  final VoidCallback _closeCallback;
  final VoidCallback _positiveAction;
  final VoidCallback? _noCallback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: SizeResource.value_200,
      padding: const EdgeInsets.all(SizeResource.value_16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeResource.value_12,
        ),
        /*border: Border.all(
          color: theme.colorScheme.primary,
        ),*/
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getWidget(theme),
          Text(
            yesNoDialogData.title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: yesNoDialogData.titleColor ?? theme.colorScheme.primary,
            ),
          ),
          Text(
            yesNoDialogData.subTitle,
            style: theme.textTheme.titleMedium?.copyWith(
              color: yesNoDialogData.subtitleColor ?? theme.colorScheme.primary,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _closeCallback();
                    if (_noCallback != null) {
                      _noCallback!();
                    }
                  },
                  child: const Text('NO'),
                ),
              ),
              const SizedBox(width: SizeResource.value_12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _closeCallback();
                    _positiveAction();
                  },
                  child: const Text('Yes'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _getWidget(ThemeData theme) {
    if (yesNoDialogData.widget != null) {
      return yesNoDialogData.widget!;
    } else {
      return Icon(
        yesNoDialogData.iconData,
        color: yesNoDialogData.iconColor ?? theme.colorScheme.primary,
        size: SizeResource.value_32,
      );
    }
  }
}

class _BankDialogWidget extends StatelessWidget {
  const _BankDialogWidget({
    Key? key,
    required this.bankData,
    required this.onTabCallback,
    required this.dismissCallback,
  }) : super(key: key);
  final List<BankDataResp> bankData;
  final void Function(BankDataResp bankData) onTabCallback;
  final VoidCallback dismissCallback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeResource.value_8,
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: SizeResource.value_45,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(SizeResource.value_22),
                topRight: Radius.circular(SizeResource.value_22),
              ),
            ),
            child: Text(
              'Select Bank',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Text(bankData[i].name),
                  /*leading: Image.network(
                    bankData[i].url,
                    height: SizeResource.value_32,
                  ),*/
                  leading: FadeInImage(
                    image: NetworkImage(bankData[i].url),
                    placeholder: const AssetImage(ImagesFile.placeholder),
                    height: SizeResource.value_32,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    dismissCallback();
                    onTabCallback(bankData[i]);
                  },
                );
              },
              separatorBuilder: (ctx, i) {
                return Container(
                  height: 1,
                  color: theme.colorScheme.tertiary.withOpacity(.5),
                );
              },
              itemCount: bankData.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: SizeResource.value_12,
              bottom: SizeResource.value_8,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: dismissCallback,
                child: const Text('Dismiss'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
