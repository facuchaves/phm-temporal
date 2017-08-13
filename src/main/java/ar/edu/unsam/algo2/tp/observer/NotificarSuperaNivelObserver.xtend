
package ar.edu.unsam.algo2.tp.observer

import ar.edu.unsam.algo2.tp.Entrenador
import ar.edu.unsam.algo2.tp.mail.Mail
import ar.edu.unsam.algo2.tp.mail.MailSender
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class NotificarSuperaNivelObserver extends NotificarMail{
	
	MailSender mailSender

	override notificar(Entrenador entrenador) {
		entrenador.amigos.forEach[entrenadorRepo | 
				if(entrenadorRepo.nivel < entrenador.nivel){
					entrenador.agregarNotificacion("Te paso de nivel")
					entrenadorRepo.agregarNotificacion("El entrenador" + entrenador.nombre + "te paso de nivel" + entrenador.nivel)
				 	notificarMail( new Mail() => [
					from = entrenador.casillaDeMail
					to = entrenadorRepo.casillaDeMail
					message = "El entrenador" + entrenador.nombre + "te paso de nivel" + entrenador.nivel
					titulo = "Notificacion"
			])
			}
		]
	}
	
	override notificarMail(Mail email) {
		mailSender.send(email)	
	}
	
}