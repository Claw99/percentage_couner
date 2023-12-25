import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percentcounertest/home/widgets/widgets.dart';
import 'widgets/myBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bodyController = TextEditingController();
  final mindController = TextEditingController();
  final spiritController = TextEditingController();

  double bodyPercent = 1;
  double mindPercent = 2;
  double spiritPercent = 3;

  insert() {
    print(bodyController.text);
    setState(() {
      if (bodyController.text.isNotEmpty) {
        bodyPercent = double.parse(bodyController.text);
        mindPercent = double.parse(mindController.text);
        spiritPercent = double.parse(spiritController.text);
      } else {
        print('no u  cant');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 55, 53, 53),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: Text('Percentage counter'),
        ),
        body: Column(
          children: [
            textField(bodyController, 'Body'),
            textField(mindController, 'Mind'),
            textField(spiritController, 'Spirit'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 140.h,
              width: 370.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Health Balance",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Last week',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: const Color.fromARGB(255, 190, 187, 187)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              explainer(Colors.yellow, 'Body', bodyPercent),
                              explainer(Colors.deepPurple, 'Mind', mindPercent),
                              explainer(Colors.blue, 'Spirit', spiritPercent),
                            ],
                          ),
                          CounterBar(
                            colors: const [
                              Colors.yellow,
                              Colors.deepPurple,
                              Colors.blue
                            ],
                            values: [bodyPercent, mindPercent, spiritPercent],
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: insert, child: Text('Insert value'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
