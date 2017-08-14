package ar.edu.unsam.algo2.tp.ui

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Candidato {
	String nombre
	String partido
	int votos
	
	new(String nombre, String partido) {
		this.nombre = nombre
		this.partido = partido
	}
	
	override toString() {
		nombre + " (" + partido + ") - " + getVotos() + " votos"
	}
	
	def sumarVoto() {
		votos++
	}
	
}
