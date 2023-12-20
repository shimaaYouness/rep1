import 'package:flutter/material.dart';
import 'package:untitled/features/water/presentation/providers/bill_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/screen_size_manager.dart';

class YearComponent extends StatefulWidget {
  final BillProvider prov;

  //BillProvider billProvider = Provider.of<BillProvider>(context);

  YearComponent(this.prov, {Key? key}) : super(key: key);
  @override
  State<YearComponent> createState() => _YearComponentState();
}

class _YearComponentState extends State<YearComponent> {
  @override
  void initState() {
    widget.prov.year = DateTime.now().year;
   // widget.prov.updateYear(DateTime.now().year);
  }
  @override
  Widget build(BuildContext context) {
    void _nextYear() {
      setState(() {
        widget.prov.year! < DateTime.now().year
            ? widget.prov.year = widget.prov.year! + 1
            : {};
        widget.prov.updateYear(widget.prov.year!);
      });
    }

    void _prevYear() {
      setState(() {
        widget.prov.year = widget.prov.year! - 1;
        widget.prov.updateYear(widget.prov.year!);
      });
    }
    return Container(
      height: 50,
      // height: ScreenSizeManager.resize(
      //   originalSize: 55,
      //   resizeHeight: true,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: _prevYear,
              onLongPress: _prevYear,
              child: Icon(Icons.arrow_circle_left_outlined,
                  color: ColorManager.darkPrimary, size: 25
                  // size: ScreenSizeManager.resize(
                  //     originalSize: 40, resizeWidth: true),
                  )),
          Container(
              padding: const EdgeInsets.all(8),
              // height: ScreenSizeManager.resize(
              //   originalSize: 50,
              //   resizeHeight: true,
              // ),
              child: Text(
                  // context.watch<BillProvider>().year != null?context.watch<BillProvider>().year.toString() : DateTime.now().year.toString(),
                  //context.read<BillProvider>().year.toString(),
                  //Provider.of<BillProvider>(context, listen: true).year.toString(),
                  widget.prov.year.toString(),
                  style: TextStyle(
                      fontFamily: FontManager.primaryFontFamily,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.darkPrimary,
                      fontSize: 15
                      // ScreenSizeManager.resize(
                      //     originalSize: 18,
                      //     resizeHeight: true),
                      ))),
          GestureDetector(
            onTap: _nextYear,
            onLongPress: _nextYear,
            child: Icon(
              Icons.arrow_circle_right_outlined,
              color: ColorManager.darkPrimary,
              // size: ScreenSizeManager.resize(
              //     originalSize: 40,
              //     resizeWidth: true),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
