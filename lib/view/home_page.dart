import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/pokemon_controller.dart';
import '../model/pokemon_model.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonController pokemonController = Get.put(PokemonController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokedex',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: Obx(() {
        if (pokemonController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                child: ListView.builder(
                  itemCount: pokemonController.pokemons.length,
                  itemBuilder: (context, index) {
                    Pokemon pokemon = pokemonController.pokemons[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => DetailPage(pokemon: pokemon));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SingleChildScrollView(
                          child: Center(
                            child: SizedBox(
                              width: 360,
                              child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.network(pokemon.sprite),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          pokemon.name,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(
                                          '#${pokemon.id.toString()}',
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
