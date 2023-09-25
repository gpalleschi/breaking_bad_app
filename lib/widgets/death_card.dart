import 'package:breaking_bad/screens/screens.dart';
import 'package:flutter/material.dart';

class DeathCard extends StatelessWidget {
  final String death;
  final int idxDeath;

  // ignore: use_key_in_widget_constructors
  const DeathCard({required this.death, required this.idxDeath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DeathScreen(idxDeath: idxDeath,)));}, 
        child: Stack(
          children: [
            Positioned(left: 10, top:115, child: Container(decoration: BoxDecoration(color: Colors.grey[350], border: Border.all(color: Colors.black87, width: 1)), width: MediaQuery.of(context).size.width-70, height: 160,  )),
            Positioned(left: 10, top:120, child: Container(decoration: BoxDecoration(color: Colors.grey[300], border: Border.all(color: Colors.black87, width: 1)), width: MediaQuery.of(context).size.width-75, height: 160,  )),
            Positioned(left: 10, top:125, child: Container(decoration: BoxDecoration(color: Colors.grey[400], border: Border.all(color: Colors.black87, width: 1)), width: MediaQuery.of(context).size.width-80, height: 160,  )),
            PoliceFolder(),
            Positioned(left: 15, top: 120, child: Transform.rotate(angle: -0.21,child : Image.asset('assets/images/Albuquerque_Police_Department.png', width: MediaQuery.of(context).size.width*0.20))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: SizedBox( width: MediaQuery.of(context).size.width-100 , child: Text(death, style: const TextStyle(fontFamily: 'MomsTypeWriter', color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold ))))),
            Positioned(
              bottom: 140,
              right: 30,
              child: Transform.rotate(angle: 0.25,
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.red.withOpacity(0.5))),
                child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Classified', style: TextStyle(color: Colors.red.withOpacity(0.5), fontSize: 30),),
              ))),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class PoliceFolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width, 
        height: 200.0,
        child: CustomPaint(
          painter: PoliceFolderPainter(),
        ),
      ),
    );
  }
}

class PoliceFolderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xffCEB086)
      ..style = PaintingStyle.fill;
    final path = Path();
    // Disegna il corpo della cartella
    path.moveTo(10, 0);
    path.lineTo(size.width/2-10 , 0);
    canvas.drawCircle( Offset(size.width/2-10 , 10), 20*.5, paint );
    path.lineTo(size.width/2 , 5);
    path.lineTo(size.width/2+40, 40);
    path.lineTo(size.width-10 , 40);
    path.lineTo(size.width-10 , 200);
    path.lineTo(10 , 200);
    path.lineTo(10 , 0);
    canvas.drawPath(path, paint);

    paint.color =  Colors.black87;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    //path.moveTo(10, 0);
    //path.lineTo(size.width/2-10 , 0);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}