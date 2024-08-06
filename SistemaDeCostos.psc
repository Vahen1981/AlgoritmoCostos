Algoritmo sin_titulo
	//Definimos todas las variables y constantes
	Definir precioOriginal Como Real
	Definir DESCUENTO Como Entero
	Dimension DESCUENTO[4]
	Definir indiceDescuento Como Entero
	Definir cantidad Como Real
	Definir descuentoPorCantidad Como Entero
	Definir DESTINO Como Entero
	Dimension DESTINO[3]
	Definir NOMBREDESTINO Como Caracter
	Dimension NOMBREDESTINO[3]
	Definir indiceDestino Como Entero
	Definir peso Como Real
	Definir IVA Como Real
	Definir PRECIOPORKG Como Entero
	Definir precioTotalEnvio Como Real
	Definir precioFinal Como Real
	
	
	//Declaramos los valores de las constantes
	
	//Recorremos el array DESCUENTO[] para asignar valores de 0, 5 , 10 y 15
	Para i = 1 Hasta 4 Con Paso 1 Hacer
		DESCUENTO[i] = (i - 1) * 5 
	Fin Para
	
	//Recorremos el array DESTINO[] para asignar valores de 1000, 2000 y 3000
	Para i = 1 Hasta 3 Con Paso 1 Hacer
		DESTINO[i] = i * 1000 
	Fin Para
	
	NOMBREDESTINO[1] = "Santiago"
	NOMBREDESTINO[2] = "Valpara�so"
	NOMBREDESTINO[3] = "Rancagua"
	IVA = 19
	PRECIOPORKG = 500
	
	
	//Solicitamos la informaci�n al usuario y la guardamos en las variables
	Escribir "Ingrese el precio del producto en pesos chilenos"
	Leer precioOriginal
	//Evaluamos que la informaci�n sea correcta
	Mientras precioOriginal < 1 Hacer
		Escribir "Precio no v�lido. Ingrese un precio v�lido"
		Leer precioOriginal
	Fin Mientras
	Escribir "Precio ingresado: $" , precioOriginal
	Escribir ""
	Escribir "�Tiene un cup�n de descuento? Ingrese el n�mero que corresponda al cup�n"
	Escribir "[1] Sin descuento"
	Escribir "[2] 5% de descuento"
	Escribir "[3] 10% de descuento"
	Escribir "[4] 15% de descuento"
	Leer indiceDescuento
	//Evaluamos que la informaci�n sea correcta
	Mientras indiceDescuento < 1 O indiceDescuento > 4 Hacer
		Escribir "Ingrese un cup�n de descuento v�lido"
		Escribir "[1] Sin descuento"
		Escribir "[2] 5% de descuento"
		Escribir "[3] 10% de descuento"
		Escribir "[4] 15% de descuento"
		Leer indiceDescuento
	Fin Mientras
	//Calculamos cual ser� el cupon de descuento con un si entonces
	Si indiceDescuento = 1 Entonces
		Escribir "El sistema no aplicar� descuentos."
	SiNo
		Escribir "Se aplicar� un " , DESCUENTO[indiceDescuento] , "% de descuento"
	Fin Si
	Escribir ""
	Escribir "Ingrese la cantidad de productos"
	Leer cantidad
	//Evaluamos que la informaci�n sea correcta
	Mientras cantidad < 1 Hacer
		Escribir "Ingrese una cantidad v�lida"
		Leer cantidad
	Fin Mientras
	//Calculamos cual ser� el descuento por cantidad con un si entonces
	Si cantidad  >= 5 Entonces 
		descuentoPorCantidad = DESCUENTO[2] 
	FinSi
	Si cantidad  > 5  Y cantidad <= 10 Entonces
		descuentoPorCantidad = DESCUENTO[3]
	FinSi
	Si cantidad  > 10 Entonces
		descuentoPorCantidad = DESCUENTO[4]
	SiNo
		descuentoPorCantidad = DESCUENTO[1]
	Fin Si

	Escribir "Usted llevar� " , cantidad , " productos. " , "Obtendr� un " , descuentoPorCantidad , "% de descuento adicional"
	Escribir ""
	Escribir "Ingrese el destino al que se enviar�"
	Escribir "[1] Santiago"
	Escribir "[2] Valpara�so"
	Escribir "[3] Rancagua"
	Leer indiceDestino 
	//Evaluamos que la informaci�n sea correcta
	Mientras indiceDestino > 3 O indiceDestino < 1 Hacer
		Escribir "Destino no reconocido, por favor ingrese el n�mero que corresponde al destino"
		Escribir "[1] Santiago"
		Escribir "[2] Valpara�so"
		Escribir "[3] Rancagua"
		Leer indiceDestino
	Fin Mientras
	Escribir "Destino ingresado: " , NOMBREDESTINO[indiceDestino]
	Escribir ""
	Escribir "Ingrese el peso del producto en kg (precio por kg $500)"
	Leer peso 
	//Evaluamos que la informaci�n sea correcta
	Mientras peso < 0 Hacer
		Escribir "El peso ingresado no es v�lido, por favor ingrese un peso v�lido"
		Leer peso
	Fin Mientras
	Escribir "El peso del producto es " , peso, " kg"
	Escribir ""
	Escribir ""
	Escribir "**********************************************************************"
	Escribir "************************* Desglose de costos *************************"
	Escribir "**********************************************************************"
	Escribir ""
	Escribir "Precio original: $" , precioOriginal
	precioFinal = precioOriginal * ((100 - DESCUENTO[indiceDescuento]) / 100)
	Escribir "Se aplica un cup�n de " , DESCUENTO[indiceDescuento] , "% de descuento($" , DESCUENTO[indiceDescuento] * 0.01 * precioOriginal , "): $", precioFinal
	Escribir "IVA(" , IVA , "%) : $" ,  IVA/100*precioFinal
	precioFinal = precioFinal * ((IVA/100) + 1)
	Escribir "Precio con IVA: $" , precioFinal
	Escribir "Descuento del precio unitario por cantidad: " , descuentoPorCantidad , "%"
	precioFinal = (100 - descuentoPorCantidad) * 0.01 * precioFinal
	Escribir "Precio unitario aplicando el descuento por cantidad: $" , precioFinal
	Escribir "Subtotal por " , cantidad , " producto(s) : $" , precioFinal * cantidad
	precioTotalEnvio = (peso * PRECIOPORKG * cantidad) + DESTINO[indiceDestino]
	Escribir "Costo de env�o: $" ,  precioTotalEnvio
	Escribir "     Desglose env�o: "
	Escribir "     - Precio por peso total (" , peso * cantidad , "kg) de todos los productos: $" , peso * PRECIOPORKG * cantidad
	Escribir "     - Costo fijo por env�o a " , NOMBREDESTINO[indiceDestino] , ": $" , DESTINO[indiceDestino] 
	precioFinal = (precioFinal * cantidad) + precioTotalEnvio
	Escribir "Prefio final por ", cantidad , " producto(s) : $" , precioFinal
FinAlgoritmo
