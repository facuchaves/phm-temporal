package ar.edu.unsam.algo3.tp.viewModel

import ar.edu.unsam.algo3.tp.model.Especie
import ar.edu.unsam.algo3.tp.model.Pokeparada
import ar.edu.unsam.algo3.tp.model.Repositorio
import ar.edu.unsam.algo3.tp.model.RepositorioEspecie
import ar.edu.unsam.algo3.tp.model.RepositorioPokeparada
import ar.edu.unsam.algo3.tp.ui.ActualizacionApplication
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unsam.algo3.tp.ui.ActualizacionBootstrap

@Accessors
@Observable
class DominioRepositorios {
	var ActualizacionBootstrap boot = new ActualizacionBootstrap
	var List<Repositorio> repositoriosLista
	var Repositorio repoSeleccionado
	var String nuevoNombreRepo
	RepositorioEspecie repositorioEspecie = RepositorioEspecie.instance	
	RepositorioPokeparada repositorioPokeparada = RepositorioPokeparada.instance
	
	new(ActualizacionApplication application) {

	}
	@Dependencies("repositoriosLista")
	def getRepositoriosLista(){
		repositoriosLista.map[repo | repo.toString]
	}
	@Dependencies("repoSeleccionado")
	def getNombreRepo(){
		repoSeleccionado.toString
	}
	@Dependencies("repoSeleccionado")
	def agregarRepositorio(){
		if(!repositoriosLista.contains(repoSeleccionado))
			repositoriosLista.add(repoSeleccionado)
	}
	@Dependencies("repoSeleccionado")
	def eliminarRepositorio(){
		if(repositoriosLista.contains(repoSeleccionado))
			repositoriosLista.remove(repoSeleccionado)
	}
	@Dependencies("repoSeleccionado")
	def getRepositorios(){
		
	}
}
