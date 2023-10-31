import aparatos.*
import paciente.*


object centro {
	const aparatos =[]
	const pacientes= #{}
	
	
	method agregarPaciente (unPaciente){
		pacientes.add(unPaciente)
	}
	
	method agregarAparatos(listaAparatos){
		aparatos.addAll(listaAparatos)
	}
	
	method coloresRepetidos(){
		aparatos.map({a=>a.color()}).asSet()
	}
	
	method pacientesMenoresDe8Anios(){
		pacientes.filter({p => p.edad()<8})
	}
	
	method cantidadQueNoPuedenCumplirSesion(){
		pacientes.count({p=>!p.puedeRealizarRutina()})
	}
}
