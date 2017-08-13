package ar.edu.unsam.algo2.tp

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class RepositorioPokemon extends Repositorio<Pokemon> {

	static var RepositorioPokemon instance

	@Accessors List<Pokemon> pokemones = new ArrayList()
	
	private new() {
	}

	public static def getInstance() {
		if (instance == null) {
			instance = new RepositorioPokemon
		}
		return instance
	}

	def agregarPokemon(Pokemon pokemon ){
		pokemones.add(pokemon)
	}
	
	def clear(){
		pokemones.clear
	}
	
	override parsearObjetos(String json) {
	}

	override getJson() {
	}
	
	override searchPorCriterioUnico(Pokemon objeto) {
	}
	
	override criterioDeBusquedaPorValor(Pokemon objeto, String string) {
	}
	
	override pisarObjetos(Pokemon objetoEncontrado, Pokemon objetoNuevo) {
	}

}