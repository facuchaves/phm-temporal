package ar.edu.unsam.algo3.tp.ui.utils

import ar.edu.unsam.algo3.tp.model.command.Rectangulo
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

/**
 * Clase auxiliar para crear componentes que se usen frecuentemente en la aplicacion
 */
class ComponentsUtils {
	
	/**
	 * Crea un TextBox con un label dentro de un panel horizontal
	 */
	def static buildTextBoxWithLabelHorizontal(Panel panel, String labelText , String textBoxValue) {
		var Panel subPanel = new Panel(panel)
		subPanel.setLayout(new HorizontalLayout())
		
		new Label(subPanel).text = labelText
		new TextBox(subPanel) => [
			value <=> textBoxValue
		]
	}
	
	/**
	 * Crea un NumericField con un label dentro de un panel horizontal
	 */
	def static buildNumericFieldWithLabelHorizontal(Panel panel, String labelText , String textBoxValue) {
		var Panel subPanel = new Panel(panel)
		subPanel.setLayout(new HorizontalLayout())
		
		new Label(subPanel).text = labelText
		new NumericField(subPanel) => [
			value <=> textBoxValue
		]
	}
	
	/**
	 * Crea un Selector con un label dentro de un panel horizontal
	 */
	def static buildSelectWithLabelHorizontal(Panel panel, String labelText , String itemsName, String valueName) {
		var Panel subPanel = new Panel(panel)
		subPanel.setLayout(new HorizontalLayout())
		
		new Label(subPanel).text = labelText
		new Selector<Rectangulo>(subPanel) => [
			items <=> itemsName
			value <=> valueName
		]
	}
	
}
