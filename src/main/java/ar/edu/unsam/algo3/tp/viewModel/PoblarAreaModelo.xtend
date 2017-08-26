package ar.edu.unsam.algo3.tp.viewModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class PoblarAreaModelo extends EditarPoblarAreaModelo {
	
	override void doOnAccept(){
		poblarAreaCommand.validar
		RepositorioProcesos.instance.agregarProceso(poblarAreaCommand)
	}
	
}
