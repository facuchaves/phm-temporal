package ar.edu.unsam.algo2.tp.ui

import ar.edu.unsam.algo2.tp.command.AgregarAcciones
import ar.edu.unsam.algo2.tp.command.Command
import ar.edu.unsam.algo2.tp.command.PoblarArea
import ar.edu.unsam.algo2.tp.ui.viewModel.ModeloPoblarArea
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.windows.Dialog
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class DominioAdministracion {

	List<Opcion> opciones = newArrayList
	var Integer flagDependencies = 0
	var Command comandoSeleccionado
	var AdministradorApplication aplicacion

	new(AdministradorApplication app) {
		aplicacion = app
		opciones.add(new Opcion("Agregar Acciones", [|
			this.actualizaFlagDependencies()
			this.abrirAcciones(new AgregarAccionesWindow(app, new DominioAcciones( new AgregarAcciones)))
		]))
		opciones.add(new Opcion("Poblar area", [| this.abrirAcciones( new PoblarAreaWindows(app, new ModeloPoblarArea) ) ]))

	}

	def abrirAcciones(Dialog<?> dialog) {
		dialog.onAccept[| this.actualizaFlagDependencies()]
		dialog.onCancel[this.actualizaFlagDependencies()]
		dialog.open
	}

	def void actualizaFlagDependencies() {
		flagDependencies ++
	}

	def void editarComando() {
		editarDialogo(comandoSeleccionado)
	}

	def dispatch editarDialogo(AgregarAcciones _AgregarAcciones) {
		this.editarAcciones(new AgregarAccionesWindow(aplicacion, new DominioAcciones(_AgregarAcciones)))
		actualizaFlagDependencies
	}

	def dispatch editarDialogo(PoblarArea _PoblarArea) {
	}

	def editarAcciones(Dialog<?> dialog) {
		dialog.open
	}

	def eliminarComando() {
//		administrador.eliminar(comandoSeleccionado)
		comandoSeleccionado = null
	}
	
	RepositorioProcesos repoProcesos = RepositorioProcesos.instance
	
	@Dependencies("flagDependencies")
	def getProcesosFacu(){
		RepositorioProcesos.instance.procesos
	}
	
}
