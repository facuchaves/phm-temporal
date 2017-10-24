package ar.edu.unsam.algo3.tp.model

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

class RepositorioEntrenador extends Repositorio<Entrenador> {

	static var RepositorioEntrenador instance

	@Accessors List<Entrenador> entrenadores = new ArrayList()
	
	private new() {
		create( new Entrenador() => [
			nombre = "Ash"
			ubicacion = new Point(-34.572219, -58.534893)
			equipo = newArrayList( RepositorioPokemon.instance.search("Pikachu").get(0) , RepositorioPokemon.instance.search("Charmander").get(0) )
			dinero=120
			deposito = newArrayList( RepositorioPokemon.instance.search("Charizard").get(0) )
			perfil = new Luchador()
			items = new HashMap
			agregarItem(RepositorioItem.instance.search("Pocion").get(0))
			agregarItem(RepositorioItem.instance.search("Pocion").get(0))
			agregarItem(RepositorioItem.instance.search("Pokebola").get(0))
		])
	}

	public static def getInstance() {
		if (instance == null) {
			instance = new RepositorioEntrenador
		}
		return instance
	}

	def agregarEntrenador(Entrenador entrenador ){
		entrenadores.add(entrenador)
	}
	
	def obtenerEntrenador(int index){
		entrenadores.get(index)
	}
	
	def clear(){
		entrenadores.clear
	}
	
	override parsearObjetos(String json) {
	}

	override getJson() {
	}
	
	override searchPorCriterioUnico(Entrenador objeto) {
	}
	
	override criterioDeBusquedaPorValor(Entrenador entrenador, String nombre) {
		nombre.equals( entrenador.nombre )
	}
	
	override pisarObjetos(Entrenador objetoEncontrado, Entrenador objetoNuevo) {
	}
	def oponentesCercanos(){
		new RepositorioOponentes().obtenerOponentes
	}
	def pokemonSalvajeCercanos(){
		 RepositorioPokemon.instance.obtenerSalvajes
	}
	def pokeparadasCercanas(){
		RepositorioPokeparada.instance.obtenerPokeparadas()
	}
}
