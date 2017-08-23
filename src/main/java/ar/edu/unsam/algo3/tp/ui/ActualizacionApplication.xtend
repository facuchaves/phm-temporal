package ar.edu.unsam.algo3.tp.ui

import ar.edu.unsam.algo3.tp.viewModel.DominioRepositorios
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class ActualizacionApplication extends Application {
	
	static def void main(String[] args) { 
		new ActualizacionApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new ActualizacionWindow(this, new DominioRepositorios(this))
	}
}