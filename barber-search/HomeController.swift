//
//  ViewController.swift
//  barber-search
//
//  Created by Jimmy Ronaldo Macedo Pizango on 28/11/22.
//

import UIKit

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak private var buttonListDistritos: UIButton!
   
    @IBOutlet weak private var searchBar: UISearchBar!
    
    @IBOutlet weak private var tableView: UITableView!
    
    @IBAction func verTodosButton(_ sender: UIButton) {
        barberShopManager.listBarberShop()
        
    }
    
    
    var barberShopManager = BarberShopManager()
    var listBarberShoModelList: [BarberShopModel] = []
    var filterNameBarber: [BarberShopModel] = []
    var listDistritosHome: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        // Do any additional setup after loading the view.
    }
    
    private func initView(){
        configureTableView()
    }

    private func configureTableView(){
        tableView.register(UINib(nibName: "BarberCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "BarberCustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        barberShopManager.delegate = self
        searchBar.delegate = self
        
        barberShopManager.listDistritos()
        barberShopManager.listBarberShop()
        setPopupButtonDroplistDistritos()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBarberShoModelList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BarberCustomTableViewCell", for: indexPath) as?  BarberCustomTableViewCell {
                       cell.setup(barber: listBarberShoModelList[indexPath.row])
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
 
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let barberShop = listBarberShoModelList[indexPath.row]
       
       performSegue(withIdentifier: "DetailsViewController", sender: barberShop)
    }
    
    
    
}

extension HomeController: BarberShopManagerDelegate{
    func listDistritos(DidDsitritos distrito: [String]) {
        listDistritosHome = distrito
    }
    
    func listBarbeShopByDistrito(DidlistBarberShop listBarberShop: [BarberShopModel]) {
        listBarberShoModelList = listBarberShop
        tableView.reloadData()
    }
    
    func listBarbeShop(DidlistBarberShop listBarberShop: [BarberShopModel]) {
        listBarberShoModelList = listBarberShop
        tableView.reloadData()
    }
    
}
    
extension HomeController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterNameBarber = []
        if searchText == "" {
            barberShopManager.listBarberShop()
        }else {
            for data in listBarberShoModelList{
                if(data.nombre.uppercased().contains(searchText.uppercased())){
                    filterNameBarber.append(data)
                    listBarberShoModelList = filterNameBarber
                    
                }
            }
        }
        tableView.reloadData()
    }
}

extension HomeController {
    
    func setPopupButtonDroplistDistritos(){
        
        let optionClosure = {(action: UIAction) in
            print(action.title)
            self.barberShopManager.listBarberShopByDItrito(distrito: action.title)
                        if(action.title == "Todos los distritos"){
                            self.barberShopManager.listBarberShop()
                        }
        }
        var optionsArray = [UIAction]()
        
        for data in listDistritosHome{
            let action = UIAction(title:(data), state: .off, handler: optionClosure)
            optionsArray.append(action)
        }
        optionsArray[0].state = .on
        let optionsMenu = UIMenu(title: "", options: .displayInline, children: optionsArray)
        
        buttonListDistritos.menu = optionsMenu
        buttonListDistritos.changesSelectionAsPrimaryAction = true
        buttonListDistritos.showsMenuAsPrimaryAction = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "DetailsViewController"{
            if let vcDestinoDetails = segue.destination as? DetailsViewController {
                if let barberShop = sender as? BarberShopModel {
                    vcDestinoDetails.barberShopDetail = barberShop
                }
            }
        }
    }
}

