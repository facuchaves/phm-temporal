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
class PoblarAreaModelo extends EditarPoblarAreaModelo {
	
	override void doOnAccept(){
		RepositorioProcesos.instance.agregarProceso(poblarAreaCommand)
	}
	
}
