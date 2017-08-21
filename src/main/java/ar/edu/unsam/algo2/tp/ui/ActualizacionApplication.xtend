package ar.edu.unsam.algo2.tp.ui

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.arena.windows.Window
import org.uqbar.arena.Application

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