//
//  ViewController.swift
//  Clima
//
//  Created by mac16 on 17/03/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mensajeHumedad: UILabel!
    @IBOutlet weak var nombreUbicacion: UITextField!
    @IBOutlet weak var mensajeClima: UILabel!
    @IBOutlet weak var fondoClima: UIImageView!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var imagenClima: UIImageView!
    var climaManager = ClimaManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        climaManager.delegado = self
        // Do any additional setup after loading the view.
        nombreUbicacion.delegate = self
    }
    @IBAction func ubicacionButton(_ sender: UIButton) {
        
    }
    
    @IBAction func buscarButton(_ sender: UIButton) {
        nombreUbicacion.endEditing(true)
        
    }
    
    //MARK: metodos de ui text field
    
    // Identificar el boton del teclado virtual
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Ciudad a buscar")
        //ocultar teclado
        textField.endEditing(true)
        print(nombreUbicacion.text ?? "")
        return true
    }
    
    // Identifica cuando el usuario termina de editar
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.endEditing(true)
        print("Edicion terminada")
        //Llamada a la api
        climaManager.obtenerClima(nombreCiudad: nombreUbicacion.text ?? "morelia")
        
    }
    
    // Evitar busqueda vacia
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        if nombreUbicacion.text != ""{
            return true
        } else {
            self.mensajeClima.text = "Debes ingresar una busqueda"
            self.mensajeHumedad.text = "Nivel de humedad"
            self.imagenClima.image = UIImage(systemName: "cloud")
            self.fondoClima.image = UIImage(named: "fondo")
            return false
        }
        
    }
    
    
    
}
//Buscar por coordenadas
//https://api.openweathermap.org/data/2.5/weather?lat=19.710237&lon=-101.221211&appid=0a696aadac328d0ed56eb111d05da9f1&units=metric&lang=sp
//Buscar por nombre de ubicacion
//https://api.openweathermap.org/data/2.5/weather?q=Siberia&appid=0a696aadac328d0ed56eb111d05da9f1&units=metric&lang=sp

// MARK: climamanager delegado y sus mètodos para actualizar clima y mostrar el error
extension ViewController: ClimaManagerDelegado{
    func actualizarClima(objClima: ClimaModelo) {
        DispatchQueue.main.async {
            print("Temperatura: \(objClima.temperaturaString)")
            self.temperaturaLabel.text = "\(objClima.temperaturaString)"
            self.mensajeClima.text = "El tiempo en \(objClima.nombreCiudad) es: \(objClima.description)"
            self.mensajeHumedad.text = "Humedad: \(objClima.humedad)"
            self.imagenClima.image = UIImage(systemName: objClima.nombreCondicion)
            self.fondoClima.image = UIImage(named: objClima.fondoClima)
        }
        print("Se actualizo el clima")
        
    }
    
    func huboError(error: Error) {
        DispatchQueue.main.async {
            self.mensajeClima.text = "No hay resultados"
            self.mensajeHumedad.text = "Nivel de humedad"
            self.imagenClima.image = UIImage(systemName: "cloud")
            self.fondoClima.image = UIImage(named: "fondo")
        }
    }
    
    
}
