package ar.edu.unsam.algo3.tp.viewModel

import ar.edu.unsam.algo3.tp.model.command.AgregarAcciones
import ar.edu.unsam.algo3.tp.model.command.Command
import ar.edu.unsam.algo3.tp.model.command.PoblarArea
import ar.edu.unsam.algo3.tp.ui.AgregarAccionesWindow
import ar.edu.unsam.algo3.tp.ui.EditarAccionesWindow
import ar.edu.unsam.algo3.tp.ui.MainApplication
import ar.edu.unsam.algo3.tp.ui.PoblarAreaWindows
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.windows.Dialog
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class AdministracionModelo {

	List<Opcion> opciones = newArrayList
	var Integer flagDependencies = 0
	var Command comandoSeleccionado
	var MainApplication aplicacion

	new(MainApplication app) {
		aplicacion = app
		opciones.add(new Opcion("Agregar Acciones", [|
			this.actualizaFlagDependencies()
			this.abrirAcciones(new AgregarAccionesWindow(app, new AgregarAccionesModelo(new AgregarAcciones)))
		]))
		opciones.add(new Opcion("Poblar area", [|this.abrirAcciones(new PoblarAreaWindows(app, new PoblarAreaModelo))]))

	}

	def abrirAcciones(Dialog<?> dialog) {
		dialog.onAccept[|this.actualizaFlagDependencies()]
		dialog.onCancel[this.actualizaFlagDependencies()]
		dialog.open
	}

	def void actualizaFlagDependencies() {
		flagDependencies++
	}

	def void editarComando() {
		editarDialogo(comandoSeleccionado)
	}

	def dispatch editarDialogo(AgregarAcciones _AgregarAcciones) {
		this.editarAcciones(new EditarAccionesWindow(aplicacion, new AgregarAccionesModelo(_AgregarAcciones)))
		this.actualizaFlagDependencies()
	}

	def dispatch editarDialogo(PoblarArea _PoblarArea) {
	}

	def editarAcciones(Dialog<?> dialog) {
		dialog.onAccept[|this.actualizaFlagDependencies()]
		dialog.onCancel[this.actualizaFlagDependencies()]
		dialog.open
	}

	def eliminarComando() {
		repoProcesos.eliminarProceso(comandoSeleccionado)
		comandoSeleccionado = null
		actualizaFlagDependencies
	}

	RepositorioProcesos repoProcesos = RepositorioProcesos.instance

	@Dependencies("flagDependencies")
	def getProcesosFacu() {
		RepositorioProcesos.instance.procesos
	}

}
