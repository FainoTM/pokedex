import 'package:get/get.dart';

import '../model/pokemon_model.dart';
import '../service/pokemon_api.dart';


class PokemonController extends GetxController {
  var isLoading = true.obs;
  var pokemons = <Pokemon>[].obs;

  final PokemonApi pokemonApi = PokemonApi();

  @override
  void onInit() {
    fetchPokemons();
    super.onInit();
  }

  void fetchPokemons() async {
    try {
      isLoading(true);
      pokemons.value = await pokemonApi.getPokemons();
    } finally {
      isLoading(false);
    }
  }

}