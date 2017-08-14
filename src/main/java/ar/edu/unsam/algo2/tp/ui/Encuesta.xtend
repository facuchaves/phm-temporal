package ar.edu.unsam.algo2.tp.ui

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Encuesta {
	Zona zonaVotacion
	Candidato candidato

	def getZonas() {
		val caba = new Zona("CABA")
		caba.agregarCandidato("Horacio Rodriguez Larreta", "PRO")
		caba.agregarCandidato("Martin Lousteau", "Eco")
		caba.agregarCandidato("Gabriela Michetti", "PRO")
		caba.agregarCandidato("Gustavo Tenaglia", "Partido Humanista")
		caba.agregarCandidato("Myriam Bregman", "Frente de Izquierda")

		val bsas = new Zona("Buenos Aires")
		bsas.agregarCandidato("Anibal Fernandez", "FpV")
		bsas.agregarCandidato("Julian Dominguez", "FpV")
		bsas.agregarCandidato("Maria Eugenia Vidal", "PRO")
		bsas.agregarCandidato("Jaime Linares", "Frente Progresista")
		bsas.agregarCandidato("Felipe Sola", "UNA")
		bsas.agregarCandidato("Christian Castillo", "PTS")

		val nacional = new Zona("Eleccion Nacional")
		nacional.agregarCandidato("Daniel Scioli", "FpV")
		nacional.agregarCandidato("Mauricio Macri", "PRO")
		nacional.agregarCandidato("Margarita Stolbizer", "Progresistas")
		nacional.agregarCandidato("Sergio Massa", "Frente Renovador")
		nacional.agregarCandidato("Elisa Carrio", "UNA")

		#[caba, bsas, nacional]
	}
	
	def sumarVoto() {
		candidato.sumarVoto
	}
	
	
}
