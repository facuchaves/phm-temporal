package ar.edu.unsam.algo3.tp.controller

import ar.edu.unsam.algo3.tp.model.RepositorioEntrenador
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class EntrenadorController {
	
	extension JSONUtils = new JSONUtils
	
	@Get("/entrenador/pokemon/:name")
	def Result pokemon() {
		val entrenador = RepositorioEntrenador.instance.search("Ash").get(0)
		
		response.contentType = ContentType.APPLICATION_JSON
		ok(entrenador.getPokemonPorNombre( name ).toJson)
		
	}
	
	def static void main(String[] args) {
		XTRest.start(9000, EntrenadorController)
	}
	
}