package ar.edu.unsam.algo2.tp.observer

import ar.edu.unsam.algo2.tp.Entrenador
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unsam.algo2.tp.mail.Mail

interface CustomObserver {

	
	def void notificar(Entrenador entrenador)

	
}
