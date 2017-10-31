const routes = ($stateProvider, $urlRouterProvider) => {
    
      $urlRouterProvider.otherwise("/mundo")
    
      $stateProvider
    
        .state('mundo', {
          url: "/mundo",
          templateUrl: "partials/mundo2.html",
          controller: "MundoController as mundoCtrl"
        })
        .state('entrenador', {
          url: "/entrenador",
          templateUrl: "partials/entrenadores2.html",
          controller: "EntrenadoresController as entrenadoresCtrl"
        })
    }
    