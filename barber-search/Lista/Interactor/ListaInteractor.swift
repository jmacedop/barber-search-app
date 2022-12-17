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
        self.api = BarbershopExternalAPI()
    }
    
    func datosBarberia() {
        api?.fetchBarbers(completion: { (barbershopResponse) in
            let myBarbers = BarbershopEntity.make(barbershopResponse!)
            self.presenter.mostrarListaBarberos(barberos: myBarbers)
        })
    }
    
    //este metodo posee los datos que yo necesito del distrito
    func datosDistritos() {
        print("aquí se envían los distritos")
        api?.fetchDistritos(completion: {(distritoResponse) in
            print(distritoResponse!)
            let myDistritos = DistritoEntity.make(distritoResponse!)
            self.presenter.mostrarListaDistritos(distritos: myDistritos)
            
        })
            
    }
    
    func datosBarberiByDistritos(_ distrito: String) {
        api?.fetchBarbers(completion: { (barbershopResponse) in
            if(distrito == "Todos los distritos"){
                let barberias = BarbershopEntity.make(barbershopResponse!)
                self.presenter.mostrarListaBarberiasByDistrito(barberias: barberias)
            }else{
                let filterBarberias = barbershopResponse!.filter{return $0.distrito == distrito}
                let myBarberiasFilter = BarbershopEntity.make(filterBarberias)
                //envio la informaciòn a mi presenter para que obtenga la informacioón filtrada
                //y luego se lo asigne a mi vista
                self.presenter.mostrarListaBarberiasByDistrito(barberias: myBarberiasFilter)
            }
        })
        
    }
}
