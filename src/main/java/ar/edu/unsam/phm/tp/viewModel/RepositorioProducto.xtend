package ar.edu.unsam.phm.tp.viewModel

import ar.edu.unsam.phm.tp.model.Producto
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

/**
 * Repositorio de productos.
 */
@Observable
class RepositorioProducto {

	static var RepositorioProducto instance
	
	private new(){
		
	}
	
	public static def getInstance(){
		if( instance == null ){
			instance = new RepositorioProducto
		}
		return instance
	}
	
	@Accessors
	List <Producto> productos = new ArrayList()
	 
	def agregarProducto(Producto producto){
		productos.add(producto)
	}
	
	def editarProducto(Producto producto){
	}
	
	def eliminarProducto(Producto producto){
		if (productos.contains(producto)){
			productos.remove(producto)
		}
	}
	
}
