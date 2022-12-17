//
//  ConfigurationListHome.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 15/12/22.
//

import UIKit

class ConfigurationListHome {
    
    static func makeLista() -> UIViewController {
        //CONTIENEN A TODOS
        let presenter = ListaPresenter()
        
        let api = BarbershopMocksAPI()
        let interactor = ListaInteractor(presenter: presenter, api: api )
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        
        let router = ListaRouter(presenter: presenter)
        router.view = view
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        view.presenter = presenter
        
        return view
    }
}
