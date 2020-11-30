import 'package:appBarBottom/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Viva extends StatelessWidget {
  const Viva({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Viva',
        ),
      ),
    );
  }
}
