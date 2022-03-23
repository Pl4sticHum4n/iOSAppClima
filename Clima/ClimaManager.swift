

import Foundation

struct ClimaManager {
    let climaUrl = "https://api.openweathermap.org/data/2.5/weather?&appid=fb540c21323ed122505ce242df21b704&units=metric&lang=es"
    
    func obtenerClima(nombreCiudad: String) {
        let urlString = "\(climaUrl)&q=\(nombreCiudad)"
    }
    
    func  realizarSolicitud(urlString: String) {
        //crear url
        if let url = URL(string: urlString){
            
        
        //crear url sesion
        let sesion = URLSession(configuration: .default)
        
        //asignar una tarea
        let tarea = sesion.dataTask(with: url,completionHandler: controladorFinalizacion(datos:respuesta:error:))
        //comenzar tarea
        tarea.resume()
        }//fin if let
        
    }//fin realizar soli
    
    func controladorFinalizacion(datos:Data?, respuesta:URLResponse?, error: Error?) {
        
        if error != nil {
            print("error")
            return
        }
        
        //si no hubo errores
        if let datosSeguros = datos {
            let datosString = String(data: datosSeguros, encoding: .utf8)
            print(datosString ?? "No hubo datos en la API")
        }
    }
}
