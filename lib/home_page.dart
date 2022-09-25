import 'package:flutter/material.dart';
import 'package:clase2509/bmi_brain.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double weight = 78;
  double height = 165;
  double ibm = 0;
  String imagen = "assets/images/image3.png";
  String estado = "normal";
  String resumen = "Buen trabajo, Sigue asi";


  BMIBrain mandarina = BMIBrain();



  CalculateIBM() {
    ibm = (weight / ((height / 100) * (height / 100)));
    print("${ibm}");

    setState(() {});
  }

  CambiarImagen() {
    if (ibm <= 18.5) {
      imagen = "assets/images/image3.png";
    } else if (ibm >= 18.5 && ibm <= 24.9) {
      imagen = "assets/images/image1.png";
    } else {
      imagen = "assets/images/image2.png";
    }
    setState(() {});
  }

  CambiarEstado() {
    if (ibm <= 18.5) {
      estado = "Peso Insuficiente";
      resumen = "Debes comer mas";
    } else if (ibm >= 18.5 && ibm <= 24.9) {
      estado = "Peso Normal";
      resumen = "sigue asi causa";
    } else {
      estado = "Sobrepeso";
      resumen = "deja el pan!!!";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff2b2d42),
        title: const Text(
          "IMC App",
          style: TextStyle(
            fontFamily: 'Manrope',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bienvenido, selecciona tu peso y altura:",
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xff2b2d42).withOpacity(0.80),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  weight.toInt().toString(),
                  style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: "Manrope",
                      color: Color(0xff2b2d42).withOpacity(0.80)),
                ),
                Text(
                  "kg",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Manrope",
                      color: Color(0xff2b2d42).withOpacity(0.80)),
                ),
              ],
            ),
            Slider(
              value: weight,
              min: 20,
              max: 200,
              onChanged: (double value) {
                weight = value;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toInt().toString(),
                  style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: "Manrope",
                      color: Color(0xff2b2d42).withOpacity(0.80)),
                ),
                Text(
                  "cm",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Manrope",
                      color: Color(0xff2b2d42).withOpacity(0.80)),
                ),
              ],
            ),
            Slider(
              value: height,
              min: 50,
              max: 220,
              onChanged: (double value) {
                height = value;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 14.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 48.0,
              child: ElevatedButton.icon(
                onPressed: () {
                  CalculateIBM();
                  CambiarImagen();
                  CambiarEstado();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2b2d42),
                ),
                icon: const Icon(
                  Icons.play_arrow_rounded,
                ),
                label: const Text(
                  "Calcular",
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Resultado:",
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xff2b2d42).withOpacity(0.80),
              ),
            ),
            Center(
              child: Image.asset(
                imagen,
                height: 180,
                width: 180,
                fit: BoxFit.contain,
              ),

              /*  child: Image.asset(
            '${imagen}',
            height: 180,
            width: 180,
            fit: BoxFit.contain,

              ),*/
            ),
            Column(
              children: [
                Text(
                  ibm.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xfff72585),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                child: Text(
                  estado,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff2b2d42).withOpacity(0.90),
                    fontWeight: FontWeight.normal,
                  ),
                ),

                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  resumen,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff2b2d42).withOpacity(0.80),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


