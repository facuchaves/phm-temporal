package ar.edu.unsam.algo2.tp.command

import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Rectangulo {
	
	Point punto1
	Point punto2
	
	def double getXMaximo(){
		return if (punto1.x > punto2.x) punto1.x else punto2.x
	}
	
	def double getXMinimo(){
		return if (punto1.x < punto2.x) punto1.x else punto2.x
	}
	
	def double getYMaximo(){
		return if (punto1.y > punto2.y) punto1.y else punto2.y
	}
	
	def double getYMinimo(){
		return if (punto1.y < punto2.y) punto1.y else punto2.y
	}
	
	def double getArea(){
		var double ancho = YMaximo - YMinimo
		var double alto = XMaximo - XMinimo
		
		ancho * alto
	}
	
	def Point getPuntoEnRectangulo(){
		
		var double yValue = RandomUtils.getDoubleInRange( XMinimo , XMaximo )
		var double xValue = RandomUtils.getDoubleInRange( YMinimo , YMaximo )
		
		return new Point( xValue , yValue )
	
	}
	
	def boolean estaDentroDelRectangulo(Point punto){
		return ( XMinimo <= punto.x ) && ( punto.x <= XMaximo ) && ( YMinimo <= punto.y ) && ( punto.y <= YMaximo )    
	}
	
}