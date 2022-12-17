//
//  ListaRouter.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 15/12/22.
//

import Foundation
import UIKit


protocol ListaRouterProtocol{
    func mostrar(_ barber: [BarbershopEntity])
}

class ListaRouter: ListaRouterProtocol{
  
let presenter: ListaPresenterProtocol?
    

    func mostrar(_ barber: [BarbershopEntity]) {
        
    }
    
    weak var view: UIViewController?
    
    required init(presenter: ListaPresenterProtocol) {
        self.presenter = presenter
    }
}
