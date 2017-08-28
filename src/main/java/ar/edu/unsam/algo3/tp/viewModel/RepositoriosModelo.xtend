package ar.edu.unsam.algo3.tp.viewModel

import ar.edu.unsam.algo3.tp.model.Repositorio
import ar.edu.unsam.algo3.tp.model.RepositorioEspecie
import ar.edu.unsam.algo3.tp.model.RepositorioPokeparada
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unsam.algo3.tp.ui.ActualizacionBootstrap
import ar.edu.unsam.algo3.tp.ui.utils.ModelWithListAndSelect

@Accessors
@Observable
class RepositoriosModelo extends ModelWithListAndSelect<Repositorio> {
	var ActualizacionBootstrap boot = new ActualizacionBootstrap
	var List<Repositorio> repositoriosLista
	var Repositorio repoSeleccionado
	var String nuevoNombreRepo
	
	new() {
	}
	@Dependencies("repositoriosLista")
	def getRepositoriosLista(){
		repositoriosLista.map[repo | repo.toString]
	}
	@Dependencies("repoSeleccionado")
	def getRepositorioSeleccionado(){
		repoSeleccionado
	}
	def agregarRepositorio(){
		if(!repositoriosLista.contains(repoSeleccionado))
			repositoriosLista.add(repoSeleccionado)
	}
	def eliminarRepositorio(){
		if(repositoriosLista.contains(repoSeleccionado))
			repositoriosLista.remove(repoSeleccionado)
	}
	def getRepositorios(){
		val RepositorioEspecie repositorioEspecie = RepositorioEspecie.instance	
		val RepositorioPokeparada repositorioPokeparada = RepositorioPokeparada.instance
		repositorioEspecie.description = "Repo Especie"
		repositorioPokeparada.description = "Repo Pokeparada"
		#[repositorioEspecie, repositorioPokeparada]
	}
	
	override getList() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override doOnAccept() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
