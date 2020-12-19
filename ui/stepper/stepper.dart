import 'package:flutter/material.dart';
import 'package:flutter_stepper/uitl/size_util.dart';

class StepperScreen extends StatefulWidget {
  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {

  final _stepBarWidth = 40.0;
  double _step1BarWidth = 0.0;
  double _step2BarWidth = 0.0;
  double _step3BarWidth = 0.0;
  double _step4BarWidth = 0.0;

  var title='Personal';

  int currentIndex = 0;

  List<Widget> _widgetList = [];

  Widget getWidget(int index) => Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text("${index + 1}.0"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(onPressed: () {}, child: Icon(Icons.arrow_back_ios)),
                FlatButton(
                    onPressed: () {}, child: Icon(Icons.arrow_forward_ios)),
              ],
            )
          ],
        ),
      );

  void changeProgress(){
    switch(currentIndex){
      case 0:
         _step1BarWidth = 0.0;
         _step2BarWidth = 0.0;
         _step3BarWidth = 0.0;
         _step4BarWidth = 0.0;
         title='Personal';
         break;

      case 1:
        _step1BarWidth = 40.0;
        _step2BarWidth = 0.0;
        _step3BarWidth = 0.0;
        _step4BarWidth = 0.0;
        title='Address';

        break;

      case 2:
        _step1BarWidth = 40.0;
        _step2BarWidth = 40.0;
        _step3BarWidth = 0.0;
        _step4BarWidth = 0.0;
        title = 'Bank Details';
        break;
      case 3:
        _step1BarWidth = 40.0;
        _step2BarWidth = 40.0;
        _step3BarWidth = 40.0;
        _step4BarWidth = 0.0;
        title='Upload Docs';
        break;

      case 4:
        _step1BarWidth = 40.0;
        _step2BarWidth = 40.0;
        _step3BarWidth = 40.0;
        _step4BarWidth = 40.0;
        title='Preview';
        break;
    }

    print("Step1:$_step1BarWidth");
    print("Step2:$_step2BarWidth");
    print("Step3:$_step3BarWidth");
    print("Step4:$_step4BarWidth");

  }

  @override
  Widget build(BuildContext context) {
    SizeUtil().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('$title'),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            _headerStepper(),
            Expanded(
              child: IndexedStack(

                index: currentIndex,

                children: [
                  Container(
                    color: Colors.blueAccent,
                    width: SizeUtil.screenWidth,
                    height: SizeUtil.screenHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${currentIndex + 1}.0"),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    width: SizeUtil.screenWidth,
                    height: SizeUtil.screenHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${currentIndex + 1}.0"),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.lightGreen,
                    width: SizeUtil.screenWidth,
                    height: SizeUtil.screenHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${currentIndex + 1}.0"),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.limeAccent,
                    width: SizeUtil.screenWidth,
                    height: SizeUtil.screenHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${currentIndex + 1}.0"),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.amberAccent,
                    width: SizeUtil.screenWidth,
                    height: SizeUtil.screenHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${currentIndex + 1}.0"),
                      ],
                    ),
                  ),


                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              currentIndex>0?  FlatButton(onPressed: ()=>setState(() {currentIndex--; changeProgress();}) ,
                    child: Icon(Icons.arrow_back_ios)
                ):SizedBox(),

                currentIndex<4?  FlatButton(onPressed: ()=>setState(() {currentIndex++;changeProgress();}),
                    child: Icon(Icons.arrow_forward_ios)
                ):SizedBox(),

              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _headerStepper() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      currentIndex = 0;
                      changeProgress();
                    }),
                    child: Container(
                      child: CircleAvatar(
                        radius: getProportionateScreenHeight(20),
                        child: Text('1'),
                      ),
                    ),
                  ),
                  Container(
                    width: _stepBarWidth,
                    height: 4,
                    alignment: Alignment.centerLeft,
                    color: Colors.blue.shade50,
                    child: Container(
                      //width: _step1BarWidth ==0 ? 0 : _stepBarWidth/_step1BarWidth, //dynamic denominatior
                      width: _step1BarWidth ==0 ? 0 : _step1BarWidth,
                      height: 4,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      currentIndex = 1;
                      changeProgress();
                    }),
                    child: CircleAvatar(
                      radius: getProportionateScreenHeight(20),
                      child: Text('2'),
                    ),
                  ),
                  Container(
                    width: _stepBarWidth,
                    height: 4,
                    alignment: Alignment.centerLeft,
                    color: Colors.blue.shade50,
                    child: Container(
                      //width: _step2BarWidth == 0 ? 0 :_stepBarWidth/_step2BarWidth, //dynamic denominatior
                      width: _step2BarWidth == 0 ? 0 :_step2BarWidth,
                      height: 4,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      currentIndex = 2;
                      changeProgress();
                    }),
                    child: CircleAvatar(
                      radius: getProportionateScreenHeight(20),
                      child: Text('3'),
                    ),
                  ),
                  Container(
                    width: _stepBarWidth,
                    height: 4,
                    alignment: Alignment.centerLeft,
                    color: Colors.blue.shade50,
                    child: Container(
                      width: _step3BarWidth == 0 ? 0 : _step3BarWidth,
                      height: 4,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      currentIndex = 3;
                      changeProgress();
                    }),
                    child: CircleAvatar(
                      radius: getProportionateScreenHeight(20),
                      child: Text('4'),
                    ),
                  ),
                  Container(
                    width: _stepBarWidth,
                    height: 4,
                    alignment: Alignment.centerLeft,
                    color: Colors.blue.shade50,
                    child: Container(
                    //  width: _step4BarWidth == 0 ? 0: _stepBarWidth/_step4BarWidth,
                      width: _step4BarWidth == 0 ? 0: _step4BarWidth,
                      height: 4,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => setState(() {
                  currentIndex = 4;
                  changeProgress();
                }),
                child: CircleAvatar(
                  radius: getProportionateScreenHeight(20),
                  child: Text('5'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: getProportionateScreenWidth(70),
                alignment: Alignment.center,
                child: Text("Personal",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(11.0))),
              ),
              Container(
                width: getProportionateScreenWidth(70),
                alignment: Alignment.center,
                child: Text("Address",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(11.0))),
              ),
              Container(
                width: getProportionateScreenWidth(70),
                alignment: Alignment.center,
                child: Text("Bank Details",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.blue,
                        fontSize: getProportionateScreenHeight(11.0))),
              ),
              Container(
                width: getProportionateScreenWidth(70),
                alignment: Alignment.center,
                child: Text("Upload Docs",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(11.0))),
              ),
              Container(
                width: getProportionateScreenWidth(70),
                //color: Colors.red,
                alignment: Alignment.center,
                child: Text("Preview",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(11.0))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
