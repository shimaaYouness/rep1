import 'package:flutter/material.dart';
import 'package:untitled/core/utils/enums.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/shared_components/card_with_header.dart';
import '../providers/get_all_briza_provider.dart';
import 'package:provider/provider.dart';

class BrizaComponent extends StatefulWidget {
  const BrizaComponent({Key? key}) : super(key: key);

  @override
  State<BrizaComponent> createState() => _BrizaComponentState();
}

class _BrizaComponentState extends State<BrizaComponent> {
  List<bool> selected = [];
  int selectfirst =0;
  BrizaProvider prov = BrizaProvider();

  @override
  void initState() {
    prov.getAllBriza();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // BrizaProvider prov = Provider.of<BrizaProvider>(context);
   // print('Build Briza');
    return ListenableBuilder(
        listenable: prov,
        //listenable: prov.state,
        builder: (context, child) {
          switch (prov.state) {
            case RequestState.loading:
              return SizedBox(
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            case RequestState.loaded:
              return Container(
                margin: EdgeInsets.all(15),
                height: 100,
                // height: ScreenSizeManager.resize(originalSize: 120, resizeHeight: true),
                child: Row(
                  children: List.generate(prov.allBrizaList!.length, (index) {
                    if (selectfirst == 0) {
                      selected.add(true);
                      selected.add(false);
                    }
                    ++selectfirst;
                    selected.add(false);
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // brizaSelected = true;
                            // prov.briza_no = prov.brizaList[index].briza;
                            // prov.city = prov.brizaList[index].city;
                            // prov.getWaterBillsByUser();
                            for (int i = 0; i < selected.length; i++) {
                              selected[i] = i == index ? true : false;
                            }
                          });
                        },
                        child: Container(
                          child: CardWithHeader(
                            headerText:
                                prov.allBrizaList![index].briza.toString(),
                            bodyText: (prov.allBrizaList![index].city == 1)
                                ? 'بورسعيد'
                                : (prov.allBrizaList![index].city == 2)
                                    ? 'الاسماعيلية'
                                    : (prov.allBrizaList![index].city == 3)
                                        ? 'السويس'
                                        : ' ',
                            isSelected: selected[index],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            case RequestState.error:
              return Container(
                child:Text('حدث خطأ أثناء الاتصال بالبيانات'),
              );
          }
        });
    // return ChangeNotifierProvider<BrizaProvider>(
    //   create: (context) => BrizaProvider(),
    //   builder: (context, state) {
    //     print(prov.state);
    //     switch (prov.state) {
    //       case RequestState.loading:
    //         return SizedBox(
    //           height: 50,
    //           child: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //
    //       case RequestState.loaded:
    //         return Container(
    //           margin:  EdgeInsets.all(15),
    //           height: 100,
    //          // height: ScreenSizeManager.resize(originalSize: 120, resizeHeight: true),
    //           child: Row(
    //             children: List.generate(prov.allBrizaList!.length, (index) {
    //               // if (selectfirst == 0) {
    //               //   selected.add(true);
    //               //   selected.add(false);
    //               // }
    //               // ++selectfirst;
    //               selected.add(false);
    //               return Expanded(
    //                 child: GestureDetector(
    //                   onTap: () {
    //                     setState(() {
    //                       // brizaSelected = true;
    //                       // prov.briza_no = prov.brizaList[index].briza;
    //                       // prov.city = prov.brizaList[index].city;
    //                       // prov.getWaterBillsByUser();
    //                       // for (int i = 0; i < selected.length; i++) {
    //                       //   selected[i] = i == index ? true : false;
    //                       // }
    //                     });
    //                   },
    //                   child: CardWithHeader(
    //                     headerText: prov.allBrizaList![index].briza.toString(),
    //                     bodyText: (prov.allBrizaList![index].city == 1)
    //                         ? 'بورسعيد'
    //                         : (prov.allBrizaList![index].city == 2)
    //                             ? 'الاسماعيلية'
    //                             : (prov.allBrizaList![index].city == 3)
    //                                 ? 'السويس'
    //                                 : ' ',
    //                     isSelected: selected[index],
    //                   ),
    //                 ),
    //               );
    //             }),
    //           ),
    //         );
    //       case RequestState.error:
    //       return Container();
    //     }
    //   },
    // );
  }
}
