package ar.edu.unsam.algo2.tp.ui

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unsam.algo2.tp.Repositorio
import java.util.List
import ar.edu.unsam.algo2.tp.test.TestHelper
import ar.edu.unsam.algo2.tp.Especie
import ar.edu.unsam.algo2.tp.RepositorioEspecie
import ar.edu.unsam.algo2.tp.Tipo
import ar.edu.unsam.algo2.tp.Pokeparada
import ar.edu.unsam.algo2.tp.RepositorioPokeparada
import com.eclipsesource.json.JsonObject
import ar.edu.unsam.algo2.tp.Item
import org.uqbar.geodds.Point
import ar.edu.unsam.algo2.tp.json.JsonParserPokeparada

@Accessors
@Observable
class DominioRepositorios {
	List<Repositorio> repos
	TestHelper helper = new TestHelper
	
	RepositorioEspecie repositorioEspecie
	Especie bulbasaur
	Especie ivysaur
	Especie pikachu
	Especie bulbasaurActualizado
	Especie bulbasaurActualizadoTipos
	Especie ivysaurActualizado
	Especie charmander
	Especie especieInvalida
	int idInexistenteEnElRepo = 99
	
	RepositorioPokeparada repositorioPokeparada
	Pokeparada pokeparadaUNSAM
	Pokeparada pokeparadaObelisco
	Pokeparada pokeparadaUNSAMActualizada
	Pokeparada pokeparadaUNSAMActualizadaItem
	Pokeparada pokeparadaObeliscoActualizada 
	Pokeparada pokeparadaDOT 
	Pokeparada pokeparadaJardinBotanico
	JsonObject pokeparadaUNSAMJson = helper.crearPokeparadaUNSAMJson
	
	new(ActualizacionApplication application) {
		
		
	}
	
	def getRepositorios(){
		
		//Repositorio Especie
		helper.repositorioEspecie = newRepositorioEspecie
		initTipos()
		bulbasaur = helper.crearBulbasaur
		ivysaur = helper.crearIzysaur
		bulbasaurActualizado = helper.crearBulbasaur
		bulbasaurActualizado.nombre = "Bulbasaur actualizado"
		bulbasaurActualizadoTipos = helper.crearBulbasaur
		bulbasaurActualizadoTipos.nombre = "Bulbasaur actualizado"
		bulbasaurActualizadoTipos.tipos = newArrayList(helper.repositorioEspecie.getTipoByNombre("veneno"))
		ivysaurActualizado = helper.crearIzysaur
		ivysaurActualizado.nombre = "Ivysaur Actualizado"
		helper.repositorioEspecie.create(bulbasaur)
		helper.repositorioEspecie.create(ivysaur)
		
		
		//Repositorio Pokeparada
		repositorioPokeparada = getNewRepositorioPokeparada
		initItems()
		pokeparadaUNSAM = crearPokeparadaUNSAM
		pokeparadaUNSAMActualizada = crearPokeparadaUNSAM
		pokeparadaUNSAMActualizada.nombre = "Pokeparada UNSAM Actualizada"
		pokeparadaUNSAMActualizadaItem = crearPokeparadaUNSAM
		pokeparadaUNSAMActualizadaItem.nombre = "Pokeparada UNSAM Actualizada"
		pokeparadaUNSAMActualizadaItem.items = newArrayList( repositorioPokeparada.getItemByNombre("pokebola") )
		pokeparadaObelisco = crearPokeparadaObelisco
		pokeparadaObeliscoActualizada = crearPokeparadaObelisco
		pokeparadaObeliscoActualizada.nombre = "Pokeparada obelisco Actualizada"
		pokeparadaDOT = crearPokeparadaDOT
		repositorioPokeparada.create(pokeparadaUNSAM)
		repositorioPokeparada.create(pokeparadaObelisco)
		repositorioPokeparada.jsonParserPokeparada = new JsonParserPokeparada
		
		repositorioEspecie = helper.repositorioEspecie
		
		agregarRepositorio(repositorioEspecie)
		agregarRepositorio(repositorioPokeparada)
		
		
	}
	
	def initTipos() {
		helper.repositorioEspecie.agregarTipo(new Tipo("hierba"))
		helper.repositorioEspecie.agregarTipo(new Tipo("veneno"))
		helper.repositorioEspecie.agregarTipo(new Tipo("electricidad"))
		helper.repositorioEspecie.agregarTipo(new Tipo("fuego"))
	}
	def getNewRepositorioEspecie() {
		helper.repositorioEspecie = RepositorioEspecie.instance
		helper.repositorioEspecie.clean
		helper.repositorioEspecie
	}
	
	def crearPokeparadaDOT() {
		new Pokeparada() => [
			ubicacion = new Point( -34.5542418 , -58.491549 )
			nombre = "Pokeparada DOT"
			items = obtenerItemsPorNombre( newArrayList( "pokebola","superball" , "poción") )
		] 
	}
	def obtenerItemsPorNombre(List<String> nombresDeItems ){
		nombresDeItems.map[ nombreDeItem |  repositorioPokeparada.getItemByNombre(nombreDeItem) ].toList
	}
	def crearPokeparadaJardinBotanico() {
		new Pokeparada() => [ 
			ubicacion = new Point( -34.5595298 , -58.491549 ) 
			nombre = "Pokeparada JardinBotanico" 
			items = obtenerItemsPorNombre( newArrayList( "pokebola" ,"superball" ,"poción") )
		]
	}
	def crearPokeparadaQueNoEstaEnElRepo() {
		new Pokeparada() => [
			ubicacion = new Point( -34.603321 , -58.381123 )
			nombre = "Pokeparada que no esta en el repositorio"
			items = obtenerItemsPorNombre( newArrayList("pokebola" , "superball" , "poción") )
		] 
	}
	def initItems() {
		repositorioPokeparada.agregarItem(new Item(1,"pokebola"))
		repositorioPokeparada.agregarItem(new Item(1,"superball"))
		repositorioPokeparada.agregarItem(new Item(1,"poción"))
		repositorioPokeparada.agregarItem(new Item(1,"ultraball"))
		repositorioPokeparada.agregarItem(new Item(1,"superpoción"))	
	}
	def getNewRepositorioPokeparada() {
		repositorioPokeparada = RepositorioPokeparada.instance
		repositorioPokeparada.clean
		repositorioPokeparada
	}
	def crearPokeparadaObelisco() {
		new Pokeparada() => [
			ubicacion = new Point( -34.603759 , -58.381586 )
			nombre = "Pokeparada obelisco"
			items =  obtenerItemsPorNombre( newArrayList( "pokebola" , "superball" ,"poción") )
		]
	}
	def crearPokeparadaUNSAM() {
		new Pokeparada() => [
			ubicacion = new Point( -34.572224 , -58.535651 )
			nombre = "Pokeparada UNSAM"
			items = obtenerItemsPorNombre( newArrayList( "pokebola" , "ultraball" ,"superpoción") )
		]
	}
	
	def agregarRepositorio(Repositorio repo){
		repos.add(repo)
	}
	def eliminarRepositorio(Repositorio repo){
		repos.remove(repo)
	}
}