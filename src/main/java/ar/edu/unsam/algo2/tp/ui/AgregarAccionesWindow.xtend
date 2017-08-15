package ar.edu.unsam.algo2.tp.ui

import org.uqbar.arena.windows.Window
import ar.edu.unsam.algo2.tp.command.AgregarAcciones
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unsam.algo2.tp.observer.CustomObserver
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button

class AgregarAccionesWindow extends Window<ModeloAcciones> {

	new(WindowOwner owner, ModeloAcciones model) {
		super(owner, model)
	}

	override createContents(Panel mainPanel) {
		this.title = "Agregar Acciones"

		val Panel top = new Panel(mainPanel)
		top.layout = new HorizontalLayout()
		new Label(top).text = "Descripcion"
		new TextBox(top) => [
			value <=> "accionesNivel.nombreCommand"
			width = 200
		]

		val Panel panelInferior = new Panel(mainPanel)
		panelInferior.layout = new HorizontalLayout()
		
		val Panel panelInferiorIzquierdo = new Panel(panelInferior)
		//Agregar la grilla
		new Label(panelInferiorIzquierdo).text="Izquierda"
		
		val Panel panelInferiorDerecho = new Panel(panelInferior)
		new Label(panelInferiorDerecho).text = "Acciones"
		new Selector<CustomObserver>(panelInferiorDerecho) => [
			allowNull = false

			val itemsProperty = items <=> "acciones"
			itemsProperty.adapter = new PropertyAdapter(typeof(CustomObserver), "descripcion")
			value <=> "seleccionAccion"
		]
		
		new Button(panelInferiorDerecho)=>[
			caption="Agregar"
			onClick(|this.modelObject.addAccion())
		]

	}

}
