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
import org.uqbar.arena.windows.Dialog
import ar.edu.unsam.algo2.tp.command.Command

@Accessors
@Observable
class DominioAdministracion {

	List<Opcion> opciones = newArrayList
	var AdministacionDelSistema administrador = new AdministacionDelSistema()
		List<Command> comandos = newArrayList
	var AgregarAcciones accionesNivel = new AgregarAcciones()
		
	new(AdministradorApplication app) {

		opciones.add(new Opcion("Agregar Acciones", [| this.abrirAcciones(new AgregarAccionesWindow(app, new DominioAcciones(accionesNivel))) ]))
	
		opciones.add(new Opcion("Poblar area", [ | new PoblarAreaWindows(app, new ModeloPoblarArea , administrador).open ]))

	}

	@Dependencies("accionesNivel")
	def getProcesos() {
		comandos
	}

	def void AgregarComando() {
		comandos.add(this.accionesNivel)
	}
	def abrirAcciones(Dialog<?> dialog){
		dialog.onAccept[|this.AgregarComando() accionesNivel=new AgregarAcciones() ]
		dialog.onCancel[this.IniciarAcciones()]
		dialog.open
	}
	def void IniciarAcciones(){
		accionesNivel=new AgregarAcciones()
	}
}	

