import 'package:flutter/material.dart';

extension BuildContextWidget on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarInfo(
    String label,
  ) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(label),
        showCloseIcon: true,
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarSuccess(
    String label,
  ) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(label),
        showCloseIcon: true,
        backgroundColor: Colors.green,
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarError(
    String label,
  ) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(label),
        showCloseIcon: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
