package ar.edu.unsam.algo3.tp.controller

import ar.edu.unsam.algo3.tp.model.RepositorioEntrenador
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class EntrenadorController {

	extension JSONUtils = new JSONUtils

	@Get("/entrenador/pokemon/:name")
	def Result pokemon() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)

		response.contentType = ContentType.APPLICATION_JSON
		ok(entrenador.getPokemonPorNombre(name).toJson)

	}

	
	@Get("/entrenador/logeado")
	def Result entrenadorLogeado() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)
		
		response.contentType = ContentType.APPLICATION_JSON
		ok(entrenador.toJson)
		
	}
	

	def static void main(String[] args) {
		XTRest.start(9000, EntrenadorController)
	}

	@Get("/entrenador/ubicacion")
	def Result ubicacionActual(){
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)
		try{
			ok(entrenador.ubicacion.toJson)
		}catch(Exception E){
			badRequest("No se pudo obtener la ubicacion.")
		}
	}

	@Put("/entrenador/moverseArriba")
	def Result moverseArriba() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)
		response.contentType = ContentType.APPLICATION_JSON
		try {
			entrenador.moverseArriba()
			ok('{ "status" : "OK" }')
		} catch (Exception E) {
			internalServerError(E.message)
		}
	}

	@Put("/entrenador/moverseAbajo")
	def Result moverseAbajo() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)
		response.contentType = ContentType.APPLICATION_JSON
		try {
			entrenador.moverseAbajo()
			ok()
		} catch (Exception E) {
			internalServerError(E.message)
		}

	}

	@Put("/entrenador/moverseIzquierda")
	def Result moverseIzquierda() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)
		response.contentType = ContentType.APPLICATION_JSON
		try {
			entrenador.moverseIzquerda()
			ok()
		} catch (Exception E) {
			internalServerError(E.message)
		}

	}

	@Put("/entrenador/moverseDerecha")
	def Result moverseDerecha() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)
		response.contentType = ContentType.APPLICATION_JSON
		try {
			entrenador.moverseDerecha()
			ok()
		} catch (Exception E) {
			internalServerError(E.message)
		}

	}
	
	

}
