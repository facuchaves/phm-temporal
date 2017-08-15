package ar.edu.unsam.algo2.tp.command

import ar.edu.unsam.algo2.tp.RepositorioEntrenador
import ar.edu.unsam.algo2.tp.observer.CustomObserver
import java.util.List

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class AgregarAcciones extends Command {

	List<CustomObserver> customObservers = newArrayList
	var String nombreCommand

	new() {
	}

	new(List<CustomObserver> customObservers) {
		this.customObservers = customObservers
	}

	def agregarAccionIndividual(CustomObserver _customObservers) {
		customObservers.add(_customObservers)
	}

	override execute() {
		RepositorioEntrenador.instance.entrenadores.forEach[entrenador|entrenador.agregarObservers(customObservers)]
	}

	def getnombreCommand() {
		nombreCommand
	}

}
