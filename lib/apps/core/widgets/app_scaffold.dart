import 'package:doctor_hunt/apps/core/widgets/app_back_ground.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  const AppScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: [
          AppBackGround(),
          Padding(
            padding: EdgeInsets.only(
              top:
                  (appBar?.preferredSize.height ?? 0) +
                  MediaQuery.of(context).padding.top,
            ),
            child: body,
          ),
        ],
      ),
    );
  }
}
