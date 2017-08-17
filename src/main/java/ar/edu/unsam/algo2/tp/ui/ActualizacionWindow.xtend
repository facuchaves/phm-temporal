package ar.edu.unsam.algo2.tp.ui

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.Button

class ActualizacionWindow extends MainWindow<ActualizacionApplication> {

	new() {
		super(new ActualizacionApplication)
	}

	override createContents(Panel mainPanel) {
		this.title = "Actualizacion"
		mainPanel.layout = new VerticalLayout
		
		var Panel horiPanel = new Panel(mainPanel)
		horiPanel.layout = new HorizontalLayout
		
		new Label(horiPanel).text = "Descripción: "
		new TextBox(horiPanel) => [
			value <=> "repoSeleccionado"
			width = 200
		]
		
		///Agrego el panel de abajo
		var Panel bottomPanel = new Panel(mainPanel)
		bottomPanel.layout = new ColumnLayout(2)
		
		var Panel leftPanel = new Panel(bottomPanel)
		leftPanel.layout = new ColumnLayout(2)
		
		new Label(leftPanel).text = "Repositorios: "
		new List(leftPanel) => [
            items <=> "repositorios"
            value <=> "repoSeleccionado"
            width = 100
            height = 100
        ]
        
        var Panel rightPanel = new Panel(bottomPanel)
		rightPanel.layout = new VerticalLayout
        
        new Selector(rightPanel) => [
        	items <=> "repositorios"
        	value <=> "repoSeleccionado"
        ]
        
        var Panel underRightPanel = new Panel(rightPanel)
		underRightPanel.layout = new ColumnLayout(2)
		new Button(underRightPanel) => [
			caption = "Agregar Repositorio"
		]
		new Button(underRightPanel) => [
			caption = "Eliminar Repositorio"
		]
		
		var Panel underPanel = new Panel(mainPanel)
		underPanel.layout = new ColumnLayout(2)
		new Button(underPanel) => [
			alignRight
			caption = "Cancelar"
		]
		new Button(underPanel) => [
			alignLeft
			caption = "Aceptar"
		]
	}
	
	def static main(String[] args) {
		new ActualizacionWindow().startApplication
	}

}
