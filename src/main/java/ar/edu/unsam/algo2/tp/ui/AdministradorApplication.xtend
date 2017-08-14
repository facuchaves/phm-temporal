package ar.edu.unsam.algo2.tp.ui

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class AdministradorApplication extends Application {
	
	static def void main(String[] args) { 
		new AdministradorApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new AdministracionWindow(this, new DominioAdministracion(this))
	}
	
}
