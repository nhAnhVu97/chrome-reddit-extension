// ignore_for_file: use_setters_to_change_properties

import 'dart:async';
import 'package:flutter/widgets.dart';

class Countdown extends StatefulWidget {
  final int seconds;

  final Widget Function(BuildContext, double) build;

  final Function()? onFinished;

  final Duration interval;

  final CountdownController? controller;

  const Countdown({
    super.key,
    required this.seconds,
    required this.build,
    this.interval = const Duration(seconds: 1),
    this.onFinished,
    this.controller,
  });

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  final int _secondsFactor = 1000000;

  Timer? _timer;

  bool _onFinishedExecuted = false;

  late int _currentMicroSeconds;

  @override
  void initState() {
    _currentMicroSeconds = widget.seconds * _secondsFactor;

    widget.controller?.setOnStart(_startTimer);
    widget.controller?.setOnPause(_onTimerPaused);
    widget.controller?.setOnResume(_onTimerResumed);
    widget.controller?.setOnRestart(_onTimerRestart);
    widget.controller?.isCompleted = false;

    if (widget.controller == null || widget.controller!.autoStart == true) {
      _startTimer();
    }

    super.initState();
  }

  @override
  void didUpdateWidget(Countdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.seconds != widget.seconds) _currentMicroSeconds = widget.seconds * _secondsFactor;
  }

  @override
  void dispose() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(
      context,
      _currentMicroSeconds / _secondsFactor,
    );
  }

  void _onTimerPaused() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
  }

  void _onTimerResumed() {
    _startTimer();
  }

  void _onTimerRestart() {
    widget.controller?.isCompleted = false;
    _onFinishedExecuted = false;

    if (mounted) {
      setState(() {
        _currentMicroSeconds = widget.seconds * _secondsFactor;
      });

      _startTimer();
    }
  }

  void _startTimer() {
    if (_timer?.isActive == true) {
      _timer!.cancel();

      widget.controller?.isCompleted = true;
    }

    if (_currentMicroSeconds != 0) {
      _timer = Timer.periodic(
        widget.interval,
        (Timer timer) {
          if (_currentMicroSeconds <= 0) {
            timer.cancel();

            if (widget.onFinished != null) {
              widget.onFinished?.call();
              _onFinishedExecuted = true;
            }
            widget.controller?.isCompleted = true;
          } else {
            _onFinishedExecuted = false;
            setState(() {
              _currentMicroSeconds = _currentMicroSeconds - widget.interval.inMicroseconds;
            });
          }
        },
      );
    } else if (!_onFinishedExecuted) {
      if (widget.onFinished != null) {
        widget.onFinished?.call();
        _onFinishedExecuted = true;
      }
      widget.controller?.isCompleted = true;
    }
  }
}

class CountdownController {
  VoidCallback? onPause;

  VoidCallback? onResume;

  VoidCallback? onRestart;

  VoidCallback? onStart;

  bool? isCompleted;

  final bool autoStart;

  CountdownController({this.autoStart = false});

  void start() {
    if (onStart != null) {
      onStart?.call();
    }
  }

  void setOnStart(VoidCallback onStart) {
    this.onStart = onStart;
  }

  void pause() {
    if (onPause != null) {
      onPause?.call();
    }
  }

  void setOnPause(VoidCallback onPause) {
    this.onPause = onPause;
  }

  void resume() {
    if (onResume != null) {
      onResume?.call();
    }
  }

  void setOnResume(VoidCallback onResume) {
    this.onResume = onResume;
  }

  void restart() {
    if (onRestart != null) {
      onRestart?.call();
    }
  }

  void setOnRestart(VoidCallback onRestart) {
    this.onRestart = onRestart;
  }
}
