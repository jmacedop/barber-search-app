//
//  ListaPresenter.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 15/12/22.
//

import Foundation

protocol ListaPresenterProtocol{
    func mostrarListaBarberos(barberos: [BarbershopEntity])
    func mostrarListaDistritos(distritos: [DistritoEntity])
    func mostrarListaBarberiasByDistrito(barberias:  [BarbershopEntity])
    
   
    //error view router
    //func presentErrorView()
    
    //cosas que el router pide al-> presenter
    
    //cosas que el presenter pide al interactor
    func getBarberos()
    func getDistritos()
    func getBarberiasByDistritos(_ distritos: String)
    
}

class ListaPresenter: ListaPresenterProtocol{
    
    func mostrarListaDistritos(distritos: [DistritoEntity]) {
        view?.datosDistrito(distritos)
    }
    
    func mostrarListaBarberos(barberos: [BarbershopEntity]) {
        view?.datosBarbero(barberos)
    }
    func mostrarListaBarberiasByDistrito(barberias: [BarbershopEntity]) {
        view?.datosBarberiaByDistrito(barberias)
    }
    
    //invoco a las interfaces con las que tengo comunicación
    var view: ListaHomeViewControllerProtocol?
    var interactor: ListaInteractorProtocol?
    var router: ListaRouterProtocol?
    
    //es el metodo que debo inicializar para que carguen los datos
    //este metodo devuelve el array filtrado de distritos
    func getBarberiasByDistritos(_ distritos: String) {
        interactor?.datosBarberiByDistritos(distritos)
    }
    
    func getBarberos(){
        interactor?.datosBarberia()
    }
    func getDistritos(){
        interactor?.datosDistritos()
    }
    
    func getData() {
        print("Hola soy el presenter")
    }
    
}
