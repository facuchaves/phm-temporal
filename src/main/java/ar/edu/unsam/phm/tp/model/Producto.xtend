package ar.edu.unsam.phm.tp.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Producto {
	
	new() {
		
	}
	
	var String nombreProducto
	var Integer stockActual
	
}
