package ar.edu.unsam.algo2.tp.ui

import ar.edu.unsam.algo2.tp.command.AdministacionDelSistema
import ar.edu.unsam.algo2.tp.ui.viewModel.ModeloPoblarArea
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unsam.algo2.tp.command.AgregarAcciones
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.arena.windows.Dialog
import ar.edu.unsam.algo2.tp.command.Command
import ar.edu.unsam.algo2.tp.command.PoblarArea

@Accessors
@Observable
class DominioAdministracion {

	List<Opcion> opciones = newArrayList
	var AdministacionDelSistema administrador = new AdministacionDelSistema()
	var Command comandoSeleccionado
	var AdministradorApplication aplicacion

	var AgregarAcciones accionesNivel = new AgregarAcciones()

	new(AdministradorApplication app) {
		aplicacion = app
		opciones.add(new Opcion("Agregar Acciones", [|
			this.IniciarAcciones()
			this.abrirAcciones(new AgregarAccionesWindow(app, new DominioAcciones(accionesNivel)))
		]))
		opciones.add(new Opcion("Poblar area", [|new PoblarAreaWindows(app, new ModeloPoblarArea, administrador).open]))

	}

	@Dependencies("accionesNivel", "comandoSeleccionado")
	def getProcesos() {
		administrador.listaComandos
	}

	def void AgregarComando() {
		administrador.agregarComando(this.accionesNivel)
	}

	def abrirAcciones(Dialog<?> dialog) {
		dialog.onAccept[|this.AgregarComando() this.IniciarAcciones()]
		dialog.onCancel[this.IniciarAcciones()]
		dialog.open
	}

	def void IniciarAcciones() {
		accionesNivel = new AgregarAcciones()
	}

	def void editarComando() {
		editarDialogo(comandoSeleccionado)
	}

	def dispatch editarDialogo(AgregarAcciones _AgregarAcciones) {
		this.editarAcciones(new AgregarAccionesWindow(aplicacion, new DominioAcciones(_AgregarAcciones)))
		IniciarAcciones
	}

	def dispatch editarDialogo(PoblarArea _PoblarArea) {
	}

	def editarAcciones(Dialog<?> dialog) {
		dialog.open
	}

	def eliminarComando() {
		administrador.eliminar(comandoSeleccionado)
		comandoSeleccionado = null
	}

}
