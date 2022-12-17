//
//  DistritoEntity.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 15/12/22.
//

import Foundation

struct DistritoEntity{
    
    let id: Int
    let nombre: String
    
    static func make(_ distritos: [DistritoResponse]) -> [DistritoEntity] {
        return distritos.map({ DistritoEntity(id: $0.id, nombre: $0.nombre) })
    }
    
    
}
