//
//  ListaRouter.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 15/12/22.
//

import Foundation
import UIKit


protocol ListaRouterProtocol{
    func hola()
    func mostrar(_ barber: BarbershopEntity)
}

class ListaRouter: ListaRouterProtocol{
    func mostrar(_ barber: BarbershopEntity) {
    }
    
    var view: UIViewController?
    var presenter: ListaPresenterProtocol?
    
    func hola() {
        
    }
}
