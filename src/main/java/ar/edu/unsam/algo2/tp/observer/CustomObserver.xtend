package ar.edu.unsam.algo2.tp.observer

import ar.edu.unsam.algo2.tp.Entrenador
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unsam.algo2.tp.mail.Mail
import org.uqbar.commons.model.annotations.Observable

interface CustomObserver {

	
	def void notificar(Entrenador entrenador)
	
	def String descripcion()
	
}
