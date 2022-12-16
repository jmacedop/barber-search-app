//
//  ViewController.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 28/11/22.
//

import UIKit
import Alamofire

protocol ListaHomeViewControllerProtocol {
    //variable que mostrará los datos de los barberos
    func datosBarbero(_ barber:  [BarbershopEntity])
    func datosDistrito(_ distrito: [DistritoEntity])
    func datosBarberiaByDistrito(_ barberia:[BarbershopEntity])
}

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak private var buttonListDistritos: UIButton!
   
    @IBOutlet weak private var searchBar: UISearchBar!
    
    @IBOutlet weak private var tableView: UITableView!
    
    @IBAction func verTodosButton(_ sender: UIButton) {
       // barberShopManager.listBarberShop()
        
    }
    
    private var barberosList = [BarbershopEntity]()
    private var distritotsList = [DistritoEntity]()
    
    //llamo a mi presenter
    var presenter: ListaPresenterProtocol?
    
    //var barberShopManager = BarberShopManager()
    //var listBarberShoModelList: [BarberShopModel] = []
    var filterNameBarber: [BarbershopEntity] = []
    //var listDistritosHome: [District] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        initView()
    }
    
    private func initView(){
        configureTableView()
    }

    private func configureTableView(){
        tableView?.register(UINib(nibName: "BarberCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "BarberCustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.getBarberos()
        presenter?.getDistritos()
        setPopupButtonDroplistDistritos()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return barberosList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BarberCustomTableViewCell", for: indexPath) as?  BarberCustomTableViewCell {
                       cell.setup(barber: barberosList[indexPath.row])
                //cell.nombreLabel.text = barberosList[indexPath.row]
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
 
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let barberShop = barberosList[indexPath.row]
       
       performSegue(withIdentifier: "DetailsViewController", sender: barberShop)
    }
    
    
    
}

extension HomeController: ListaHomeViewControllerProtocol{
    func datosBarberiaByDistrito(_ barberia: [BarbershopEntity]) {
        barberosList = barberia
        tableView.reloadData()
    }
    
    func datosDistrito(_ distrito: [DistritoEntity]) {
        distritotsList = distrito
        print(distritotsList)
    }
    
    func datosBarbero(_ barber: [BarbershopEntity]) {
        barberosList = barber
        print(barberosList)
    }
    
    
}

extension HomeController{
    
    func setPopupButtonDroplistDistritos(){
      let optionClosure = {(action: UIAction) in
          print(action.title)
          self.presenter?.getBarberiasByDistritos(action.title)
        }
        var optionsArray = [UIAction]()
        
        for data in distritotsList{
            let action = UIAction(title:(data.nombre), state: .off, handler: optionClosure)
            optionsArray.append(action)
        }
        optionsArray[0].state = .on
        let optionsMenu = UIMenu(title: "", options: .displayInline, children: optionsArray)
        
        buttonListDistritos.menu = optionsMenu
        buttonListDistritos.changesSelectionAsPrimaryAction = true
        buttonListDistritos.showsMenuAsPrimaryAction = true
        
    }
}

extension HomeController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterNameBarber = []
        if searchText == "" {
            presenter?.getBarberos()
        }else {
            for data in barberosList{
                if(data.nombre.uppercased().contains(searchText.uppercased())){
                    filterNameBarber.append(data)
                    barberosList = filterNameBarber
                }
            }
        }
        tableView.reloadData()
    }
}

extension HomeController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "DetailsViewController"{
            if let vcDestinoDetails = segue.destination as? DetailsViewController {
                if let barberShop = sender as? BarbershopEntity {
                    vcDestinoDetails.barberShopDetail = barberShop
                }
            }
        }
    }
}

