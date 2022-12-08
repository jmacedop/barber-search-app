//
//  BarberShopManager.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 5/12/22.
//

import Foundation

protocol BarberShopManagerDelegate{
    func listBarbeShop(DidlistBarberShop listBarberShop: [BarberShopModel])
    func listBarbeShopByDistrito(DidlistBarberShop listBarberShop: [BarberShopModel])
    func listDistritos(DidDsitritos distrito:  [String])
   // func listBarbeShopByName(DidlistBarberShop listBarberShop: [BarberShopModel])
}

struct BarberShopManager {
    
    var delegate: BarberShopManagerDelegate?
    var filterBarberShopByDistrito: [BarberShopModel] = []
    //var filterBarberShopByName: [BarberShopModel] = []
    
    let barberShopList: [BarberShopModel] =
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
     BarberShopModel(nombre: "LA TOP DE LIMA BARBER", direccion: "Av. El Alamo", distrito: "San Martin de Porres", horario: "09: 00 AM - 10:00 PM", imageView: "image")]
    
    let distritos = ["Todos los distritos","Ancón","Ate","Barranco","Breña","Carabayllo","Cercado de Lima","Chaclacayo","Chorrillos","Cieneguilla","Comas","El Agustino","Independencia","Jesús maría","La molina","La victoria","Lince",
                     "Los Olivos","Lurigancho","Lurín","Magdalena del Mar","Miraflores","Pachacámac","Pucusana","Pueblo Libre","Puente Piedra","Punta Hermosa","Punta Negra","Rímac",
"San bartolo"]
    
    let cortesList:[CorteModel] = [CorteModel(nombre: "Fade", descripcion: "Rapado arriba", precio: 15.00),CorteModel(nombre: "Roble", descripcion: "Rapado arriba", precio: 10.00),
CorteModel(nombre: "Militar", descripcion: "Rapado arriba", precio: 30.00)]
    
    func listBarberShop(){
        delegate?.listBarbeShop(DidlistBarberShop: barberShopList+barberShopList+barberShopList+barberShopList)
    }
    
    func listBarberShopByDItrito(distrito: String){
        
        let filterBarberShopByDistrito = barberShopList.filter { return $0.distrito == distrito
        }
        delegate?.listBarbeShopByDistrito(DidlistBarberShop: filterBarberShopByDistrito)
    }
    
    func listDistritos(){
        delegate?.listDistritos(DidDsitritos: distritos)
        
    }
   
}
