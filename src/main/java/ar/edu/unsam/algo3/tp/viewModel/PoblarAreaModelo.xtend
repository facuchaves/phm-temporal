package ar.edu.unsam.algo3.tp.viewModel

import ar.edu.unsam.algo3.tp.model.Especie
import ar.edu.unsam.algo3.tp.model.command.PoblarArea
import ar.edu.unsam.algo3.tp.model.command.Rectangulo
import ar.edu.unsam.algo3.tp.ui.utils.ModelWithListAndSelect
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.geodds.Point

@Accessors
@Observable
class PoblarAreaModelo extends ModelWithListAndSelect<Especie> {
	
	String descripcion
	
	// Nivel mínimo y máximo: Los pokémons creados tendrán un nivel dentro de este rango.
	int nivelMinimo
	int nivelMaximo
	 
	// Densidad: Cantidad de pokémons a crear por km2.
	double densidad
	
	Rectangulo areaSeleccionada
	List<Rectangulo> areas = newArrayList
	
	new() {
		this.select.add( new Especie() => [
			numero = 1
			nombre = "Bulbasaur"
			puntosAtaque = 10
			puntosSalud = 15
			it.descripcion = "Este pokemon es un Bulbasaur es fácil verle echándose una siesta al sol."
			tipos = newArrayList
			velocidad = 7
		])
		
		this.select.add( new Especie() => [
			numero = 2
			nombre = "Ivysaur"
			puntosAtaque = 15
			puntosSalud = 20
			it.descripcion = "Este pokemon lleva un bulbo en el lomo."
			tipos = newArrayList
			velocidad = 8
		])
		
		this.select.add( new Especie() => [
			numero = 3
			nombre = "Pikachu"
			puntosAtaque = 25
			puntosSalud = 30
			it.descripcion = "El viejo y querido Pikachu."
			tipos = newArrayList
			velocidad = 8
		])
		
		agregarArea(
			new Rectangulo() => [
				nombre = "Unsam"
				punto1 = new Point(0.0,0.0)
				punto2 = new Point(0.1,0.2)
			]
		)
		
		agregarArea(
			new Rectangulo() => [
				nombre = "Carrefour"
				punto1 = new Point(0.0,0.0)
				punto2 = new Point(0.2,0.2)
			]
		)
		
		agregarArea(
			new Rectangulo() => [
				nombre = "Tecnopolis"
				punto1 = new Point(0.0,0.0)
				punto2 = new Point(0.2,0.2)
			]
		)
	}
	
	def agregarArea(Rectangulo area){
		areas.add(area)
	}
	
	def void agregarComando(){
		var PoblarArea poblarArea = new PoblarArea() => [
			it.descripcion = descripcion
			it.nivelMinimo = nivelMinimo
			it.nivelMaximo = nivelMaximo
			it.densidad = densidad
			it.rectangulo = areaSeleccionada
			
		]
		RepositorioProcesos.instance.agregarProceso(poblarArea)
	}
	
}
