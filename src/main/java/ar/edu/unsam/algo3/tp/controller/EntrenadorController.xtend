package ar.edu.unsam.algo3.tp.controller

import ar.edu.unsam.algo3.tp.model.RepositorioEntrenador
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unsam.algo3.tp.model.RepositorioOponentes
import ar.edu.unsam.algo3.tp.model.Entrenador
import java.util.List

@Controller
class EntrenadorController {

	extension JSONUtils = new JSONUtils

	@Get("/entrenador/inventario")
	def Result inventario() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)

		response.contentType = ContentType.APPLICATION_JSON
		ok(entrenador.items.toJson)

	}

	@Get("/entrenador/deposito")
	def Result deposito() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)

		response.contentType = ContentType.APPLICATION_JSON
		ok(entrenador.deposito.toJson)

	}

	@Get("/entrenador/pokemones")
	def Result pokemones() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)

		response.contentType = ContentType.APPLICATION_JSON
		ok(entrenador.equipo.toJson)

	}

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
	def Result ubicacionActual() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)
		try {
			ok(entrenador.ubicacion.toJson)
		} catch (Exception E) {
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

	@Get("/entrenador/oponentes")
	def Result oponentesCerca() {
		val oponentes = RepositorioEntrenador.instance.oponentesCercanos()
		try {
			response.contentType = ContentType.APPLICATION_JSON
			ok(oponentes.toJson)
		} catch (Exception E) {
			internalServerError(E.message)
		}

	}

}
