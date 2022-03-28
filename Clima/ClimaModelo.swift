
import Foundation
struct ClimaModelo {
    let condicionID : Int
    let nombreCiudad: String
    let temperatura: Double
    let humedad : Double
    
    
    //propiedad computada
    var temperaturaString: String {
        return String(format: "%,1f", temperatura)
    }
    
    var nombreCondicion: String{
        switch condicionID{
        case 200...232:
            return "cloud.bolt"
        case 300...351:
            return "cloud.bolt.fill"
        case 400...451:
            return "snow"
        case 500...551:
            return "cloud.bolt.rain"
        case 800:
            return "cloud"
        case 800...804:
            return "cloud.fill"
        default:
            return "cloud"
        }
    }
}
