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
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unsam.algo2.tp.observer.NotificarNivelMasAltoObserver
import org.uqbar.arena.widgets.tables.Column
import ar.edu.unsam.algo2.tp.command.AdministacionDelSistema

class AgregarAccionesWindow extends Window<ModeloAcciones> {

	var AdministacionDelSistema administrador

	new(WindowOwner owner, ModeloAcciones model, AdministacionDelSistema _administrador) {
		super(owner, model)
		administrador = _administrador
	}

	override createContents(Panel mainPanel) {
		this.title = "Agregar Acciones"

		val Panel top = new Panel(mainPanel)
		top.layout = new HorizontalLayout()
		new Label(top).text = "Descripcion"
		new TextBox(top) => [
			value <=> "accionesNivel.nombreCommand"
			width = 400
		]

		val Panel panelInferior = new Panel(mainPanel)
		panelInferior.layout = new HorizontalLayout()

		val Panel panelInferiorIzquierdo = new Panel(panelInferior)

		new Label(panelInferiorIzquierdo).text = "Acciones"
		val tabla = new Table<NotificarNivelMasAltoObserver>(panelInferiorIzquierdo,
			typeof(NotificarNivelMasAltoObserver)) => [
			items <=> "accionesNivel.customObservers"
			numberVisibleRows = 10

		]

		new Column<NotificarNivelMasAltoObserver>(tabla) => [
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

		val Panel panelInferioDerechoInterior = new Panel(panelInferiorDerecho)
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

		new Button(panelAceptarCancelar) => [
			caption = "Aceptar"
			onClick[this.modelObject.AgregarComando(administrador) this.close]
		]
		new Button(panelAceptarCancelar) => [
			caption = "Cancelar"
			onClick[this.close]
		]

	}

}
