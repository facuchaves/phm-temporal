package ar.edu.unsam.algo3.tp.ui

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.aop.windows.TransactionalDialog
import ar.edu.unsam.algo3.tp.viewModel.RepositoriosModelo

class ActualizacionWindow extends TransactionalDialog<RepositoriosModelo> {

	new(WindowOwner owner, RepositoriosModelo model) {
		super(owner, model)
	}

	override createFormPanel(Panel mainPanel) {
		this.title = "Actualizacion"
		mainPanel.layout = new VerticalLayout
		
		var Panel horiPanel = new Panel(mainPanel)
		horiPanel.layout = new HorizontalLayout
		
		new Label(horiPanel).text = "Descripción : "
		new TextBox(horiPanel) => [
			value <=> "nombreRepo"
			width = 100
		]
		
		///Agrego el panel de abajo
		var Panel bottomPanel = new Panel(mainPanel)
		bottomPanel.layout = new ColumnLayout(2)
		
		var Panel leftPanel = new Panel(bottomPanel)
		leftPanel.layout = new ColumnLayout(2)
		
		new Label(leftPanel).text = "Repositorios: "
		new List(leftPanel) => [
			allowNull(false)
            value <=> "repoSeleccionado"
            items <=> "repositoriosLista"
            width = 100
            height = 100
        ]
        
        var Panel rightPanel = new Panel(bottomPanel)
		rightPanel.layout = new VerticalLayout
        
        new Selector(rightPanel) => [
        	allowNull(false)
     		items <=> "repositorios"
        	value <=> "repoSeleccionado"
        ]
        
        var Panel underRightPanel = new Panel(rightPanel)
		underRightPanel.layout = new ColumnLayout(2)
		new Button(underRightPanel) => [
			caption = "Agregar Repositorio"
			onClick(|this.modelObject.agregarRepositorio())
		]
		new Button(underRightPanel) => [
			caption = "Eliminar Repositorio"
			onClick[]
			onClick[|this.modelObject.eliminarRepositorio()]
		]
		
		var Panel underPanel = new Panel(mainPanel)
		underPanel.layout = new ColumnLayout(2)
	}
}
