package ar.edu.unsam.algo2.tp.ui


import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unsam.algo2.tp.command.Command
import org.uqbar.arena.bindings.NotNullObservable

class AdministracionWindow extends Window<DominioAdministracion> {

	new(WindowOwner owner, DominioAdministracion model) {
		super(owner, model)
	}

	override createContents(Panel mainPanel) {
		this.title = "Administracion"

		mainPanel.layout = new HorizontalLayout

		var Panel leftPanel = new Panel(mainPanel)
		leftPanel.layout = new VerticalLayout()

		val table = new Table<Command>(leftPanel, typeof(Command)) => [
			items <=> "procesosFacu"
			numberVisibleRows = 10
			value <=> "comandoSeleccionado"
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

		val comandoSelected = new NotNullObservable("comandoSeleccionado")
		new Button(subPanelButton) => [
			caption = "Ejecutar"
			bindEnabled(comandoSelected)
		]

		new Button(subPanelButton) => [
			caption = "Editar"
			bindEnabled(comandoSelected)
			onClick[this.modelObject.editarComando()]
		]

		new Button(subPanelButton) => [
			caption = "Eliminar"
			bindEnabled(comandoSelected)
			onClick[this.modelObject.eliminarComando()]
		]

		val Panel rightPanel = new Panel(mainPanel)
		rightPanel.layout = new VerticalLayout()

		this.modelObject.getOpciones().forEach [ opcion |
			new Button(rightPanel) => [
				caption = opcion.descripcion
				onClick(opcion.action)
				enabled
			]
		]

	}

	/**
	 * Crea un textbox con un label
	 */
	def buildTextBoxWithLabelHorizontal(Panel panel, String labelText, String textBoxValue) {
		var Panel subPanel = new Panel(panel)
		subPanel.setLayout(new HorizontalLayout())

		new Label(subPanel).text = labelText
		new TextBox(subPanel) => [
			value <=> textBoxValue
		]
	}

}
