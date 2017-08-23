package ar.edu.unsam.algo2.tp.ui


import ar.edu.unsam.algo2.tp.observer.CustomObserver
import ar.edu.unsam.algo2.tp.command.AgregarAcciones
import ar.edu.unsam.algo2.tp.observer.NotificarNivelMasAltoObserver
import ar.edu.unsam.algo2.tp.observer.NotificarNivelMultiploDe5Observer
import ar.edu.unsam.algo2.tp.observer.NotificarSuperaNivelObserver
import ar.edu.unsam.algo2.tp.observer.RecompensaNivelDeterminadoObserver
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable


@Accessors
@Observable
class DominioAcciones {

	var AgregarAcciones accion
	
	var CustomObserver seleccionAccion
	var CustomObserver seleccionEliminar

	new(AgregarAcciones _A) {
		accion = _A
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
