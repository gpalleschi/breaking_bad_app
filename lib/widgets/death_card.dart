import 'package:breaking_bad/screens/screens.dart';
import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DeathCard extends StatelessWidget {
  final String death;
  final int idxDeath;

  const DeathCard({required this.death, required this.idxDeath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DeathScreen(idxDeath: idxDeath,)));}, 
        child: Stack(
          children: [
            Positioned(left: 15, top:5, child: Container(color: Colors.grey[350], width: MediaQuery.of(context).size.width-45, height: 160,  )),
            Positioned(left: 15, top:10, child: Container(color: Colors.grey[300], width: MediaQuery.of(context).size.width-50, height: 160,  )),
            Positioned(left: 15, top:15, child: Container(color: Colors.grey[400], width: MediaQuery.of(context).size.width-55, height: 160,  )),
            PoliceFolder(),
            Positioned(left: 15, top: 5, child: Transform.rotate(angle: -0.21,child : Image.asset('assets/Albuquerque_Police_Department.png', width: MediaQuery.of(context).size.width*0.20))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: Container( width: MediaQuery.of(context).size.width-100 , child: Text(death, style: TextStyle(fontFamily: 'MomsTypeWriter', color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold ))))),
            Positioned(
              bottom: 30,
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

class PoliceFolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}