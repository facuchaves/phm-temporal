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
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@Observable
class DominioRepositorios {
	var List<Repositorio> repositorios
	//TestHelper helper = new TestHelper
//	List<Opcion> opciones = newArrayList
	var Repositorio repoSeleccionado
	var String nombreRepo = ""
	var String nuevoNombreRepo
	
	RepositorioEspecie repositorioEspecie = RepositorioEspecie.instance
	Especie bulbasaur
	Especie ivysaur
	Especie pikachu
	Especie charmander
	Especie especieInvalida
	int idInexistenteEnElRepo = 99
	
	RepositorioPokeparada repositorioPokeparada = RepositorioPokeparada.instance
	Pokeparada pokeparadaUNSAM
	Pokeparada pokeparadaObelisco 
	Pokeparada pokeparadaDOT 
	Pokeparada pokeparadaJardinBotanico
	//JsonObject pokeparadaUNSAMJson = helper.crearPokeparadaUNSAMJson
	
	new(ActualizacionApplication application) {
//		repositorios.clear
//		repositorioEspecie = getNewRepositorioEspecie
//		repositorioPokeparada = getNewRepositorioPokeparada
//		
//		repos.add(repositorioEspecie)
//		repos.add(repositorioPokeparada)
	}
	@Dependencies("nuevoNombreRepo")
	def getNombreRepo(){
		nombreRepo = nuevoNombreRepo
	}
	
	@Dependencies("repoSeleccionado")
	def getRepositorios(){
//		initTipos()
//		//Repositorio Especie
////		repositorioEspecie = RepositorioEspecie.instance
//		bulbasaur = crearBulbasaur
//		ivysaur = crearIzysaur
//		repositorioEspecie.create(bulbasaur)
//		repositorioEspecie.create(ivysaur)
//		
//		
//		//Repositorio Pokeparada
////		repositorioPokeparada = getNewRepositorioPokeparada
//		initItems()
//		pokeparadaUNSAM = crearPokeparadaUNSAM
//		pokeparadaObelisco = crearPokeparadaObelisco
//		pokeparadaDOT = crearPokeparadaDOT
//		repositorioPokeparada.create(pokeparadaUNSAM)
//		repositorioPokeparada.create(pokeparadaObelisco)
//		repositorioPokeparada.create(pokeparadaDOT)
		
		repositorioEspecie.description = "Repo Especie"
		repositorioPokeparada.description = "Repo Pokeparada"
		
		setRepositorios(#[repositorioEspecie, repositorioPokeparada])
		
		repositorios.map[repo | repo.toString]
//		#["Repositorio Pokeparada", "Repositorio Especie"]
	}
	
	@Dependencies("repoSeleccionado")
	def getRepoSeleccionado(){
		repoSeleccionado.toString
	}
//	def initTipos() {
//		repositorioEspecie.agregarTipo(new Tipo("hierba"))
//		repositorioEspecie.agregarTipo(new Tipo("veneno"))
//		repositorioEspecie.agregarTipo(new Tipo("electricidad"))
//		repositorioEspecie.agregarTipo(new Tipo("fuego"))
//	}
//	
//	def crearBulbasaur() {
//		new Especie() => [
//			numero = 1
//			nombre = "Bulbasaur"
//			puntosAtaque = 10
//			puntosSalud = 15
//			descripcion = "Este pokemon es un Bulbasaur es fácil verle echándose una siesta al sol."
//			tipos = tiposDelTest
//			velocidad = 7
//		]
//	}
//	
//	def crearIzysaur() {
//		new Especie() => [
//			numero = 2
//			nombre = "Ivysaur"
//			puntosAtaque = 15
//			puntosSalud = 20
//			descripcion = "Este pokemon lleva un bulbo en el lomo."
//			tipos = tiposDelTest
//			velocidad = 8
//		]
//	}
//	
//	def getTiposDelTest() {
//		obtenerTiposPorNombres( newArrayList( "hierba" , "veneno") )
//	}
//	
//	def getNewRepositorioEspecie() {
//		repositorioEspecie = RepositorioEspecie.instance
//		repositorioEspecie.clean
//		repositorioEspecie.description = "Repo Especie"
//		repositorioEspecie
//	}
//	
//	def obtenerTiposPorNombres(List<String> nombresDeTipos){
//		nombresDeTipos.map[ nombreDeTipo | repositorioEspecie.getTipoByNombre( nombreDeTipo ) ].toList
//	}
//	
//	def crearPokeparadaDOT() {
//		new Pokeparada() => [
//			ubicacion = new Point( -34.5542418 , -58.491549 )
//			nombre = "Pokeparada DOT"
//			items = obtenerItemsPorNombre( newArrayList( "pokebola","superball" , "poción") )
//		] 
//	}
//	def obtenerItemsPorNombre(List<String> nombresDeItems ){
//		nombresDeItems.map[ nombreDeItem |  repositorioPokeparada.getItemByNombre(nombreDeItem) ].toList
//	}
//	def crearPokeparadaJardinBotanico() {
//		new Pokeparada() => [ 
//			ubicacion = new Point( -34.5595298 , -58.491549 ) 
//			nombre = "Pokeparada JardinBotanico" 
//			items = obtenerItemsPorNombre( newArrayList( "pokebola" ,"superball" ,"poción") )
//		]
//	}
//	def initItems() {
//		repositorioPokeparada.agregarItem(new Item(1,"pokebola"))
//		repositorioPokeparada.agregarItem(new Item(1,"superball"))
//		repositorioPokeparada.agregarItem(new Item(1,"poción"))
//		repositorioPokeparada.agregarItem(new Item(1,"ultraball"))
//		repositorioPokeparada.agregarItem(new Item(1,"superpoción"))	
//	}
//	def getNewRepositorioPokeparada() {
//		repositorioPokeparada = RepositorioPokeparada.instance
//		repositorioPokeparada.clean
//		repositorioPokeparada.description = "Repo Especie"
//		repositorioPokeparada
//	}
//	def crearPokeparadaObelisco() {
//		new Pokeparada() => [
//			ubicacion = new Point( -34.603759 , -58.381586 )
//			nombre = "Pokeparada obelisco"
//			items =  obtenerItemsPorNombre( newArrayList( "pokebola" , "superball" ,"poción") )
//		]
//	}
//	def crearPokeparadaUNSAM() {
//		new Pokeparada() => [
//			ubicacion = new Point( -34.572224 , -58.535651 )
//			nombre = "Pokeparada UNSAM"
//			items = obtenerItemsPorNombre( newArrayList( "pokebola" , "ultraball" ,"superpoción") )
//		]
//	}
	
	def agregarRepositorio(Repositorio repo){
		repositorios.add(repo)
	}
	def eliminarRepositorio(Repositorio repo){
		repositorios.remove(repo)
	}
}