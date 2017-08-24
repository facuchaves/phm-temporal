package ar.edu.unsam.algo3.tp.ui.utils

import ar.edu.unsam.algo3.tp.model.command.Command
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
abstract class ModelWithListAndSelect<T> extends Command{
	
//	def void init()
	
	T itemToAdd
	T itemToDelete
	Set<T> list = new HashSet
	protected List<T> select = newArrayList
	
	def addToList(){
		list.add(itemToAdd)
	}
	
	def removeFromList(){
		list.remove(itemToDelete)	
	}
	
}
