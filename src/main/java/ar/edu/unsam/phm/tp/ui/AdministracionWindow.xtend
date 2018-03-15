package ar.edu.unsam.phm.tp.ui

import ar.edu.unsam.phm.tp.ui.DetalleProductoWindow
import ar.edu.unsam.phm.tp.viewModel.AdministracionModelo
import ar.edu.unsam.phm.tp.viewModel.DetalleProductoModelo
import ar.edu.unsam.phm.tp.model.Producto
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

class AdministracionWindow extends Window<AdministracionModelo> {

	new(WindowOwner owner, AdministracionModelo model) {
		super(owner, model)
	}

	override createContents(Panel mainPanel) {
		this.title = "Consulta Stock"

		mainPanel.layout = new HorizontalLayout

		var Panel leftPanel = new Panel(mainPanel)
		leftPanel.layout = new VerticalLayout()

		var table = new Table<Producto>(leftPanel, typeof(Producto)) => [
			items <=> "productos"
			numberVisibleRows = 10
			value <=> "productoSeleccionado"
		]

		new Column<Producto>(table) => [
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("nombreProducto")

		]

		new Column<Producto>(table) => [
			title = "Stock Actual"
			fixedSize = 150
			bindContentsToProperty("stockActual")
		]

		var Panel subPanelButton = new Panel(leftPanel)
		subPanelButton.layout = new HorizontalLayout

		new Button(subPanelButton) => [
			caption = "Buscar"
			onClick[this.modelObject.buscar()]
		]

		val Panel rightPanel = new Panel(mainPanel)
		rightPanel.layout = new VerticalLayout()

		val productoSelected = new NotNullObservable("productoSeleccionado")

		new Button(rightPanel) => [
			caption = "Detalle"
			bindEnabled(productoSelected)
			onClick([|this.detalle()])
		]

	}

	/**
	 * Abre el dialog de detalle de producto
	 */
	def detalle() {
		openDialog(new DetalleProductoWindow(this, new DetalleProductoModelo(modelObject.productoSeleccionado) ))
	}

	/**
	 * Abre un dialog pasado por parametro
	 */
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|this.modelObject.actualizaFlagDependencies()]
		dialog.open
	}

}
