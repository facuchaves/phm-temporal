class PokemonService {
    constructor($http) {
        this.$http = $http
    }

    find(callback, errorHandler) {
        this.$http.get('/pokemon').then(callback, errorHandler)
    }

}