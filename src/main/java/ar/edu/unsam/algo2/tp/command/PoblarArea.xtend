package ar.edu.unsam.algo2.tp.command

import ar.edu.unsam.algo2.tp.Especie
import ar.edu.unsam.algo2.tp.Genero
import ar.edu.unsam.algo2.tp.Pokemon
import ar.edu.unsam.algo2.tp.RepositorioPokemon
import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PoblarArea extends Command {

	String descripcion
	// Área geográfica: Área rectangular que representa la zona a poblar.
	Rectangulo rectangulo
	
	// Especies: Determina de qué especies serán los pokémons creados.
	List<Especie> especies
	
	// Nivel mínimo y máximo: Los pokémons creados tendrán un nivel dentro de este rango.
	 int nivelMinimo
	 int nivelMaximo

	// Densidad: Cantidad de pokémons a crear por km2.
	double densidad
	
	override execute() {
		
		var int cantidadPokemones = (rectangulo.area * densidad).intValue
		
		var List<Pokemon> pokemones = newArrayList
		
		for ( var i = 0 ; i < cantidadPokemones ; i++ ){
			
			RepositorioPokemon.instance.agregarPokemon( new Pokemon() => [

					ubicacion = rectangulo.puntoEnRectangulo
					especie = randomEspecie
					nivel = RandomUtils.getIntInRange( nivelMinimo , nivelMaximo )
					genero = generoAleatorio
					
					puntosDeSalud  = RandomUtils.getIntInRange( especie.puntosSalud )
					
				]
			);
		}

	}
	
	def getGeneroAleatorio() {
		
		val random = new Random()
		val nextDouble = random.nextDouble
		
		if( nextDouble < 0.5 ){
			return Genero.MASCULINO
		}

		Genero.FEMENINO
	}
	
	def Especie getRandomEspecie(){
		return RandomUtils.getRandomElementInList( especies )
	}

}
