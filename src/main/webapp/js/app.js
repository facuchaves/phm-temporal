var myApp = angular.module("myApp",  ['ui.router']);
myApp.config(routes)
myApp.service('OponenteService', OponenteService)
myApp.service('EntrenadorService', EntrenadorService)
myApp.controller("MundoController", MundoController )
  
myApp.controller("EntrenadoresController", EntrenadoresController)


//myApp.controller('TodosLosOponentesControllers', OponenteController)

const pokemonSalvajeService = myApp.service('pokemonSalvajeService', PokemonSalvajeService)
myApp.controller('TodosLosPokemonesSalvajeControllers', PokemonSalvajeController)

//const pokeparadaService = myApp.service('pokeparadaService', PokeparadaService)
//myApp.controller('TodasLasPokeparadasControllers', PokeparadaController)

//const botoneraService = myApp.service('botoneraService', BotoneraService)
//myApp.controller('LaBotoneraController', BotoneraController)