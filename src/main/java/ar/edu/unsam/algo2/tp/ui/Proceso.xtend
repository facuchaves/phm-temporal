package ar.edu.unsam.algo2.tp.ui

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Proceso {
	String nombre
	Date fecha
	
}
