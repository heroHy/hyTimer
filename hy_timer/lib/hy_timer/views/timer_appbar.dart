import 'package:flutter/material.dart';

class HYTimerAppBar extends StatelessWidget {
  const HYTimerAppBar({
    Key? key,
    required this.menuFc,
    required this.settingFc,
  }) : super(key: key);
  final void Function() menuFc;
  final void Function() settingFc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.maybeOf(context)!.padding.top),
      child: SizedBox(
        height: AppBar().preferredSize.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: menuFc,
                child: const Icon(
                  Icons.menu,
                  size: 25,
                ),
              ),
              InkWell(
                onTap: settingFc,
                child: const Icon(
                  Icons.settings,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
