package ar.edu.unsam.algo3.tp.model

import org.uqbar.commons.model.annotations.Observable

@Observable
interface Entidad {
	
	def void validar()

	def int getId()

	def void setId(int id)
	
}
