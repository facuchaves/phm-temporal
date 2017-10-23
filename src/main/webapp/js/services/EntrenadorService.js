class EntrenadorService{
    constructor($http){
        this.$http = $http
    
    }

    findEntrenador(callback){
        this.$http.get('http://localhost:9000/entrenador/logeado').then(callback)

    }
    getUbicacion(callback){
        this.$http.get('http://localhost:9000/entrenador/ubicacion').then(callback)
    }

    mover(direccion, callback){
        switch(direccion) {
            case "arriba":
                this.$http.put('http://localhost:9000/entrenador/moverseArriba').then(callback)
                break;
            case "abajo":
                this.$http.put('http://localhost:9000/entrenador/moverseAbajo').then(callback)
                break;
            case "izquierda":
                this.$http.put('http://localhost:9000/entrenador/moverseIzquierda').then(callback)
                break;
            case "derecha":
                this.$http.put('http://localhost:9000/entrenador/moverseDerecha').then(callback)
                break;
        } 
    }

    findOponentes(callback){
        this.$http.get('http://localhost:9000/entrenador/oponentes').then(callback)
    }
    findPokemonesSalvajes(callback){
        this.$http.get('http://localhost:9000/entrenador/pokemonSalvaje').then(callback)
    }
}