package ar.edu.unsam.phm.tp.viewModel

import ar.edu.unsam.phm.tp.model.Producto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class AdministracionModelo {

	var Integer flagDependencies = 0
	var Producto productoSeleccionado

	new() {		
	}
	
	def getRepoProcesos() {
		RepositorioProducto.instance
	}
	
	//FIXME Ver como arreglarlo
	@Dependencies("flagDependencies")
	def getProductos() {
		repoProcesos.productos
	}

	def void actualizaFlagDependencies() {
		flagDependencies++
	}
	
	/**
	 * Elimina el proceso seleccionado de la lsita de procesos
	 */
	def eliminarProcesoSeleccionado() {
		productoSeleccionado = null
		actualizaFlagDependencies
	}
	
	def buscar(){
		
	}

}
