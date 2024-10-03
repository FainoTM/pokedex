import 'package:dio/dio.dart';
import 'package:pokemon_api/model/pokemon_model.dart';


class PokemonApi {
  final Dio dio = Dio();
  final String apiLink = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=20';

  Future<List<Pokemon>> getPokemons() async {
    try {
      final response = await dio.get(apiLink);

      if (response.statusCode == 200) {
        List<Pokemon> pokemons = [];

        for (var result in response.data['results']) {
          final String apiPokemon = result['url'];

          final pokemonInfo = await dio.get(apiPokemon);
          pokemons.add(Pokemon.fromJson(pokemonInfo.data));
        }
        return pokemons;
      } else {
        throw Exception('Falha ao carregar os pokémons');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}