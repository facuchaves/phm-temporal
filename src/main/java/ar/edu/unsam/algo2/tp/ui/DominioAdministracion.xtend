package ar.edu.unsam.algo2.tp.ui

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class DominioAdministracion {
	
	List<Opcion> opciones = newArrayList
	
	new(AdministradorApplication app) {
		opciones.add(new Opcion("Agregar Acciones", [ | new AgregarAccionesWindow(app, new ModeloAcciones).open ]))
		//opciones.add(new Opcion("Eliminar Acciones", [ | new PoblarAreaWindows(app, new Encuesta).open ]))
		opciones.add(new Opcion("Poblar area", [ | new PoblarAreaWindows(app, new Encuesta).open ]))
	}
	
	def getProcesos(){

		val proceso1 = new Proceso() => [
			nombre = "Ejecucion1"
		]
		
		val proceso2  = new Proceso() => [
			nombre = "Ejecucion2"	
		]
		
		val proceso3 = new Proceso() => [
			nombre = "Ejecucion3"	
		]

		#[proceso1, proceso2, proceso3]
		
	}
	
}
