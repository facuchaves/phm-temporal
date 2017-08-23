package ar.edu.unsam.algo3.tp.ui

import ar.edu.unsam.algo3.tp.viewModel.AdministracionModelo
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class MainApplication extends Application {
	
	static def void main(String[] args) { 
		new MainApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new AdministracionWindow(this, new AdministracionModelo(this))
	}
	
}
