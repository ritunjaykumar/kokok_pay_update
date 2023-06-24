part of 'bottomsheet_impl.dart';

class _AlertBottomSheetWidget extends StatelessWidget {
  const _AlertBottomSheetWidget({
    Key? key,
    required this.msg,
    required this.title,
    required this.closeCallback,
  }) : super(key: key);
  final String msg;
  final String title;
  final VoidCallback closeCallback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(SizeResource.value_12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.notifications,
                    color: theme.colorScheme.primary,
                  ),
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: closeCallback,
                icon: Icon(
                  Icons.close,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeResource.value_12,
          ),
          child: Text(msg, style: theme.textTheme.bodyMedium),
        ),
        ElevatedButton(
          onPressed: closeCallback,
          child: const Text('Dismiss'),
        ),
      ],
    );
  }
}
