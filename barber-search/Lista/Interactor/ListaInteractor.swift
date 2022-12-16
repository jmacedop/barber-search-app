//
//  ListaInteractor.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 15/12/22.
//

import Foundation

protocol ListaInteractorProtocol {
    func datosBarberia()
    func datosDistritos()
    func datosBarberiByDistritos(_ distritos: String)
}

class ListaInteractor: ListaInteractorProtocol{
    
 
    //declaro la variable para que mi presenter tega acceso
    var presenter: ListaPresenterProtocol
    //de aquí obtendré los datos
    var api: RemoteRepository?
    
    init(presenter: ListaPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    
    
    func datosBarberia() {
        print("hola desde interactor")
        if let barbers = api?.fetchBarbers() {
            let myBarbers = BarbershopEntity.make(barbers)
            presenter.mostrarListaBarberos(barberos: myBarbers)
        }
    }
    
    //este metodo posee los datos que yo necesito del distrito
    func datosDistritos() {
        print("aquí se envían los distritos")
        if let distritos = api?.fetchDistritos(){
            let myDistritos = DistritoEntity.make(distritos)
            presenter.mostrarListaDistritos(distritos: myDistritos)
        }
    }
    
    func datosBarberiByDistritos(_ distrito: String) {
        if let barberiasByDistrito = api?.fetchBarbers(){
            if(distrito == "Todos los distritos"){
                let barberias = BarbershopEntity.make(barberiasByDistrito)
                presenter.mostrarListaBarberiasByDistrito(barberias: barberias)
            }else{
                let filterBarberias = barberiasByDistrito.filter{return $0.distrito == distrito}
                let myBarberiasFilter = BarbershopEntity.make(filterBarberias)
                //envio la informaciòn a mi presenter para que obtenga la informacioón filtrada
                //y luego se lo asigne a mi vista
                presenter.mostrarListaBarberiasByDistrito(barberias: myBarberiasFilter)
            }
        }
        
    }
    
    
}
    
