import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    padding: const EdgeInsets.only(top: 12.0),
    alignment: Alignment.center,
    child: const CircularProgressIndicator(
      backgroundColor: Colors.blue,
      valueColor: AlwaysStoppedAnimation(Colors.red),
    ),
  );
}
linearProgress() {
  return Container(
    padding: const EdgeInsets.only(top: 12.0),
    alignment: Alignment.center,
    child: const LinearProgressIndicator(
      backgroundColor: Colors.blue,
      valueColor: AlwaysStoppedAnimation(Colors.red),
    ),
  );
}
