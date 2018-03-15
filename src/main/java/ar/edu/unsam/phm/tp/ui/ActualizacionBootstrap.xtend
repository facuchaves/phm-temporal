package ar.edu.unsam.phm.tp.ui

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import ar.edu.unsam.phm.tp.viewModel.RepositorioProducto
import ar.edu.unsam.phm.tp.model.Producto

class ActualizacionBootstrap  extends CollectionBasedBootstrap {
	
	override run() {
		var RepositorioProducto repositorioProducto = RepositorioProducto.instance
		repositorioProducto.agregarProducto( 
			new Producto() => [
				nombreProducto = "Papel Higienico"
				stockActual = 0
			]
		)
	}
	
	
}