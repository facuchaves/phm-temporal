class PokemonController {
    
    constructor(pokemonService, $timeout) {
        this.pokemonService = pokemonService
        this.$timeout = $timeout
        this.errors = []
        this.pokemon = null
        this.getPokemon()
    }
  
    // TRAER POKEMON
    getPokemon() {
      this.pokemonService.find((response) => {
        this.pokemon = _.map(response.data, this.transformarAPokemon)
      }, (message) => { notificarError(this, message) })
    }
    
    transformarAPokemon(jsonPokemon) {
        return Pokemon.asPokemon(jsonPokemon)
      }

  }
  