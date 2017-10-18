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


}