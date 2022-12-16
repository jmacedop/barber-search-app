//
//  BarberShopManager.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 5/12/22.
//

import Foundation
import Alamofire

protocol BarberShopManagerDelegate{
    func listBarbeShop(DidlistBarberShop listBarberShop: [BarberShopModel])
    //func listBarbeShopByDistrito(DidlistBarberShop listBarberShop: [Barbershop])
    //func listDistritos(DidDsitritos distrito:  [District])
   // func listBarbeShopByName(DidlistBarberShop listBarberShop: [BarberShopModel])
}

struct BarberShopManager {
    
    var listaBarberias = [BarberShopModel]()
    var delegate: BarberShopManagerDelegate?
    var filterBarberShopByDistrito: [BarberShopModel] = []
    //var filterBarberShopByName: [BarberShopModel] = []
    
    /* let barberShopList: [BarberShopModel] =
     [BarberShopModel(nombre: "MONTALVO FOR MEN", direccion: "Av. Las Flores", distrito: "San Martin de Porres", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "BARBERIA FINA", direccion: "Av. Las Casas", distrito: "Los Olivos", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "BARBERIA REYES", direccion: "Av. Las Ortencias", distrito: "Rímac", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "BARBERUA 85", direccion: "Av. Los Girasoles", distrito: "Lima Cercado", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "BARBERIA LA 90", direccion: "Av. Los Huracanes", distrito: "San Juan de Miraflores", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "EL AMPA", direccion: "Av. Perú", distrito: "San Martin de Porres", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "CORTE DE 10", direccion: "Av. Los Pinos", distrito: "San Juan de Miraflores", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "DE LUNA", direccion: "Av. Emancipación", distrito: "Rímac", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "CORTE LUCAS", direccion: "Av. El Derby", distrito: "Los Olivos", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "CORTE DODORIA", direccion: "Av. las Juntas", distrito: "Rímac", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "PREMIUM BARBER", direccion: "Av. Nuevo Horiente", distrito: "Los Olivos", horario: "09: 00 AM - 10:00 PM", imageView: "image"),
     BarberShopModel(nombre: "LA TOP DE LIMA BARBER", direccion: "Av. El Alamo", distrito: "San Martin de Porres", horario: "09: 00 AM - 10:00 PM", imageView: "image")] */
    
    /*let distritos = ["Todos los distritos","Ancón","Ate","Barranco","Breña","Carabayllo","Cercado de Lima","Chaclacayo","Chorrillos","Cieneguilla","Comas","El Agustino","Independencia","Jesús maría","La molina","La victoria","Lince",
     "Los Olivos","Lurigancho","Lurín","Magdalena del Mar","Miraflores","Pachacámac","Pucusana","Pueblo Libre","Puente Piedra","Punta Hermosa","Punta Negra","Rímac",
     "San bartolo"]*/
    
    /*let cortesList:[CorteModel] = [CorteModel(nombre: "Fade", descripcion: "Rapado arriba", precio: 15.00),CorteModel(nombre: "Roble", descripcion: "Rapado arriba", precio: 10.00),
     CorteModel(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00)]*/
    
    /*func listBarberShop(){
        
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
                return
            }

            // Si no hubo error, procesamos los datos devueltos por la API
            if let data = data {
                // Intentamos decodificar el JSON en un objeto User
                let decoder = JSONDecoder()
                do {
                    let dataBarbershop = try decoder.decode(BarbershopResponse.self, from: data)
                    // Si el JSON se decodificó correctamente, mostramos la información del usuario
                    //listaBarberias = dataBarbershop.barbershops!
                    delegate?.listBarbeShop(DidlistBarberShop: dataBarbershop.barbershops!)
                } catch {
                    // Si hubo un error al decodificar el JSON, mostramos un mensaje de error
                    print("Error: \(error.localizedDescription)")
                }
            }
        }

        // Iniciamos la tarea de red para consumir la API
        task.resume()
    }*/
    
    func listBarberShopByDItrito(distrito: String){
        
        /*let filterBarberShopByDistrito = barberShopList.filter { return $0.distrito == distrito
         }
         delegate?.listBarbeShopByDistrito(DidlistBarberShop: filterBarberShopByDistrito)*/
    }
    
    func listDistritos(){
        /*AF.request("http://localhost:3000/districts").responseDecodable(of: BarbershopResponse.self)
         {(respuesta) in
         
         delegate?.listDistritos(DidDsitritos: respuesta.value?.districts ?? [])*/
        
    }
    
    // delegate?.listDistritos(DidDsitritos: distritos)
}
    
