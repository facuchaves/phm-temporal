package ar.edu.unsam.algo2.tp.ui

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
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unsam.algo2.tp.Repositorio

class ActualizacionWindow extends Window<DominioRepositorios> {

	new(WindowOwner owner, DominioRepositorios model) {
		super(owner, model)
	}

	override createContents(Panel mainPanel) {
		this.title = "Actualizacion"
		mainPanel.layout = new VerticalLayout
		
		var Panel horiPanel = new Panel(mainPanel)
		horiPanel.layout = new HorizontalLayout
		
		new Label(horiPanel).text = "Descripción: "
		new TextBox(horiPanel) => [
			value <=> "nombreRepo"
			width = 200
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
            items <=> "repositorios"
            width = 100
            height = 100
        ]
        
        var Panel rightPanel = new Panel(bottomPanel)
		rightPanel.layout = new VerticalLayout
        
        new Selector(rightPanel) => [
        	allowNull(false)
//        	val bindingItems = items <=> new ObservableProperty(this.modelObject, "repositorios")
//     		bindingItems.adapter = new PropertyAdapter(typeof(Repositorio), "description")
     		items <=> "repositorios"
        	value <=> "repoSeleccionado"
        ]
        
        var Panel underRightPanel = new Panel(rightPanel)
		underRightPanel.layout = new ColumnLayout(2)
		new Button(underRightPanel) => [
			caption = "Agregar Repositorio"
//			onClick(|this.modelObject.agregarRepositorio())
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
	
//	def buildTextBoxWithLabelHorizontal(Panel panel, String labelText, String textBoxValue) {
//		var Panel subPanel = new Panel(panel)
//		subPanel.setLayout(new HorizontalLayout())
//
//		new Label(subPanel).text = labelText
//		new TextBox(subPanel) => [
//			value <=> textBoxValue
//		]
//	}
}
