
import Foundation
struct ClimaModelo {
    let condicionID : Int
    let nombreCiudad: String
    let temperatura: Double
    let humedad : Double
    let description: String
    
    //propiedad computada
    var temperaturaString: String {
        return String(format: "%.1f", temperatura)
    }
    
    var nombreCondicion: String{
        switch condicionID{
        //Tormenta
        case 200...232:
            return "cloud.heavyrain.fill"
        //LLovizna
        case 300...351:
            return "cloud.drizzle"
        //LLuvia
        case 500...551:
            return "cloud.rain"
        //Nieve
        case 600...622:
            return "cloud.snow"
        //Soleado
        case 701...800:
            return "cloud.sun"
        //Despejado
        case 800:
            return "sun.min"
        //Nuboso
        case 801...804:
            return "cloud.fill"
        default:
            return "cloud"
        }
    }
    
    var fondoClima: String{
        switch condicionID{
        //Tormenta
        case 200...232:
            return "tormenta"
        //LLovizna
        case 300...351:
            return "llovizna"
        //LLuvia
        case 500...551:
            return "lluvia"
        //Nieve
        case 600...622:
            return "nevada"
        //Soleado
        case 701...781:
            return "soleado"
        //Despejado
        case 800:
            return "despejado"
        //Nuboso
        case 801...804:
            return "nubes"
        default:
            return "fondo"
        }
    }
}
