package ar.edu.unsam.algo2.tp.ui

import org.uqbar.arena.layout.ColumnLayout
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

class AdministracionWindow extends Window<DominioAdministracion> {

	new(WindowOwner owner, DominioAdministracion model) {
		super(owner, model)
	}

	override createContents(Panel mainPanel) {
		this.title = "Administracion"
		
		mainPanel.layout = new ColumnLayout(2)
		
		var Panel leftPanel = new Panel(mainPanel)
		leftPanel.setLayout(new VerticalLayout())
		
		val table = new Table<Proceso>(leftPanel , typeof (Proceso)) => [
			items <=> "procesos"
			numberVisibleRows = 10
		]
		
		new Column<Proceso>(table) => [
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
		
		new Column<Proceso>(table) => [
			title = "Ultima ejecucion"
			fixedSize = 150
			bindContentsToProperty("fecha")
		]
		
		var Panel subPanelButton = new Panel(leftPanel)
		subPanelButton.layout = new HorizontalLayout
		
		new Button(subPanelButton) => [
			caption = "Ejecutar"
		]
		
		new Button(subPanelButton) => [
			caption = "Editar"
		]
		
		new Button(subPanelButton) => [
			caption = "Eliminar"
		]
		
		val Panel rightPanel = new Panel(mainPanel)
		rightPanel.setLayout(new VerticalLayout())
		
		this.modelObject.getOpciones().forEach [ opcion |
			new Button(rightPanel) => [ 
				caption = opcion.descripcion
				onClick(opcion.action)
			]
		]	
		
//		new Button(rightPanel) => [
//			caption = "Agregar acciones"
//		]
//
//		new Button(rightPanel) => [
//			caption = "Remover acciones"
//		]
//		
//		new Button(rightPanel) => [
//			caption = "Poblar area"
//			onClick( | modelObject.poblarArea )
//		]
//		
//		new Button(rightPanel) => [
//			caption = "Actualizar"
//		]
//		
//		new Button(rightPanel) => [
//			caption = "Multiple"
//		]
		
	}

	/**
	 * Crea un textbox con un label
	 */
	def buildTextBoxWithLabelHorizontal(Panel panel, String labelText , String textBoxValue) {
		var Panel subPanel = new Panel(panel)
		subPanel.setLayout(new HorizontalLayout())
		
		new Label(subPanel).text = labelText
		new TextBox(subPanel) => [
			value <=> textBoxValue
		]
	}

}
