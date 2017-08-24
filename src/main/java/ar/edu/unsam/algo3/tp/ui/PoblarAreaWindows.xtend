package ar.edu.unsam.algo3.tp.ui

import ar.edu.unsam.algo3.tp.viewModel.PoblarAreaModelo
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unsam.algo3.tp.model.command.PoblarArea

class PoblarAreaWindows extends EditarPoblarAreaWindows {
	
	new(WindowOwner parent) {
		super(parent, new PoblarAreaModelo( new PoblarArea) )
	}
	
}
