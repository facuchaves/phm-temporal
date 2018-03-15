package ar.edu.unsam.phm.tp.ui

import ar.edu.unsam.phm.tp.viewModel.DetalleProductoModelo
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class DetalleProductoWindow extends TransactionalDialog<DetalleProductoModelo> {

	new(WindowOwner parent, DetalleProductoModelo model) {
		super(parent, model)

	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Detalle Stock Producto"

		var Panel top = new Panel(mainPanel).layout = new HorizontalLayout
		
		new Label(top).text = "Descripcion : "
		new TextBox(top) => [
			value <=> "producto.nombreProducto"
			width = 100
		]
/*
		val Panel panelInferior = new Panel(mainPanel)
		panelInferior.layout = new HorizontalLayout()

		val Panel panelInferiorIzquierdo = new Panel(panelInferior).layout = new HorizontalLayout

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

		val Panel panelInferiorDerecho = new Panel(panelInferior).layout = new VerticalLayout

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

//		val Panel panelAceptarCancelar = new Panel(mainPanel)
//		panelAceptarCancelar.layout = new HorizontalLayout
//		panelAceptarCancelar.width = 400
*/		
	}

//	override protected void addActions(Panel actions) {
//		new Button(actions) => [
//			caption = "Aceptar"
//			onClick [| this.modelObject.agregar this.accept]
//			setAsDefault
//			disableOnError
//		]
//
//		new Button(actions) => [
//			caption = "Cancelar"
//			onClick [|this.cancel]
//		]
//	}

}
