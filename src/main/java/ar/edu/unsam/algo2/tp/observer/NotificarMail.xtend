package ar.edu.unsam.algo2.tp.observer

import ar.edu.unsam.algo2.tp.mail.Mail

abstract class NotificarMail implements CustomObserver  {
	
	def void notificarMail(Mail email)
	
}