import 'dart:async';
import 'package:flutter/foundation.dart';


class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();

    _observeChanges = stream.asBroadcastStream().listen((_){
    notifyListeners();
  });
  }

  late final StreamSubscription<dynamic> _observeChanges;

  @override
  void dispose() {
    _observeChanges.cancel();
    super.dispose();
  }
}
