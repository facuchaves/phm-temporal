package ar.edu.unsam.algo3.tp.ui

import ar.edu.unsam.algo3.tp.model.command.AgregarAcciones
import ar.edu.unsam.algo3.tp.model.command.Command
import ar.edu.unsam.algo3.tp.model.command.PoblarArea
import ar.edu.unsam.algo3.tp.viewModel.AdministracionModelo
import ar.edu.unsam.algo3.tp.viewModel.AgregarAccionesModelo
import ar.edu.unsam.algo3.tp.viewModel.EditarPoblarAreaModelo
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unsam.algo3.tp.viewModel.RepositoriosModelo

class AdministracionWindow extends Window<AdministracionModelo> {

	new(WindowOwner owner, AdministracionModelo model) {
		super(owner, model)
	}

	override createContents(Panel mainPanel) {
		this.title = "Administracion"

		mainPanel.layout = new HorizontalLayout

		var Panel leftPanel = new Panel(mainPanel)
		leftPanel.layout = new VerticalLayout()

		var table = new Table<Command>(leftPanel, typeof(Command)) => [
			items <=> "procesos"
			numberVisibleRows = 10
			value <=> "procesoSeleccionado"
		]

		new Column<Command>(table) => [
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("nombreComando")

		]

		new Column<Command>(table) => [
			title = "Ultima ejecucion"
			fixedSize = 150
			bindContentsToProperty("ultimaEjecucion")
		]

		var Panel subPanelButton = new Panel(leftPanel)
		subPanelButton.layout = new HorizontalLayout

		val comandoSelected = new NotNullObservable("procesoSeleccionado")

		new Button(subPanelButton) => [
			caption = "Ejecutar"
			bindEnabled(comandoSelected)
			onClick[this.modelObject.ejecutarProcesoSeleccionado()]
		]

		new Button(subPanelButton) => [
			caption = "Editar"
			bindEnabled(comandoSelected)
			onClick[this.abrirEditar(modelObject.procesoSeleccionado)]
		]

		new Button(subPanelButton) => [
			caption = "Eliminar"
			bindEnabled(comandoSelected)
			onClick[this.modelObject.eliminarProcesoSeleccionado()]
		]

		val Panel rightPanel = new Panel(mainPanel)
		rightPanel.layout = new VerticalLayout()

		new Button(rightPanel) => [
			caption = "Agregar Acciones"
			onClick([|this.agregarAcciones()])
		]

		new Button(rightPanel) => [
			caption = "Poblar Area"
			onClick([|this.poblarArea()])
		]
		
		new Button(rightPanel) => [
			caption = "Actualizar"
			onClick([|this.actualizar()])
		]

	}

	/**
	 * Abre el dialog de agregar acciones
	 */
	def agregarAcciones() {
		openDialog(new AgregarAccionesWindow(this, new AgregarAccionesModelo))
	}

	/**
	 * Abre el dialog de poblar area
	 */
	def poblarArea() {
		openDialog(new PoblarAreaWindows(this))
	}
	
	/**
	 * Abre el dialog de agregar acciones
	 */
	def actualizar() {
		openDialog(new ActualizacionWindow(this, new RepositoriosModelo))
	}
	
	/**
	 * Abre el dialog de editar poblar area
	 */
	dispatch def abrirEditar(PoblarArea proceso) {
		openDialog(new EditarPoblarAreaWindows( this ,  new EditarPoblarAreaModelo(proceso) ) )
	}
	
	/**
	 * Abre el dialog de agregar acciones
	 */
	dispatch def abrirEditar(AgregarAcciones proceso) {
		openDialog(new EditarAccionesWindow(this,  new AgregarAccionesModelo(proceso)))
	}

	/**
	 * Abre un dialog pasado por parametro
	 */
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|this.modelObject.actualizaFlagDependencies()]
		dialog.open
	}

}
