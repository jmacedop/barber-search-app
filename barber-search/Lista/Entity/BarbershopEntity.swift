//
//  BarbershopEntity.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 15/12/22.
//

import Foundation

struct BarbershopEntity{
    let id: Int
    let nombre: String
    let direccion: String
    let distrito: String
    let horario: String

    
    static func make(_ barbers: [BarbershopResponse]) -> [BarbershopEntity] {
        return barbers.map({ BarbershopEntity(id: $0.id, nombre: $0.nombre , direccion: $0.direccion, distrito: $0.distrito, horario: $0.horario) })
    }
    
}
