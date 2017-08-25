package ar.edu.unsam.algo3.tp.ui

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import ar.edu.unsam.algo3.tp.model.Repositorio
import ar.edu.unsam.algo3.tp.model.Especie
import ar.edu.unsam.algo3.tp.model.RepositorioEspecie
import ar.edu.unsam.algo3.tp.model.Tipo
import java.util.List
import ar.edu.unsam.algo3.tp.model.RepositorioPokeparada
import ar.edu.unsam.algo3.tp.model.Pokeparada
import org.uqbar.geodds.Point
import ar.edu.unsam.algo3.tp.model.Item
import org.uqbar.commons.applicationContext.ApplicationContext

class ActualizacionBootstrap extends CollectionBasedBootstrap {
//
//	new() {
//		ApplicationContext.instance.configureSingleton(typeof(Modelo), new RepoModelos)
//		ApplicationContext.instance.configureSingleton(typeof(Celular), new RepoCelulares)
//	}
	/**
	 * Inicialización del juego de datos del repositorio
	 * 
	 * Nota: en ejemplos anteriores estaba en el método init
	 * del repo, esto acoplaba innecesariamente el juego de datos
	 * con su repositorio
	 * 
	 */
	override run() {
//		Repositorio Especie
		var RepositorioEspecie repositorioEspecie = RepositorioEspecie.instance
		repositorioEspecie.agregarTipo(new Tipo("hierba"))
		repositorioEspecie.agregarTipo(new Tipo("veneno"))
		repositorioEspecie.agregarTipo(new Tipo("electricidad"))
		repositorioEspecie.agregarTipo(new Tipo("fuego"))
		var bulbasaur = new Especie() => [
			numero = 1
			nombre = "Bulbasaur"
			puntosAtaque = 10
			puntosSalud = 15
			descripcion = "Este pokemon es un Bulbasaur es fácil verle echándose una siesta al sol."
			tipos => [new Tipo("veneno") new Tipo("hierba")]
			velocidad = 7
		]
		var ivysaur = new Especie() => [
			numero = 2
			nombre = "Ivysaur"
			puntosAtaque = 15
			puntosSalud = 20
			descripcion = "Este pokemon lleva un bulbo en el lomo."
			tipos => [new Tipo("veneno") new Tipo("hierba")]
			velocidad = 8
		]
		repositorioEspecie.create(bulbasaur)
		repositorioEspecie.create(ivysaur)
		
		
//		Repositorio Pokeparada
		var repositorioPokeparada = RepositorioPokeparada.instance
		repositorioPokeparada.description = "Repo Especie"
		repositorioPokeparada.agregarItem(new Item(1,"pokebola"))
		repositorioPokeparada.agregarItem(new Item(1,"superball"))
		repositorioPokeparada.agregarItem(new Item(1,"poción"))
		repositorioPokeparada.agregarItem(new Item(1,"ultraball"))
		repositorioPokeparada.agregarItem(new Item(1,"superpoción"))
		var pokeparadaUNSAM = new Pokeparada() => [
			ubicacion = new Point( -34.572224 , -58.535651 )
			nombre = "Pokeparada UNSAM"
			items => [new Item(1,"pokebola") new Item(1,"ultraball") new Item(1,"superpoción")]
		]
		var pokeparadaObelisco = new Pokeparada() => [
			ubicacion = new Point( -34.603759 , -58.381586 )
			nombre = "Pokeparada obelisco"
			items => [new Item(1,"pokebola") new Item(1,"superaball") new Item(1,"poción")]
		]
		var pokeparadaDOT = new Pokeparada() => [
			ubicacion = new Point( -34.5542418 , -58.491549 )
			nombre = "Pokeparada DOT"
			items => [new Item(1,"pokebola") new Item(1,"superaball") new Item(1,"poción")]
		]
		var Pokeparada jardinBotanico = new Pokeparada() => [ 
			ubicacion = new Point( -34.5595298 , -58.491549 ) 
			nombre = "Pokeparada JardinBotanico" 
			items => [new Item(1,"pokebola") new Item(1,"superaball") new Item(1,"poción")]
		]
		repositorioPokeparada.create(pokeparadaUNSAM)
		repositorioPokeparada.create(pokeparadaObelisco)
		repositorioPokeparada.create(pokeparadaDOT)
		repositorioPokeparada.create(jardinBotanico)
		
		repositorioEspecie.description = "Repo Especie"
		repositorioPokeparada.description = "Repo Pokeparada"
		
		var List<Repositorio> repositorios = #[repositorioPokeparada, repositorioEspecie]
	}
}