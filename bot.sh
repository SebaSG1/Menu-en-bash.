
#!/bin/bash

echo "Buen dia Sebastian"
echo "--- Menu ---"
 
  
Opcion1="Que hora es?"
Opcion2="Clima de Bahia Blanca"
Opcion3="Frase celebre del dia"
Opcion4="Calidad del aire"
Opcion5="Jugar a adivinar el numero"
Opcion6="Borrar archivos y carpetas creados en el juego de adivinar el numero"
Opcion7="El dia que mas te viciaste con el juego de adivinar el numero"
Opcion8="That's all folks"


 
select opcion in "$Opcion1" "$Opcion2" "$Opcion3" "$Opcion4" "$Opcion5" "$Opcion6" "$Opcion7" "$Opcion8" ;

do
    if [ "$opcion" = "$Opcion8"  ]; then 
         echo "Hasta la próxima, nos vemos!"
         exit    

    elif [ "$opcion" = "$Opcion1" ]; then
    date +%r

    elif [ "$opcion" = "$Opcion2" ]; then
    curl wttr.in/Bahia_Blanca?0

    elif [ "$opcion" = "$Opcion3" ]; then
    curl -s  https://frasedeldia.azurewebsites.net/api/phrase | jq -r '.phrase'

    elif [ "$opcion" = "$Opcion4" ]; then
    curl https://gobiernoabierto.bahia.gob.ar/WS/3040 | jq -r '.3040'


    elif [ "$opcion" = "$Opcion5" ]; then
    
     numero=$(($RANDOM%10))
     respuesta=11
     cont=0
     
     while [ $numero -ne $respuesta ]
     do
       let cont=cont+1
        read -p "¿Cual es el numero? 1-10: " respuesta
        echo "Numero de intentos" $cont "de 5"
        if [ $numero -lt $respuesta ]
        then
        echo "El numero es menor a:  " $respuesta
       elif [ $numero -gt $respuesta ]
       then
       echo "EL numero es mayor a: " $respuesta
        fi
      done

      echo "Muy bien, lograste adivinar el numero: " $numero. 
      echo "Numero de intentos totales: " $cont
      
      
      VariableGuardar=$cont
      Resultado=resultado.txt
      echo $VariableGuardar > $Resultado
      
      mkdir -p -- JuegoResultado-$(date +%d-%m-%y)
      
      echo $cont "es el total de intentos realizados el dia de hoy para adivinar el numero $numero " >> JuegoResultado-$(date +%d-%m-%y)/resultado.txt
      
      

    elif [ "$opcion" = "$Opcion6" ]; then
    echo "A continuacion se borraran los archivos y carpetas creadas en el punto 5"
        select borrar in "Si" "No";
        do
            if [[ $borrar = "Si" ]]
            then
            rm -rf JuegoResultado-$(date +%d-%m-%y)
            echo "Archivo borrado correctamente"
           elif [[ $borrar = "No" ]]
            then
            echo "Nos vemos!"
            fi
            break
        done
            
            
    elif [ "$opcion" = "$Opcion7" ]; then
    ls -lu $Resultado
    
    
    else
    echo "Opción no válida"
    fi
    done
    
