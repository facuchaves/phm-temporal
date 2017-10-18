class MundoController{

    constructor(OponenteService,EntrenadorService){
       this.oponentes = OponenteService.oponentes
       this.EntrenadorService = EntrenadorService
       this.getEntrenador()
        this.entrenador = new Entrenador()
    }

    alertarEstado(){
        alert('aah')
    }

    getEntrenador(){
        this.EntrenadorService.findEntrenador((response)=>{
           entrenador.asEntrenador(response.data)
        })
    }
    getUbicacion(){
       // return this.entrenador.nombre  
    }

}
