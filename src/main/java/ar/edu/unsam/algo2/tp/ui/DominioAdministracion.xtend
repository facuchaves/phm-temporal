package ar.edu.unsam.algo2.tp.ui

import ar.edu.unsam.algo2.tp.command.AdministacionDelSistema
import ar.edu.unsam.algo2.tp.ui.viewModel.ModeloPoblarArea
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

import ar.edu.unsam.algo2.tp.observer.CustomObserver
import ar.edu.unsam.algo2.tp.command.AgregarAcciones
import ar.edu.unsam.algo2.tp.observer.NotificarNivelMasAltoObserver
import ar.edu.unsam.algo2.tp.observer.NotificarNivelMultiploDe5Observer
import ar.edu.unsam.algo2.tp.observer.NotificarSuperaNivelObserver
import ar.edu.unsam.algo2.tp.observer.RecompensaNivelDeterminadoObserver
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@Observable
class DominioAdministracion {

	List<Opcion> opciones = newArrayList
	var AdministacionDelSistema administrador = new AdministacionDelSistema()
	
	
	new(AdministradorApplication app) {

		opciones.add(new Opcion("Agregar Acciones", [|new AgregarAccionesWindow(app, this).open]))
		// opciones.add(new Opcion("Eliminar Acciones", [ | new PoblarAreaWindows(app, new Encuesta).open ]))
//		opciones.add(new Opcion("Poblar area", [|new PoblarAreaWindows(app, new Encuesta).open]))

//		opciones.add(new Opcion("Agregar Acciones", [ | new AgregarAccionesWindow(app, new ModeloAcciones, administrador).open ]))
		//opciones.add(new Opcion("Eliminar Acciones", [ | new PoblarAreaWindows(app, new Encuesta).open ]))
		opciones.add(new Opcion("Poblar area", [ | new PoblarAreaWindows(app, new ModeloPoblarArea , administrador).open ]))

	}

	
	def getProcesos() {
		administrador.listaComandos
	}

	var CustomObserver seleccionAccion
	var AgregarAcciones accionesNivel = new AgregarAcciones()
	var CustomObserver seleccionEliminar

	def getAcciones() {
		var notificarNivelmasAlto = new NotificarNivelMasAltoObserver()
		var notificarNivelMultiplo = new NotificarNivelMultiploDe5Observer()
		var notificarSuperaNivel = new NotificarSuperaNivelObserver()
		var recompensaNivelDeterminado = new RecompensaNivelDeterminadoObserver()
		#[notificarNivelmasAlto, notificarNivelMultiplo, notificarSuperaNivel, recompensaNivelDeterminado]
	}

	
	def void addAccion() {
		accionesNivel.agregarAccionIndividual(seleccionAccion)
	}

	def void removeAccion() {
		accionesNivel.eliminarAccionIndividual(seleccionEliminar)
	}
	
	@Dependencies("procesos")
	def void AgregarComando() {
		administrador.agregarComando(this.accionesNivel)
	}

}
