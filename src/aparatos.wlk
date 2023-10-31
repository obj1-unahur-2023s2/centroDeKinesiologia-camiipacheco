import paciente.*

class Aparato{
	const property color = "blanco"
	method puedeUsar(paciente)= true 
	method modificarNiveles(paciente){
		paciente.nivelDeDolor(0)
		paciente.nivelDeFortaleza(0)
	}
	method efectoDeUso(unPaciente) //metodoAbstracto
	method necesitaMantenimiento()= false
	method recibirMatenimiento(){}
}
class Magneto inherits Aparato{
	var imantacion=800
	override method modificarNiveles(paciente) {
	   paciente.nivelDeDolor(paciente.nivelDeDolor()* 0.1)
	}
	override method efectoDeUso(unPaciente){
		imantacion=0.max(imantacion-1)
	}
	override method necesitaMantenimiento()= imantacion < 100
	override method recibirMatenimiento(){
		imantacion+=500
	}
}

class Bicicleta inherits Aparato {
	var cantidadAceitePerdido=0
	var cantidadTornillo=0
	override method puedeUsar(paciente)= paciente.edad() > 8
	override method modificarNiveles(paciente){
	   paciente.nivelDeDolor(4)
	   paciente.nivelDeFortaleza(3)
	}
	override method efectoDeUso(unPaciente){
		if (unPaciente.nivelDeDolor()>30){
			cantidadTornillo ++
		}
		if (unPaciente.edad().between(30,50)){
			cantidadAceitePerdido++
		}
	}
	override method necesitaMantenimiento()= cantidadTornillo >= 10 or cantidadAceitePerdido >=5
	override method recibirMatenimiento(){
		cantidadAceitePerdido=0
		cantidadTornillo=0
	}  
}

class Minitramp inherits Aparato {
	override method puedeUsar(paciente)= paciente.nivelDeDolor()<20
	override method modificarNiveles(paciente){
	   	paciente.nivelDeFortaleza(paciente.edad()*0.1)
	}
	override method efectoDeUso(unPaciente){}
}