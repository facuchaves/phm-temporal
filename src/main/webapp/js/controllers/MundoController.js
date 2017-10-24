class MundoController{

    constructor(OponenteService,EntrenadorService){
       this.EntrenadorService = EntrenadorService
       this.entrenador = new Entrenador
       this.oponentes = []
       this.pokemonesSalvaje = []
       this.pokeparadas = []
       this.getEntrenador()
       this.getOponentes()
       this.getPokemonesSalvajes()
       this.getPokeparadas()
       this.mensajes=[]
       this.atrapado=[]
    }

    alertarEstado(){
        alert('aah')
    }

    getEntrenador(){
        this.EntrenadorService.findEntrenador((response)=>{
           this.entrenador = Entrenador.asEntrenador(response.data)
        })
    }
    getUbicacion(){
        return this.entrenador.ubicacion 
       
    }
    moverEntrenador(direccion){
        this.EntrenadorService.mover(direccion, (response)=>{
            this.getEntrenador()
        })
    }
    getOponentes(){
        this.EntrenadorService.findOponentes((response)=>{
            this.oponentes= _.map(response.data,Entrenador.asEntrenador)
        })
    }
   
    getPokemonesSalvajes(){
        this.EntrenadorService.findPokemonesSalvajes((response)=>{
            this.pokemonesSalvaje=_.map(response.data, Pokemon.asPokemon)
        })
    }

    getPokeparadas(){
        this.EntrenadorService.findPokeparadas((response)=>{
            this.pokeparadas=_.map(response.data, Pokeparada.asPokeparada)
        })
    }

    pelear(oponente){
       
        this.EntrenadorService.pelear(oponente,(response)=>{
           var data = response.data
           this.notificarPelea(data.status)
            this.getEntrenador()
            //this.getOponentes()
        })
    }
     notificarPelea(mensaje) {
         this.mensajes.pop()
         this.mensajes.push(mensaje)
         $('#exampleModal').modal();
    }

    atrapar(pokemon){
        this.EntrenadorService.atrapar(pokemon,(response)=>{
            var data = response.data
            this.notificarAtrapado(data.status)
            this.getEntrenador()
            this.getPokemonesSalvajes()
         })
    }

    notificarAtrapado(mensaje){
        this.mensajes.pop()
        this.mensajes.push(mensaje)
        $('#exampleModal').modal();
    }

    curar(pokeparada){
        this.EntrenadorService.curar(pokeparada,(response)=>{
          this.notificarAtrapado(response.data.status)
         })
    }
    
}
