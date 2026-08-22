object paquete {
	var destino = laMatrix // o puenteDeBrooklyn
	var estáPago = false // puede cambiar

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

	method vehículoNuevo(_vehículoNuevo){
		vehículo = _vehículoNuevo
	}
	
	method peso() = peso + self.vehículo().pesoDelVehículo()
	
	method pesoNuevo(_pesoNuevo){
		peso = _pesoNuevo
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