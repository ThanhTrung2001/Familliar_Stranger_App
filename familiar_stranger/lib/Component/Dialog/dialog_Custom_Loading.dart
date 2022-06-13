import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

//Must be a statefulWidget when using Animation (any) inside
class Dialog_Custom_Loading extends StatefulWidget {
  final String dialog_image_link;
  final String dialog_content;
  const Dialog_Custom_Loading({
     Key? key,
      required this.dialog_image_link,
      required this.dialog_content,
      }) : super(key: key);

  @override
  State<Dialog_Custom_Loading> createState() => _Dialog_Custom_LoadingState();
}

class _Dialog_Custom_LoadingState extends State<Dialog_Custom_Loading> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Transp_Color,
      child: Container(
      height: size.height*0.28,
      width: size.width*0.8,
      decoration: BoxDecoration(
        border: Border.all(width: 5.0, color: Color.fromARGB(255, 99, 53, 156)),
        color: Color.fromARGB(255, 220, 146, 231),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotationTransition(
            alignment: Alignment.center,
            turns: _controller,
            child: Image.asset(
              widget.dialog_image_link,
              height: 100,
              width: 100,
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
          child: Text(widget.dialog_content, style: TextStyle(fontFamily: 'ZenDots', fontSize: 30, color: Main_Text),textAlign: TextAlign.center,),
          ),
      ],
    ),
  ),
    );
  }
  //avoid bug when click outside to closing
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}