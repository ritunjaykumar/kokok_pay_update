/// toast position: 1:top, 2:center, 3:bottom
/// toast type: 0: success, 1: warning, 2: failed
enum ToastPosition {
  top('1'),
  center('2'),
  bottom('3');

  const ToastPosition(this.position);

  final String position;

  static ToastPosition getToastPosition(String position) {
    for (ToastPosition toast in ToastPosition.values) {
      if (toast.position == position) {
        return toast;
      }
    }
    return ToastPosition.bottom;
  }
}

enum ToastType {
  success('0'),
  warning('1'),
  failed('2'),
  normal('3');

  final String type;

  const ToastType(this.type);

  static ToastType getToastType(String type) {
    for (ToastType tt in ToastType.values) {
      if (tt.type == type) {
        return tt;
      }
    }
    return ToastType.normal;
  }
}

class ToastData {
  String message;
  ToastPosition position;
  ToastType type;

  ToastData.success({
    required String message,
    ToastPosition position = ToastPosition.bottom,
  }) : this(message, ToastType.success, position);

  ToastData.warning({
    required String message,
    ToastPosition position = ToastPosition.bottom,
  }) : this(message, ToastType.warning, position);

  ToastData.failed({
    required String message,
    ToastPosition position = ToastPosition.bottom,
  }) : this(message, ToastType.failed, position);

  ToastData(
    this.message, [
    this.type = ToastType.normal,
    this.position = ToastPosition.bottom,
  ]);
}
