/**First Wollok example */
object fredy {
	
	var victima
	var salud = "bien"
	
	
	method asustar() {
		victima.asustate()
	}
	
	method cambiarVictima(nueva){
		victima = nueva
	}
	
	method sufreAtaque(potencia){
		salud = if (potencia > 100) "herida mortal" else "bien"
	}
	
	method seMurio() = salud.size() > 5
	// method seMurio() = salud.contains("mortal")
}


object juancito{
	
	var pulsaciones = 60 
	
	method asustate(){
		pulsaciones = pulsaciones *2
	}
	
	method sufreAtaque(potencia){
		pulsaciones = pulsaciones - potencia
	}
	
	method estaAsustado() {
		return pulsaciones > 100
	}
	
	method seMurio() = pulsaciones <= 0
}


object susanita {

	method asustate() {}
	method sufreAtaque(potencia) {}
	
	method estaAsustado() {
		return false
	}
	method seMurio() {
		return false
	}
}


object tito {

	var asustado = false
	
	method asustate(){
		asustado = true
	}
	method estaAsustado() = asustado
	
	method sufreAtaque(potencia) {
	   self.asustate()		
	}
	method seMurio() = self.estaAsustado()
}

object jason {
	
	var potencia = 100
	var ultimaVictima

	method atacar(alguien){
		
		alguien.sufreAtaque(potencia) 
		ultimaVictima = alguien
	}
	
	method potenciar(){
		potencia = potencia + 20
	}
	
	method ganador() {
		return ultimaVictima.seMurio()
	}
	
	method asustate(){
		potencia = 0
	}
	method estaAsustado() = potencia == 0 

}

object fantasma{
	
	const amigo = fredy
	
	method asustar(){
		amigo.asustar()
		amigo.asustar()
	}
}

object frankestein{

	method atacar(alguien){
         alguien.sufreAtaque(200)		
	}
}

object edificioAbandonado{
	var atacante = frankestein
		
	method llega(persona){
		atacante.atacar(persona) 
	}
	method atacante(nuevo){
		atacante = nuevo
	}
}

object bosque{
	method llega(persona){
		persona.asustate()
	}
	
}

object cementerio{
	var momentoDelDia= "dia"

	method saleElSol(){momentoDelDia = "dia"}
	method sePoneElSol(){momentoDelDia = "noche"}

	method habitanteActual(){
		 if (momentoDelDia == "dia") 
		 	return fredy
		 else 
		 	return fantasma
	}
	
	method llega(persona){
		fredy.cambiarVictima(persona)
		self.habitanteActual().asustar()
	}
}







