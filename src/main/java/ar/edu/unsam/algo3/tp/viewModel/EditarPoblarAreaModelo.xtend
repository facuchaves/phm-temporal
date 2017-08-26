package ar.edu.unsam.algo3.tp.viewModel

import ar.edu.unsam.algo3.tp.model.Especie
import ar.edu.unsam.algo3.tp.model.RepositorioEspecie
import ar.edu.unsam.algo3.tp.model.command.PoblarArea
import ar.edu.unsam.algo3.tp.ui.dao.RepositorioArea
import ar.edu.unsam.algo3.tp.ui.utils.ModelWithListAndSelect
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class EditarPoblarAreaModelo extends ModelWithListAndSelect<Especie> {
	
	PoblarArea poblarAreaCommand

	new(PoblarArea poblarArea) {
		poblarAreaCommand = poblarArea
	}
	
	def void doOnAccept(){
//		RepositorioProcesos.instance.agregarProceso(poblarAreaCommand)
		println("Edita")
	}
	
	override getSelect(){
		RepositorioEspecie.instance.especies
	}
	
	def getAreas(){
		RepositorioArea.instance.areas
	}
	
	override getList() {
		poblarAreaCommand.especies
	}
	
}
