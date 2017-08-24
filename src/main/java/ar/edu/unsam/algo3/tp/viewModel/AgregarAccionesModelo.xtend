package ar.edu.unsam.algo3.tp.viewModel

import ar.edu.unsam.algo3.tp.model.command.AgregarAcciones
import ar.edu.unsam.algo3.tp.model.observer.CustomObserver
import ar.edu.unsam.algo3.tp.model.observer.NotificarNivelMasAltoObserver
import ar.edu.unsam.algo3.tp.model.observer.NotificarNivelMultiploDe5Observer
import ar.edu.unsam.algo3.tp.model.observer.NotificarSuperaNivelObserver
import ar.edu.unsam.algo3.tp.model.observer.RecompensaNivelDeterminadoObserver
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class AgregarAccionesModelo {

	var AgregarAcciones accion = new AgregarAcciones
	
	var String nombre
	
	var CustomObserver seleccionAccion
	var CustomObserver seleccionEliminar

	new() {
	}

	def getAcciones() {
		var notificarNivelmasAlto = new NotificarNivelMasAltoObserver()
		var notificarNivelMultiplo = new NotificarNivelMultiploDe5Observer()
		var notificarSuperaNivel = new NotificarSuperaNivelObserver()
		var recompensaNivelDeterminado = new RecompensaNivelDeterminadoObserver()
		#[notificarNivelmasAlto, notificarNivelMultiplo, notificarSuperaNivel, recompensaNivelDeterminado]
	}
	
	def void addAccion() {
		accion.agregarAccionIndividual(seleccionAccion)
	}

	def void removeAccion() {
		accion.eliminarAccionIndividual(seleccionEliminar)
	}
	
	
	def agregar(){
		RepositorioProcesos.instance.agregarProceso(accion)
	}
	
}
