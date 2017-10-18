class Pokeparada{
    constructor(nombre){
        this.nombre = nombre;
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
