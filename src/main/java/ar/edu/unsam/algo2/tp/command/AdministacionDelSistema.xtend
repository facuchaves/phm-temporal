package ar.edu.unsam.algo2.tp.command

import java.util.List

class AdministacionDelSistema implements AdministacionDelSistemaI{
	
	override run(List<Command> comandos) {
		comandos.forEach[ execute ]
	}
	
}