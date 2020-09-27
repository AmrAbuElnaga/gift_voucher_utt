import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftvoucher/welcome_screens/welcome_tour/model/welcome_tour_model.dart';
import 'package:giftvoucher/welcome_screens/welcome_tour/widget/welcome_tour_item.dart';
import 'package:page_indicator/page_indicator.dart';

class welcome_tour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageIndicatorContainer(
          child: PageView.builder(
              itemCount: welcome_tour_list().length,
              itemBuilder: (context, index) {
                return welcome_tour_item(welcome_tour_list()[index].image);
              }),
          align: IndicatorAlign.bottom,
          length: welcome_tour_list().length,
          indicatorSpace: 20.0,
          padding: const EdgeInsets.all(20),
          indicatorColor: Colors.grey,
          indicatorSelectorColor: Theme.of(context).primaryColor,
          shape: IndicatorShape.circle(size: 12),
        ),
      ),
    );
  }

  // ignore: missing_return
  List<welcome_tour_model> welcome_tour_list() {
    List<welcome_tour_model> arraylist = new List<welcome_tour_model>();
    arraylist.add(new welcome_tour_model("images/first_img.png"));
    arraylist.add(new welcome_tour_model("images/second_img.png"));
    arraylist.add(new welcome_tour_model("images/third_img.png"));

    return arraylist;
  }
}
