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
import org.uqbar.xtrest.api.annotation.Body
import ar.edu.unsam.algo3.tp.model.Pokemon
import ar.edu.unsam.algo3.tp.model.Combate

@Controller
class EntrenadorController {

	extension JSONUtils = new JSONUtils
	var Entrenador jugador = RepositorioEntrenador.instance.search("Ash").get(0)

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

	@Get("/entrenador/pokemonSalvaje")
	def Result pokemonSalvajeCerca() {
		val pokemonSalvaje = RepositorioEntrenador.instance.pokemonSalvajeCercanos()
		try {
			response.contentType = ContentType.APPLICATION_JSON
			ok(pokemonSalvaje.toJson)
		} catch (Exception E) {
			internalServerError(E.message)
		}

	}

	@Get("/entrenador/pokeparadas")
	def Result pokeparadasCerca() {
		val pokeparadas = RepositorioEntrenador.instance.pokeparadasCercanas()
		try {
			response.contentType = ContentType.APPLICATION_JSON
			ok(pokeparadas.toJson)
		} catch (Exception E) {
			internalServerError(E.message)
		}

	}

	@Get("/pelearHoy/:id")
	def Result pelearHoy(@Body String body) {

		var Entrenador enemigo = new RepositorioOponentes().obtenerEnemigo(id.replace("_", " "))
		try {
			var Combate combate = new Combate()
			combate.entrenadorRival = enemigo
			combate.entrenador = jugador
			combate.pokemonRival = enemigo.equipo.get(0)
			combate.pokemon = jugador.equipo.get(0)
			combate.apuesta = enemigo.dinero
			var gano = combate.combatirRespuesta()
			response.contentType = ContentType.APPLICATION_JSON
			ok(gano)
		} catch (Exception E) {
			internalServerError(E.message)
		}

	}

	def static void main(String[] args) {
		XTRest.start(9000, EntrenadorController)
	}
}
