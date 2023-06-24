import 'dart:async';

import 'package:flutter/material.dart';

class TimerManager {
  final Timer _timer;
  final VoidCallback _onFinished;

  TimerManager(int seconds, this._onFinished)
      : _timer = Timer(
          Duration(seconds: seconds),
          _onFinished,
        );

  TimerManager.periodic(int seconds, this._onFinished, {Function(int)? onTick, bool revers = false})
      : _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (timer.tick == seconds) {
            timer.cancel();
            _onFinished();
          } else {
            if (onTick != null) {
              onTick(revers ? (seconds - timer.tick - 1) : timer.tick);
            }
          }
        });

  void cancel() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }
}
