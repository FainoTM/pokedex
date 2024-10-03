
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/pokemon_model.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;
  DetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);


  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pokemon.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade800,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(width: 300, height: 300, child: Image.network(widget.pokemon.sprite, fit: BoxFit.fill,)),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.pokemon.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.pokemon.id.toString(),
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                margin:
                EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                elevation: 8,
                shadowColor: Colors.black,
                child: ListTile(
                  title: Text(
                      'Habilidades: ${widget.pokemon.abilities.toString().trim()})',
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}