import 'package:dropdown_search/dropdown_search.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lambda_dent_dash/constant/components/default_button.dart';
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
              bottomActionButtons(context),
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
                bottomActionButtons(context),
              ],
            ),
          ),
        ));
  }

  Row bottomActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return itemDeleteConfirmationDialog(context);
                  });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(color: redbackground),
              child: Icon(Icons.delete_outline_rounded, color: redmain),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return itemAddEditDialog(context);
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
    );
  }

  Dialog itemDeleteConfirmationDialog(BuildContext context) {
    return Dialog(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: redmid),
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width / 4,
                //height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'حذف مادة',
                            style: TextStyle(
                                color: redmain,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: .5,
                            width: 100,
                            color: redbackground,
                            margin: EdgeInsets.symmetric(vertical: 10),
                          ),
                          Text('هل أنت متأكد من حذف هذه المادة؟'),
                          SizedBox(
                            height: 20,
                          ),
                          redButton(
                              text: 'تأكيد الحذف',
                              function: () {
                                Navigator.of(context).pop();
                              })
                        ])))));
  }

  Dialog itemAddEditDialog(BuildContext context) {
    TextEditingController _itemnamecontroller =
        TextEditingController(text: 'سماكة 10');
    TextEditingController _itemunitcontroller =
        TextEditingController(text: 'بلوكة');
    TextEditingController _itemstandardquantitycontroller =
        TextEditingController(text: '50');
    TextEditingController _itemminimumquantitycontroller =
        TextEditingController(text: '10');
    final TextEditingController catmenuController = TextEditingController();
    final TextEditingController subcatmenuController = TextEditingController();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: cyan200),
                borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 1.3,
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'تعديل مادة',
                        style: TextStyle(
                            color: cyan400,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: .5,
                        width: 100,
                        color: cyan200,
                        margin: EdgeInsets.symmetric(vertical: 5),
                      ),
                      DropdownMenu<String>(
                          //initialSelection: menuItems.first,
                          width: MediaQuery.of(context).size.width / 4 - 16,
                          controller: catmenuController,
                          hintText: "اختر الصنف",
                          initialSelection: 'صنف1',
                          requestFocusOnTap: true,
                          enableFilter: true,
                          inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: cyan200, width: 1.0),
                                borderRadius: StandardBorderRadius),
                          ),
                          menuStyle: MenuStyle(
                              backgroundColor: WidgetStatePropertyAll(cyan100)),
                          label: const Text('الصنف الرئيسي'),
                          dropdownMenuEntries: [
                            DropdownMenuEntry(
                                value: 'صنف1', label: 'بلوكات زيركون'),
                            DropdownMenuEntry(
                                value: 'صنف2', label: 'بلوكات اكريل مؤقت'),
                            DropdownMenuEntry(
                                value: 'صنف3', label: 'بودرة خزف'),
                            DropdownMenuEntry(value: 'صنف4', label: 'شمع'),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownMenu<String>(
                          //initialSelection: menuItems.first,
                          //width: MediaQuery.of(context).size.width - 16.0,
                          width: MediaQuery.of(context).size.width / 4 - 16,
                          controller: subcatmenuController,
                          hintText: "اختر الصنف",
                          initialSelection: 'صنف1',
                          requestFocusOnTap: true,
                          enableFilter: true,
                          inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: cyan200, width: 1.0),
                                borderRadius: StandardBorderRadius),
                          ),
                          menuStyle: MenuStyle(
                              backgroundColor: WidgetStatePropertyAll(cyan100)),
                          label: const Text('الصنف الفرعي'),
                          dropdownMenuEntries: [
                            DropdownMenuEntry(value: 'صنف1', label: 'صيني'),
                            DropdownMenuEntry(value: 'صنف2', label: 'ألماني'),
                            DropdownMenuEntry(
                                value: 'صنف3', label: 'ملتي لاير'),
                            DropdownMenuEntry(
                                value: 'صنف4', label: 'عالي شفوفية'),
                            DropdownMenuEntry(value: 'صنف5', label: 'كتيم'),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      defaultTextField(
                        _itemnamecontroller,
                        context,
                        'اسم المادة',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defaultTextField(_itemunitcontroller, context, 'الواحدة'),
                      SizedBox(
                        height: 10,
                      ),
                      defaultTextField(_itemstandardquantitycontroller, context,
                          'الكمية القياسية'),
                      SizedBox(
                        height: 10,
                      ),
                      defaultTextField(_itemminimumquantitycontroller, context,
                          'الحد الأدنى للكمية'),
                      SizedBox(
                        height: 10,
                      ),
                      defaultButton(
                          text: 'تعديل',
                          function: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
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
