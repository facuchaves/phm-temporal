package ar.edu.unsam.algo3.tp.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class RepositorioEntrenador extends Repositorio<Entrenador> {

	static var RepositorioEntrenador instance

	@Accessors List<Entrenador> entrenadores = new ArrayList()
	
	private new() {
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
	
	override criterioDeBusquedaPorValor(Entrenador objeto, String string) {
	}
	
	override pisarObjetos(Entrenador objetoEncontrado, Entrenador objetoNuevo) {
	}
	
}
