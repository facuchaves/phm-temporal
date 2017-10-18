class Botonera{
    constructor() {
        this.axisY=0;
        this.axisX=0;
    }
    sumarY(){
        this.axisY = this.axisY + 1;
    }
    restarY(){
        this.axisY = this.axisY - 1;
    }
    sumarX(){
        this.axisX = this.axisX + 1;
    }
    restarX(){
        this.axisX = this.axisX - 1;
    }
}
class BotoneraService{
    constructor(){
        this.botonera = new Botonera();
    }
}
