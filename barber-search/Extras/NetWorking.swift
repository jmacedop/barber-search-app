//
//  NetWorking.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 15/12/22.
//

import Foundation
import Alamofire


protocol RemoteRepository {
    func fetchBarbers() -> [BarbershopResponse]
    func fetchDistritos() -> [DistritoResponse]
    
    func fetchBarberByDistrito() -> [BarbershopResponse]
}
//salida a APIS
//la implementación puede variar


class BarbershopMocksAPI: RemoteRepository {
    func fetchDistritos() -> [DistritoResponse] {
        let resource = "district_succes_01"
        
        //si encuentras el recurso lo guardas en la variable URL
        if let url = Bundle.main.url(forResource: resource, withExtension: "json"){
            
            //try retorna un tipo de error
            do{
                //si se obtiene el valor la variable se guarda en data
                let data = try Data(contentsOf: url)
                
                /// API REAL
                let decoder = JSONDecoder()
                let result = try decoder.decode([DistritoResponse].self, from: data)
                return result
            }catch let error {
                print(error)
                
            }
            
        }
           
        
        return []
    }
    

    
    func fetchBarbers() ->  [BarbershopResponse]{
        
        let resource = "barbershop_succes_01"
        
        //si encuentras el recurso lo guardas en la variable URL
        if let url = Bundle.main.url(forResource: resource, withExtension: "json"){
            
            //try retorna un tipo de error
            do{
                //si se obtiene el valor la variable se guarda en data
                let data = try Data(contentsOf: url)
                
                /// API REAL
                let decoder = JSONDecoder()
                let result = try decoder.decode([BarbershopResponse].self, from: data)
                return result
            }catch let error {
                print(error)
                
            }
            
        }
           
        
        return []
    }
    
    func fetchBarberByDistrito() ->  [BarbershopResponse]{
        []
    }
    
}

//los mismos métodos pueden tener diferente implementación
class BarbershopExternalAPI: RemoteRepository {
    func fetchDistritos() -> [DistritoResponse] {
        return []
    }
    
    
    func fetchBarbers() ->  [BarbershopResponse]{
        //let resource = "barbershop_succes_01"
        /*var barberResult = [BarbershopResponse]()
        //si encuentras el recurso lo guardas en la variable URL
        // Creamos una instancia de URLsession para realizar peticiones HTTP
        let session = URLSession.shared

        // Creamos la URL que apunta a la API que queremos consumir
        let url = URL(string: "http://localhost:3000/barbershops")!

        // Creamos una solicitud HTTP para obtener la información del usuario
        let request = URLRequest(url: url)

        // Creamos una tarea de red para realizar la solicitud HTTP en segundo plano
        let task = session.dataTask(with: request) { data, response, error in
            // Verificamos si se produjo un error
            if let error = error {
                // Mostramos un mensaje al usuario y salimos del bloque
                print("Error: \(error)")
                barberResult =  []
            }

            // Si no hubo error, procesamos los datos devueltos por la API
            if let data = data {
                // Intentamos decodificabarberResultr el JSON en un objeto User
                let decoder = JSONDecoder()
                do {
                    let dataBarbershop = try decoder.decode([BarbershopResponse].self, from: data)
                    // Si el JSON se decodificó correctamente, mostramos la información del usuario
                    //listaBarberias = dataBarbershop.barbershops!
                    barberResult = dataBarbershop
                } catch {
                    // Si hubo un error al decodificar el JSON, mostramos un mensaje de error
                    print("Error: \(error.localizedDescription)")
                }
            }
        }

        // Iniciamos la tarea de red para consumir la API
        task.resume()
        
        return barberResult*/
        return []
    }
    
    func fetchBarberByDistrito() ->  [BarbershopResponse]{
        []
    }
    
}
