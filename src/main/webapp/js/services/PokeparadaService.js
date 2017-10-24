class Pokeparada{
    constructor(){
        
    }
    static asPokeparada(jsonPokeparada) {
        return angular.extend(new Pokeparada(), jsonPokeparada)
  }
}
class PokeparadaService{
    constructor(){
        this.pokeparadas = [
            new Pokeparada('UNSAM - Tornavias'),
            new Pokeparada('UNSAM - Sociales'),
            new Pokeparada('UNSAM - Miguelete')
        ]
    }
}
