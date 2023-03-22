import 'package:flutter/material.dart';

class PraiseCounter extends StatefulWidget {
  PraiseCounter({Key? key}) : super(key: key);

  @override
  State<PraiseCounter> createState() => _PraiseCounterState();
}

class _PraiseCounterState extends State<PraiseCounter> {
  var appbarPraise = Key('app_bar_Praise');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: appbarPraise,
        title: const Text('PraiseCounter Screen'),
      ),
      body: Center(
        child: Text(
          'PraiseCounter',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
