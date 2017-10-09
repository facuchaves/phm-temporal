package ar.edu.unsam.algo3.tp.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class RepositorioPokemon extends Repositorio<Pokemon> {

	static var RepositorioPokemon instance

	@Accessors List<Pokemon> pokemones = new ArrayList()

	private new() {

		create( new Pokemon() => [
			nombre = "Charmander"
			especie = RepositorioEspecie.instance.search("Fuego").get(0)
			puntosDeSalud = 50
			experiencia = 2000
			genero = Genero.FEMENINO
			])

		create(new Pokemon() => [
			nombre = "Pikachu"
			especie = RepositorioEspecie.instance.search("Electrico").get(0)
			puntosDeSalud = 150
			experiencia = 200
			genero = Genero.MASCULINO
		])

	}

	public static def getInstance() {
		if (instance == null) {
			instance = new RepositorioPokemon
		}
		return instance
	}

	def agregarPokemon(Pokemon pokemon) {
		pokemones.add(pokemon)
	}

	def clear() {
		pokemones.clear
	}

	override parsearObjetos(String json) {
	}

	override getJson() {
	}

	override searchPorCriterioUnico(Pokemon objeto) {
	}

	override criterioDeBusquedaPorValor(Pokemon pokemon, String nombre) {
		nombre.equals( pokemon.nombre )
	}

	override pisarObjetos(Pokemon objetoEncontrado, Pokemon objetoNuevo) {
	}

}
