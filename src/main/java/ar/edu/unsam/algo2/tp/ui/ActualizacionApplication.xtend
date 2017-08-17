package ar.edu.unsam.algo2.tp.ui

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unsam.algo2.tp.Repositorio

@Observable
@Accessors
class ActualizacionApplication {
	var Repositorio repositorios
	var Repositorio repoSeleccionado
	
	def getRespositorios(){
		
	}
}