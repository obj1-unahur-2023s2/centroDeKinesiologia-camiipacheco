import aparatos.*

class Paciente {
	const property edad
	var nivelDeFortaleza
	var nivelDeDolor
	const rutina =[]
	
	method nivelDeFortaleza()= nivelDeFortaleza
	method nivelDeDolor()= nivelDeDolor
	
	method nivelDeDolor(cantidad){
		nivelDeDolor = 0.max(nivelDeDolor-cantidad) 
	}
	method nivelDeFortaleza(cantidad){
		nivelDeFortaleza += cantidad
	}
	method usarAparato(aparato){
		if (self.puedeUsar(aparato)){
			aparato.efectoDeUso(self)
			aparato.modificarNiveles(self)
		}
		else {self.error("  no es posible usar este aparato ")}
	}
	
	method puedeUsar(aparato)= aparato.puedeUsar(self)
	
	method asignarRutina(listaDeAparatos){
    	rutina.addAll(listaDeAparatos)
    }
	
	method realizarRutina(){
		if(!self.puedeRealizarRutina()){
			self.error("no puede realizar la rutina porque conttiene aparatos que no tiene permitido")
		}
		rutina.forEach({a=> self.usarAparato(a)})
	} 
	
	method puedeRealizarRutina(){
		return rutina. all({a=>self.puedeUsar(a)})
	}
}

class Resistente inherits Paciente   {
	override method realizarRutina(){
		super()
		nivelDeFortaleza += rutina.size()
	}
}

class Caprichoso  inherits Paciente  {
	override method puedeRealizarRutina()= super()&& self.hayAparatoRojo()   
	method hayAparatoRojo()= rutina.any({a=>a.color()== "rojo"})
	override method realizarRutina(){
		(1..2).forEach({e => super()})
	} 
}

class RapidaRecuperacion  inherits Paciente {
	 override method realizarRutina(){
	 	super()
	 	nivelDeDolor -= 0.max(coeficienteDeRecuperacion.valor())
	 }	 
}

object coeficienteDeRecuperacion{
	var property valor= 3
}