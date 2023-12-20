import 'package:flutter/material.dart';
import 'package:untitled/core/utils/enums.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import 'package:provider/provider.dart';
import '../providers/bill_provider.dart';
import '../providers/year_provider.dart';

class BillComponent extends StatelessWidget {
  BillComponent({Key? key}) : super(key: key);
  List<bool> selected = [];

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double heightSize = queryData.size.height - 350;

    BillProvider prov = Provider.of<BillProvider>(context);
    YearProvider yearProv = Provider.of<YearProvider>(context);
    return ChangeNotifierProvider<BillProvider>(
        create: (context) => BillProvider(),
        builder: (context, child) {
          if (prov.state == RequestState.loading && prov.allBillsList == null) {
            prov.getAllBills();
            return SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          else if (prov.state == RequestState.loaded && prov.billsByYear!.isEmpty) {
            return Container(
              child: Text('لا يوجد لهذا العام'),
            );
          } else if (prov.state == RequestState.error) {
            return Container(
              child: Text('حدث خطأ أثناء الاتصال بالبيانات'),
            );
          } else {
            print('prov.state ${prov.state} & List length ${prov.billsByYear!}');
            return Container();
          }
        });
  }
}
