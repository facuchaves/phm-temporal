package ar.edu.unsam.algo2.tp.ui

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unsam.algo2.tp.command.Command
import org.uqbar.commons.model.annotations.Observable

@Observable

class RepositorioProcesos {

	static var RepositorioProcesos instance
	
	private new(){
		
	}
	
	public static def getInstance(){
		if( instance == null ){
			instance = new RepositorioProcesos
		}
		return instance
	}
	
	/*
	 * El valor de búsqueda debe coincidir parcialmente con su nombre 
	 * o exactamente con el nombre de alguno de sus ítems disponibles.
	 */
	
	@Accessors List <Command> procesos = new ArrayList()
	 
	def agregarProceso(Command proceso){
		procesos.add(proceso)
	}
	
}