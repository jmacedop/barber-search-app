//
//  BarbershopResponse.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 14/12/22.
//

import Foundation

// MARK: - Barbershop
struct BarbershopResponse: Decodable {
    let id: Int
    let nombre: String
    let direccion: String
    let imagen: String
    let distrito: String
    let horario: String

    enum CodingKeys: String, CodingKey {
        case id
        case nombre
        case direccion
        case imagen
        case distrito = "distrito"
        case horario
    }
}

// MARK: - Booking
struct Booking: Codable {
    let id: Int
    let fecha, hora, local, corte: String
    let barbero: String
    let precio: Int
}

// MARK: - Cut
struct Cut: Codable {
    let id: Int
    let nombre, descripcion: String
    let precio, barbershopID: Int

    enum CodingKeys: String, CodingKey {
        case id, nombre, descripcion, precio
        case barbershopID = "barbershopId"
    }
}

// MARK: - District
struct DistritoResponse: Decodable {
    let id: Int
    let nombre: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nombre
    }
}

// MARK: - Employee
struct Employee: Codable {
    let id: Int
    let nombre: String
    let barbershopID: Int

    enum CodingKeys: String, CodingKey {
        case id, nombre
        case barbershopID = "barbershopId"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let nombre, email, password: String
    let bookingID: Int

    enum CodingKeys: String, CodingKey {
        case id, nombre, email, password
        case bookingID = "bookingId"
    }
}
