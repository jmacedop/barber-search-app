//
//  NetWorking.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 15/12/22.
//

import Foundation
import Alamofire


protocol RemoteRepository {
    
    func fetchBarbers(completion: @escaping ([BarbershopResponse]?) -> Void)
    func fetchDistritos(completion: @escaping ([DistritoResponse]?) -> Void)
    //func fetchbBarbershopByDistritos(completion: @escaping ([DistritoResponse]?) -> Void)
}
//salida a APIS
//la implementación puede variar


class BarbershopExternalAPI: RemoteRepository {
    
    func fetchDistritos(completion: @escaping ([DistritoResponse]?) -> Void) {
        let urlString = "http://localhost:3000/districts"
                AF.request(urlString).response { response in
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let distritosRequest = try decoder.decode([DistritoResponse].self, from: data)
                        completion(distritosRequest)
                        print("hola carajo")
                    } catch let error {
                        print(error)
                        completion(nil)
                    }
                }
    }
    
    

    func fetchBarbers(completion: @escaping ([BarbershopResponse]?) -> Void) {
        
        let urlString = "http://localhost:3000/barbershops"
                AF.request(urlString).response { response in
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let barbershopRequest = try decoder.decode([BarbershopResponse].self, from: data)
                        completion(barbershopRequest)
                    } catch let error {
                        print(error)
                        completion(nil)
                    }
                }
        }
    
    
}

//los mismos métodos pueden tener diferente implementación
class BarbershopMocksAPI: RemoteRepository{
    
    func fetchBarbers(completion: @escaping ([BarbershopResponse]?) -> Void) {
        
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
                completion(result)
            }catch let error {
                print(error)
                
            }
            
        }
    }
    
    func fetchDistritos(completion: @escaping ([DistritoResponse]?) -> Void) {
        
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
                print("hola papi", result)
                completion(result)
            }catch let error {
                print(error)
                
            }
            
        }
    }
    
}


