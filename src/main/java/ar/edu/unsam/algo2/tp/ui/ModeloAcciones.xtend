package ar.edu.unsam.algo2.tp.ui

import org.uqbar.commons.model.annotations.Observable
import ar.edu.unsam.algo2.tp.observer.CustomObserver
import ar.edu.unsam.algo2.tp.observer.NotificarNivelMasAltoObserver
import ar.edu.unsam.algo2.tp.observer.NotificarNivelMultiploDe5Observer
import ar.edu.unsam.algo2.tp.observer.NotificarSuperaNivelObserver
import ar.edu.unsam.algo2.tp.observer.RecompensaNivelDeterminadoObserver
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unsam.algo2.tp.command.AgregarAcciones

@Observable
@Accessors
class ModeloAcciones {
	
 	var CustomObserver	seleccionAccion 
	var AgregarAcciones accionesNivel =  new AgregarAcciones()
	
	
	def getAcciones(){
		var notificarNivelmasAlto = new NotificarNivelMasAltoObserver()
		var notificarNivelMultiplo = new NotificarNivelMultiploDe5Observer()
		var notificarSuperaNivel = new NotificarSuperaNivelObserver()
		var recompensaNivelDeterminado = new RecompensaNivelDeterminadoObserver()
			#[notificarNivelmasAlto, notificarNivelMultiplo, notificarSuperaNivel,recompensaNivelDeterminado]
	}
	
	
	def void addAccion(){
		accionesNivel.agregarAccionIndividual(seleccionAccion)
	}
	
	
}