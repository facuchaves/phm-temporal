package ar.edu.unsam.algo3.tp.viewModel

import ar.edu.unsam.algo3.tp.model.Repositorio
import ar.edu.unsam.algo3.tp.model.RepositorioEspecie
import ar.edu.unsam.algo3.tp.model.RepositorioPokeparada
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unsam.algo3.tp.ui.utils.ModelWithListAndSelect
import ar.edu.unsam.algo3.tp.model.Entidad

@Accessors
@Observable
class RepositoriosModelo extends ModelWithListAndSelect<Repositorio<Entidad>> {
	var List<Repositorio<Entidad>> repositoriosLista
	var Repositorio<Entidad> repoSeleccionado
	var String nuevoNombreRepo
	
	new() {
	}
	@Dependencies("repositoriosLista")
	def getRepositoriosLista(){
//		if(repositoriosLista != null)
			repositoriosLista//.map[repo | repo.toString]
//		else
//			""
	}
	@Dependencies("repositoriosLista", "repoSeleccionado")
	def setRepositoriosLista(){
		repositoriosLista.add(repoSeleccionado)
	}
	@Dependencies("repoSeleccionado")
	def getRepositorioSeleccionado(){
		repoSeleccionado
	}
	def agregarRepositorio(){
		if(!repositoriosLista.contains(getRepoSeleccionado))
			repositoriosLista.add(getRepoSeleccionado)
	}
	def eliminarRepositorio(){
		if(repositoriosLista.contains(getRepoSeleccionado))
			repositoriosLista.remove(getRepoSeleccionado)
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
