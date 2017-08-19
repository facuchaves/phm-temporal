package ar.edu.unsam.algo2.tp.ui.utils

import java.util.List
import java.util.Set
import org.uqbar.commons.model.annotations.Observable
import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
abstract class ModelWithListAndSelect<T> {
	
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