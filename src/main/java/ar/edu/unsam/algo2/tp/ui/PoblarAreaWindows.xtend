package ar.edu.unsam.algo2.tp.ui

import java.awt.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class PoblarAreaWindows extends SimpleWindow<Encuesta> {
	
	new(WindowOwner parent, Encuesta model) {
		super(parent, model)
	}
	
	override protected addActions(org.uqbar.arena.widgets.Panel actionsPanel) {
	}
	
	override protected createFormPanel(org.uqbar.arena.widgets.Panel mainPanel) {
		this.title = "Poblar Area"
//		
//		mainPanel.layout = new ColumnLayout(2)
//		
//		var Panel topLeftPanel0 = new Panel(mainPanel)
//		var Panel topLeftPanel = new Panel(mainPanel)
//		topLeftPanel.setLayout(new VerticalLayout())
//		
//		buildTextBoxWithLabelHorizontal( topLeftPanel , "Descripcion" , "zonaVotacion")
//		buildTextBoxWithLabelHorizontal( topLeftPanel , "Nivel Max" , "zonaVotacion")
//		buildTextBoxWithLabelHorizontal( topLeftPanel , "Densidad" , "zonaVotacion")
//		
//		var Panel topRightPanel = new Panel(topLeftPanel0)
//		topRightPanel.setLayout(new HorizontalLayout())
//		
//		buildTextBoxWithLabelHorizontal( topRightPanel , "Nivel Min" , "zonaVotacion")
//		
//		var Panel bottomLeftPanel = new Panel(mainPanel)
//		bottomLeftPanel.setLayout(new HorizontalLayout())
//		
//		new Label(bottomLeftPanel).text = "Especies"
//		new List(bottomLeftPanel) => [
//			items <=> "zonas"
//			value <=> "zonaVotacion"
//			width = 220
//			height = 220
//		]
//
//		var Panel bottomRightPanel = new Panel(mainPanel)
//		bottomRightPanel.setLayout(new VerticalLayout())
//		
//		new Selector<Candidato>(bottomRightPanel) => [
//			allowNull = false
//			items <=> "zonas"
//			value <=> "zonaVotacion"
//		]
//		
//		var especieButtonsPanel = new Panel(bottomRightPanel)
//		especieButtonsPanel.setLayout(new HorizontalLayout())
//		
//		new Button(especieButtonsPanel) => [
//			caption = "Agregar especie"
//		]
//		
//		new Button(especieButtonsPanel) => [
//			caption = "Eliminar especie"
//		]
//				
//		var buttonsPanel = new Panel(mainPanel);
//		buttonsPanel.setLayout(new HorizontalLayout());
//		
//		new Button(buttonsPanel) => [
//			caption = "Aceptar"
//			alignRight
//		]
//		
//		new Button(buttonsPanel) => [
//			caption = "Cancelar"
//			alignRight
//		]
	}
	
	/**
	 * Crea un textbox con un label
	 */
//	def buildTextBoxWithLabelHorizontal(Panel panel, String labelText , String textBoxValue) {
//		var Panel subPanel = new Panel(panel)
//		subPanel.setLayout(new HorizontalLayout())
//		
//		new Label(panel).text = labelText
//		new TextBox(panel) => [
//			value <=> textBoxValue
//		]
//	}
//	
	
}
