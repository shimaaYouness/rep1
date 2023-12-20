import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/features/water/presentation/providers/bill_provider.dart';
import 'package:untitled/features/water/presentation/providers/year_provider.dart';

class BillsComponent extends StatelessWidget {
   BillsComponent({Key? key}) : super(key: key);
  // BillProvider prov = BillProvider();
  // @override
  // void initState() {
  //   prov.updateYear(DateTime.now().year);
  // }
  @override
  Widget build(BuildContext context) {
    //BillProvider prov = Provider.of<BillProvider>(context);
    //YearProvider  yearProv = Provider.of<YearProvider>(context);


    return  Container(
        height: 50,
        child: Consumer<YearProvider>(builder: (context, prov, child) {
          print('consumer ${prov.year}');
          return Text(prov.year.toString());
    })
      );


}}
