package ar.edu.unsam.phm.tp.viewModel

import ar.edu.unsam.phm.tp.model.Producto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class DetalleProductoModelo {

	var Producto producto = new Producto
	
	var String nombre
	
//	var CustomObserver seleccionAccion
//	var CustomObserver seleccionEliminar

	new() {
	}
	
	new(Producto producto) {
		this.producto = producto
	}
	
//	def getAcciones() {
//		RepositorioAcciones.instance.acciones
//	}
	
	/*
	 def void addAccion() {
		accion.agregarAccionIndividual(seleccionAccion)
	}

	def void removeAccion() {
		accion.eliminarAccionIndividual(seleccionEliminar)
	}
	
	
	def agregar(){
		RepositorioProcesos.instance.agregarProceso(accion)
	}
	*/
}
