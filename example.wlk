object paquete {
	var destino = laMatrix // o puenteDeBrooklyn
	var estáPago = false // puede cambiar

	method destino() = destino

	method destino(_destino) {
	  destino = _destino
	}
	
	method estáPago() = estáPago

	method estáPago(_estáPago) {
		estáPago = _estáPago
	}

	method precioPaquete() = destino.precioPaqueteEnDestino()

	method puedeSerEntregadoPor(persona) = self.estáPago() && destino.dejarPasar(persona)
}
object neo {
	var tieneCréditoDisponible = true // a veces no tiene

	method tieneCréditoDisponible() = tieneCréditoDisponible

	method puedeHacerLlamada() = self.tieneCréditoDisponible()

	method peso() = 0
}

object jeanGray {
	method puedeHacerLlamada() = true

	method peso() = 65
}

object saraConnor {
	var peso = 80
	var vehículo = moto
	
	method vehículo() = vehículo

	method vehículo(_vehículo){
		vehículo = _vehículo
	}
	
	method peso() = peso + self.vehículo().pesoDelVehículo()
	
	method peso(_peso){
		peso = _peso
	}

	method puedeHacerLlamada() = false
}

object moto {
	method pesoDelVehículo() = 100
}

object camion {
	const pesoDelCamión = 500
	const mediaToneladaAdicional = 500 // magic number
	var cantidadDeAcoplados = 0

	method pesoDelVehículo() = pesoDelCamión + (self.cantidadDeAcoplados() * mediaToneladaAdicional)

	method cantidadDeAcoplados() = cantidadDeAcoplados
}

object puenteDeBrooklyn {
  method precioPaqueteEnDestino() = 150

  method dejarPasar(persona) = persona.peso() <= 1000
  // deja pasar a todo lo que pese hasta una tonelada (1000 kilos)
}

object laMatrix {
  method precioPaqueteEnDestino() = 500

  method dejarPasar(persona) = persona.puedeHacerLlamada()
  // deja entrar a quien pueda hacer una llamada.
}

/*
Para pensar:

Tipo de los objetos polimórficos:
	- Persona: mensajes que entiende puedeHacerLlamada() y peso() - paquete es el emisor 
	- Destino: precioPaqueteEnDestino() y dejarPasar(persona) - paquete es el emisor 
	- Vehiculo: mensajes que entiende pesoDelVehículo() - saraConnor es la emisora

Polimorfismo:
	- Tanto laMatrix como puenteDeBrooklyn entienden los mensajes precioPaqueteEnDestino() y dejarPasar(persona),
	esto facilita que el paquete pueda interactuar con ellos en puedeSerEntregadoPor(persona) y precioPaquete().
	- Las tres personas mensajeras, neo, saraConnor y jeanGrey, entienden los mensajes peso() y puedeHacerLlamada(),
	los destinos interactúan con estos mensajes, puenteDeBrooklyn con el mensaje peso() y laMatrix con puedeHacerLlamada()
	- Los dos tipos de vehículos que puede llegar a manejar saraConnor, camión y moto, entienden el mensaje pesoDelVehículo()
	- Paquete interactua con persona ( neo, saraConnor o jeanGrey) en el mensaje puedeSerEntregadoPor(persona) 
	y destino (puenteDeBrooklyn o laMatrix) en el mensaje precioPaquete()

Mencionar un mensaje que sea una orden y otro que sea una consulta
	- consulta: en paquete, el mensaje puedeSerEntregadoPor(persona)
	- orden: estáPago(_estáPago), destino(_destino) , peso(_peso) y vehículo(_vehículo)

En tu solución, el mensajero es un atributo del paquete o no? Por qué? Pensar como sería la manera alternativa.
	- No lo es, es un parametro. La forma alternativa de mi solucion es crearlo como atributo, similar a como configure destino.
*/