import frutas.*

object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}


object licuadoDeFrutas {
  const frutas = []
  var nutrientes = 0
  method agregarFruta(fruta) {
    if (!frutas.contains(fruta)) {
      frutas.add(fruta)
      nutrientes += fruta.nutrientes() / 1000
    }
  }

  method rendimientoQueOtorga(dosisConsumida) = nutrientes * dosisConsumida


}

object aguaSaborizada {
 var sabor = whisky

 method saborizar(bebida) {
   sabor = bebida
 }

  method rendimientoQueOtorga(dosisConsumida) = sabor.rendimientoQueOtorga(dosisConsumida /4) + 1
}

object coctel {
  const bebidas = []

  method proporcion() = bebidas.size()

  method agregarBebida(bebida) {
    if (!bebidas.contains(bebida)) {
      bebidas.add(bebida)
    }
  }

  method rendimientoQueOtorga(dosisConsumida) = bebidas.fold(1,{acum, bebida => acum * bebida.rendimientoQueOtorga(dosisConsumida / self.proporcion())})
}
