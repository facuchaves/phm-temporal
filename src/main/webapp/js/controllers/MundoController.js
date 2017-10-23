class MundoController{

    constructor(OponenteService,EntrenadorService){
       this.OponenteService = OponenteService
       this.EntrenadorService = EntrenadorService
       this.entrenador = new Entrenador()
       this.oponentes = []
       this.getEntrenador()
       this.getOponentes()
      
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
   

}
