import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/model/donut_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomConatiner extends StatelessWidget {
  final DonutItem item;
  final String src;
  const CustomConatiner({super.key, required this.item, required this.src});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ClipOval(
              child: Image.network(
                src,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
            Text(
              item.name,
              style: GoogleFonts.lato(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Batter: ", style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                Flexible(
                  child: Text(item.batters.batter.map((e) => e.type).join(", "),
                    style: GoogleFonts.lato(fontStyle: FontStyle.normal),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Topping: ", style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                Flexible(
                  child: Text(
                    item.topping.map((e) => e.type).join(", "),
                    style: GoogleFonts.lato(fontStyle: FontStyle.italic),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
