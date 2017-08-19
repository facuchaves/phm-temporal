package ar.edu.unsam.algo2.tp.ui

import ar.edu.unsam.algo2.tp.Especie
import ar.edu.unsam.algo2.tp.command.AdministacionDelSistema
import ar.edu.unsam.algo2.tp.ui.utils.ComponentsUtils
import ar.edu.unsam.algo2.tp.ui.utils.ListWithSelectComponent
import ar.edu.unsam.algo2.tp.ui.viewModel.ModeloPoblarArea
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

class PoblarAreaWindows extends Window<ModeloPoblarArea> {
	
	var AdministacionDelSistema administrador
	
	new(WindowOwner parent, ModeloPoblarArea model, AdministacionDelSistema _administrador) {
		super(parent, model)
		administrador = _administrador
	}
	
	
	override createContents(Panel mainPanel) {
		this.title = "Poblar Area"
		
		mainPanel.layout = new ColumnLayout(2)
		
		var Panel topLeftPanel = new Panel(mainPanel)
		topLeftPanel.setLayout(new VerticalLayout())
		
		ComponentsUtils.buildTextBoxWithLabelHorizontal( topLeftPanel , "Descripción : " , "descripcion")
		ComponentsUtils.buildNumericFieldWithLabelHorizontal( topLeftPanel , "Nivel Max : " , "nivelMaximo")
		ComponentsUtils.buildNumericFieldWithLabelHorizontal( topLeftPanel , "Densidad : " , "densidad")
		
		var Panel topRightPanel = new Panel(mainPanel)
		topRightPanel.setLayout(new VerticalLayout())
		
		ComponentsUtils.buildNumericFieldWithLabelHorizontal( topRightPanel , "Nivel Min : " , "nivelMinimo")
		ComponentsUtils.buildSelectWithLabelHorizontal(topRightPanel, "Area : " , "areas" , "areaSeleccionada" )
		
		var ListWithSelectComponent<Especie> listWithSelectComponent = new ListWithSelectComponent<Especie>(mainPanel, "Especie" , this.modelObject )				
		listWithSelectComponent.render()
		
		var buttonsPanel = new Panel(mainPanel);
		buttonsPanel.setLayout(new HorizontalLayout());
		
		new Button(buttonsPanel) => [
			caption = "Aceptar"
			alignRight
			onClick([|this.modelObject.AgregarComando(administrador) this.close])
		]
		
		new Button(buttonsPanel) => [
			caption = "Cancelar"
			alignRight
			onClick([|this.close])
		]
	}
	
}
