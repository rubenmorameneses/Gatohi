(defn iniciar
; crea la matriz de juego
(def x [[0 0 0] [0 0 0] [0 0 0]])
;-depende de tomarx
(defn tomarY [pos lista]
	(if (= pos 0)
		(first lista)
		(tomarY (- pos 1) (rest lista))
	)
)
;-devuelve una posicion del vector
(defn tomX [posX posY lista]
	(if (= posX 0)
		(tomarY posY (first lista))
		(tomX (- posX 1) posY (rest lista))
	)
)
;- depende de colocarX
(defn ponerX [posX posY lista]
	(if (= posX 0)
		(assoc  (first lista) posY 2)
		(ponerX (- posX 1) posY (rest lista))
	)
)
;-pone una X si no hay nada
(defn colocarX [columna fila lista]
	(if (= (tomX columna fila lista) 0) 
		(def x (assoc lista columna (ponerX columna fila lista)))
		(println "Esta ocupada la casilla  o puso una posicion incorrecta")
	)
)
;- depende de colocarO
(defn ponerO [posX posY lista]
	(if (= posX 0)
		(assoc  (first lista) posY 1)
		(ponerO (- posX 1) posY (rest lista))
	)
)
;-pone una X si no hay nada
(defn colocarO [columna fila lista]
	(if (= (tomX columna fila lista) 0) 
		(def x (assoc lista columna (ponerO columna fila lista)))
		(println "Esta ocupada la casilla  o puso una posicion incorrecta")
	)
)
; checkea si hay gane
(defn check [lista]
	; revisa si hay filas con OOO
	(if (or    (= (first (rest lista)) [1 1 1]) (= (first lista) [1 1 1]) (= (first (rest (rest lista))) [1 1 1]))
		(println "El jugador O ha ganado")
	)
	; revisa si hay columnas de O
	(if (and  (= (first (first lista)) 1) (= (first (first (rest lista))) 1) (= (first (first (rest (rest lista)))) 1))
		(println "El jugador O ha ganado")
	)
	(if (and  (= (last (first lista)) 1) (= (last (first (rest lista))) 1) (= (last (first (rest (rest lista)))) 1)) 
		(println "El jugador O ha ganado")
	)
	(if (and  (= (first (rest (first lista))) 1) (= (first (rest (first (rest lista)))) 1) (= (first (rest (first (rest (rest lista))))) 1))
		(println "El jugador O ha ganado")
	)
	; revisa diagonales de O
	(if (and  (= (first (first lista)) 1) (= (tomX 1 1 lista) 1) (= (tomX 2 2 lista) 1))
		(println "El jugador O ha ganado")
	)
	(if (and  (= (tomX 0 2 lista) 1) (= (tomX 1 1 lista) 1) (= (tomX 2 0 lista) 1))
		(println "El jugador O ha ganado")
	)
	
	; revisa si hay filas con XXX
	(if (or    (= (first (rest lista)) [2 2 2]) (= (first lista) [2 2 2]) (= (first (rest (rest lista))) [2 2 2]))
		(println "El jugador X ha ganado")
	)
	; revisa si hay columnas de X
	(if (and  (= (first (first lista)) 2) (= (first (first (rest lista))) 2) (= (first (first (rest (rest lista)))) 2))
		(println "El jugador X ha ganado")
	)
	(if (and  (= (last (first lista)) 2) (= (last (first (rest lista))) 2) (= (last (first (rest (rest lista)))) 2)) 
		(println "El jugador X ha ganado")
	)
	(if (and  (= (first (rest (first lista))) 2) (= (first (rest (first (rest lista)))) 2) (= (first (rest (first (rest (rest lista))))) 2))
		(println "El jugador X ha ganado")
	)
	; revisa diagonales de X
	(if (and  (= (first (first lista)) 2) (= (tomX 1 1 lista) 2) (= (tomX 2 2 lista) 2))
		(println "El jugador X ha ganado")
	)
	(if (and  (= (tomX 0 2 lista) 2) (= (tomX 1 1 lista) 2) (= (tomX 2 0 lista) 2))
		(println "El jugador X ha ganado")
	)
)






)