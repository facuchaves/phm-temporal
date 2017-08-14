package ar.edu.unsam.algo2.tp.ui

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Zona {
	String descripcion
	List<Candidato> candidatos
	
	new(String descripcion) {
		this.candidatos = newArrayList
		this.descripcion = descripcion
	}
	
	def void agregarCandidato(String nombre, String partido) {
		this.candidatos.add(new Candidato(nombre, partido))
	}
	
	override toString() {
		descripcion
	}
	
}
