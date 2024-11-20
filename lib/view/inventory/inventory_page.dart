import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lambda_dent_dash/constant/components/default_textfield.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/view/inventory/pie_chart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({super.key});

  List<Map> info = [
    {
      'name': 'سماكة 12',
      'quantity': 150,
      'standard_quantity': 50,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 200,
      'standard_quantity': 100,
      'minimum': 40,
    },
    {
      'name': 'سماكة 12',
      'quantity': 120,
      'standard_quantity': 90,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 10,
      'standard_quantity': 70,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 120,
      'standard_quantity': 90,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 10,
      'standard_quantity': 70,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 120,
      'standard_quantity': 90,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 10,
      'standard_quantity': 70,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 120,
      'standard_quantity': 90,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 10,
      'standard_quantity': 70,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 120,
      'standard_quantity': 90,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 10,
      'standard_quantity': 70,
      'minimum': 20,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 700,
              child: InteractiveDonutChart()
                  .animate()
                  .rotate(duration: Duration(minutes: 60), begin: -20),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                width: 600,
                child: GridView.count(
                    childAspectRatio: 1,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 15,
                    children: List.generate(
                            info.length,
                            (index) =>
                                itemcard(context, info, index, onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InventoryPage()));
                                }))
                        .animate(
                          interval: Duration(milliseconds: 50),
                        )
                        .slide(duration: Duration(milliseconds: 300))
                        .fadeIn(
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 250))
                        .flip(duration: Duration(milliseconds: 200))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemcard(BuildContext context, List info, int index,
      {VoidCallback? onTap}) {
    return FlipCard(
        fill: Fill
            .fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        side: CardSide.FRONT, // The side to initially display.
        front: Container(
            child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      info[index]['name'],
                      style: TextStyle(color: cyan500, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: .5,
                      width: 100,
                      color: cyan200,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 170,
                        child: PercentCircle(context, info[index])),
                  ],
                ),
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  child: Container(
                                height: 500,
                                width: 500,
                                color: cyan500,
                              ));
                            });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                        ),
                        child: Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            TextEditingController _namecontroller =
                                new TextEditingController();
                            return Dialog(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        Text('تعديل عنصر'),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        defaultTextField(
                                          _namecontroller,
                                          context,
                                          'اسم العنصر',
                                        )
                                      ]))),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: cyan200,
                        ),
                        child: Icon(
                          Icons.edit_rounded,
                          color: cyan400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
        back: Container(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        info[index]['name'],
                        style: TextStyle(color: cyan500, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: .5,
                        width: 100,
                        color: cyan200,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ClipPath(
                        clipper: _TriangleCard(),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                            height: 170,
                            width: 250,
                            color: cyan50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('سعر العنصر الواحد/قطعة'),
                                Text(
                                  '50.000',
                                  style: TextStyle(color: cyan400),
                                ),
                                Text('تاريخ آخر شراء'),
                                Text(
                                  '2/5/2024',
                                  style: TextStyle(color: cyan300),
                                ),
                                Text('الحد الادنى'),
                                Text(
                                  '50',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Color.fromARGB(255, 228, 132, 132)),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    child: Container(
                                  height: 500,
                                  width: 500,
                                  color: cyan500,
                                ));
                              });
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                          ),
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Container(
                                  height: 500,
                                  width: 500,
                                  color: cyan500,
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: cyan200,
                          ),
                          child: Icon(
                            Icons.edit_rounded,
                            color: cyan400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget PercentCircle(BuildContext context, Map page_info) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularPercentIndicator(
        radius: 75,
        lineWidth: 5,
        percent: page_info['quantity'] / page_info['standard_quantity'] > 1
            ? 1
            : page_info['quantity'] / page_info['standard_quantity'],
        progressColor:
            page_info['quantity'] / page_info['standard_quantity'] < 0.4
                ? Colors.redAccent
                : cyan400,
        arcType: ArcType.HALF,
        arcBackgroundColor: cyan100,
        animation: true,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              page_info['quantity'].toString(),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 1.5,
              width: 50,
              color: Colors.black,
            ),
            Text(
              page_info['standard_quantity'].toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        animationDuration: 1500,
        curve: Curves.fastEaseInToSlowEaseOut,
        // footer: Text(
        //   // page_info['name']!,
        //   textAlign: TextAlign.center,
        //   style: TextStyle(fontSize: 16),
        // ),
      ),
    );
  }
}

class _TriangleCard extends CustomClipper<Path> {
  // _Triangle(int x,int y){}
  @override
  Path getClip(Size size) {
    final Path path = Path();
    //0,0
    path.lineTo(0, 0);
    path.lineTo(size.width / 3, size.height);
    path.lineTo(size.width * 2 / 3, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(size.width/2, 0);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    //   path.lineTo(size.width / 2, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
