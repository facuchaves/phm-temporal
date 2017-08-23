package ar.edu.unsam.algo2.tp.ui

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unsam.algo2.tp.observer.CustomObserver
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unsam.algo2.tp.observer.NotificarNivelMasAltoObserver
import org.uqbar.arena.widgets.tables.Column

import org.uqbar.arena.aop.windows.TransactionalDialog

class AgregarAccionesWindow extends TransactionalDialog<DominioAcciones> {

	new(WindowOwner owner, DominioAcciones model) {
		super(owner, model)

	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Agregar Acciones"

		val Panel top = new Panel(mainPanel)
		top.layout = new HorizontalLayout()
		new Label(top).text = "Descripcion"
		new TextBox(top) => [
			value <=> "accion.nombreComando"
			width = 400
		]

		val Panel panelInferior = new Panel(mainPanel)
		panelInferior.layout = new HorizontalLayout()

		val Panel panelInferiorIzquierdo = new Panel(panelInferior)

		new Label(panelInferiorIzquierdo).text = "Acciones"

		var tablaAcciones = new Table<NotificarNivelMasAltoObserver>(panelInferiorIzquierdo,
			typeof(NotificarNivelMasAltoObserver)) => [
			items <=> "accion.customObservers"
			numberVisibleRows = 10
			value <=> "seleccionEliminar"
		]

		new Column<NotificarNivelMasAltoObserver>(tablaAcciones) => [
			fixedSize = 240
			title = "Accion"
			bindContentsToProperty("descripcion")
		]

		val Panel panelInferiorDerecho = new Panel(panelInferior)

		new Label(panelInferiorDerecho).text = "Acciones"
		new Selector<CustomObserver>(panelInferiorDerecho) => [
			allowNull = false
			width = 200
			val itemsProperty = items <=> "acciones"
			itemsProperty.adapter = new PropertyAdapter(typeof(CustomObserver), "descripcion")
			value <=> "seleccionAccion"
		]

		var Panel panelInferioDerechoInterior = new Panel(panelInferiorDerecho)
		panelInferioDerechoInterior.layout = new HorizontalLayout()

		new Button(panelInferioDerechoInterior) => [
			caption = "Agregar Accion"
			onClick(|this.modelObject.addAccion())
		]

		new Button(panelInferioDerechoInterior) => [
			caption = "Eliminar Accion"
			onClick(|this.modelObject.removeAccion())
		]

		val Panel panelAceptarCancelar = new Panel(mainPanel)
		panelAceptarCancelar.layout = new HorizontalLayout
		panelAceptarCancelar.width = 400

	}

	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [| this.modelObject.agregar this.accept]
			setAsDefault
			disableOnError
		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|
				this.cancel
			]
		]
	}

}
