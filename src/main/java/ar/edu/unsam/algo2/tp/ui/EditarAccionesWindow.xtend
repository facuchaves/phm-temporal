package ar.edu.unsam.algo2.tp.ui

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button

class EditarAccionesWindow extends AgregarAccionesWindow {
	
	new(WindowOwner owner, DominioAcciones model) {
		super(owner, model)
	}
	
	
	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|   this.accept]
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