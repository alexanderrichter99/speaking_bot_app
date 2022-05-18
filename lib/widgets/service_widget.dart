import 'package:flutter/material.dart';

import '../states/core_service.dart';

class ServiceWidget extends InheritedWidget {
  final CoreService coreService;
  const ServiceWidget(
      {Key? key, required this.coreService, required Widget child})
      : super(key: key, child: child);
  static ServiceWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ServiceWidget>();
  }

  @override
  bool updateShouldNotify(ServiceWidget oldWidget) {
    return oldWidget.coreService != coreService;
  }
}
