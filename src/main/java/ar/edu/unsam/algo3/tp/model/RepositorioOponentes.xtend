package ar.edu.unsam.algo3.tp.model

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

class RepositorioOponentes  {

	

	@Accessors List<Entrenador> entrenadores = new ArrayList()
	
	 new () {
		
			
		entrenadores.add( new Entrenador() => [
			nombre = "Ash Ketchum"
			ubicacion = new Point(-34.572219, -58.534893)
			equipo = newArrayList( RepositorioPokemon.instance.search("Pipo").get(0) )
			dinero = 100
			deposito = newArrayList( RepositorioPokemon.instance.search("Charizard").get(0) )
			perfil = new Luchador()
			items = new HashMap
			agregarItem(RepositorioItem.instance.search("Pocion").get(0))
			agregarItem(RepositorioItem.instance.search("Pocion").get(0))
			agregarItem(RepositorioItem.instance.search("Pokebola").get(0))
			imagenEntrenador="ash.jpg"
		])
		entrenadores.add( new Entrenador() => [
			nombre = "Gary Oak"
			ubicacion = new Point(-34.572219, -58.534893)
			equipo = newArrayList( RepositorioPokemon.instance.search("Snorlax").get(0) )
			dinero = 50
			deposito = newArrayList( RepositorioPokemon.instance.search("Charizard").get(0) )
			perfil = new Luchador()
			items = new HashMap
			agregarItem(RepositorioItem.instance.search("Pocion").get(0))
			agregarItem(RepositorioItem.instance.search("Pokebola").get(0))
			agregarItem(RepositorioItem.instance.search("Pokebola").get(0))
			imagenEntrenador="garyOak.jpg"
		])
		entrenadores.add( new Entrenador() => [
			nombre = "Misty La Colo"
			ubicacion = new Point(-34.572219, -58.534893)
			equipo = newArrayList( RepositorioPokemon.instance.search("Meowth").get(0) )
			dinero = 200
			deposito = newArrayList( RepositorioPokemon.instance.search("Charizard").get(0) )
			perfil = new Luchador()
			items = new HashMap
			agregarItem(RepositorioItem.instance.search("Pokebola").get(0))
			agregarItem(RepositorioItem.instance.search("Pokebola").get(0))
			agregarItem(RepositorioItem.instance.search("Pokebola").get(0))
			imagenEntrenador="misty.png"
])
		
	}

	
	
	def obtenerOponentes(){
		this.entrenadores
	}
	
	def obtenerEnemigo(String nombre){
		this.entrenadores.filter[E | E.nombre.equals(nombre)].get(0)
	}
	
	
	
}
