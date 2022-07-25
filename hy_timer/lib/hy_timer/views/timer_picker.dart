import 'package:flutter/cupertino.dart';

class HYtimerPicker extends StatelessWidget {
  const HYtimerPicker({
    Key? key,
    required this.dataList,
    required this.callBack,
  }) : super(key: key);
  final List dataList;
  final ValueChanged<int> callBack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 160,
      child: CupertinoPicker(
          diameterRatio: 160,
          itemExtent: 60,
          squeeze: 1,
          useMagnifier: true,
          magnification: 1,
          looping: true,
          selectionOverlay: const SizedBox(),
          onSelectedItemChanged: (position) {
            callBack(position);
          },
          children: dataList
              .map((e) => Text(
                    e.toString().padLeft(2, '0'),
                    textScaleFactor: 1.0,
                    style: const TextStyle(
                      fontSize: 50,
                      fontFamily: 'DIN',
                    ),
                  ))
              .toList()),
    );
  }
}
