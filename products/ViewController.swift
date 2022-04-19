//
//  ViewController.swift
//  products
//
//  Created by الياسي on 19/04/2022.
//
 
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var favorites = [Int]()
    let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var musicdata = [ProductsData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllItems()
        
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    open override func viewDidAppear(_ animated: Bool) {
        NSLog("viewDidAppear ")
         getAllItems()
    }
//    نقل
    @IBAction func vbvb(_ sender: Any) {
    
        
           let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        vc.musicdataas =   musicdata.count
           self.navigationController?.pushViewController(vc, animated: true)
    }
    //تعديل
    func createltem(_ productsData: ProductsData,producttype:String) {
        productsData.product_type = producttype
      
        do {
            try context.save()
            getAllItems()
        }  catch {
            // error
        }}
    //عرض
    func getAllItems() {
        
        print(musicdata.count)
    do {
        musicdata = try context.fetch (ProductsData.fetchRequest())
        DispatchQueue.main.async {
            self.tableView.reloadData()
           
        }
    } catch {
    // error
    }
    }
    
    //حدف
    func delete(_ songsMusic:ProductsData) {
        context.delete(songsMusic)
    do {
        try context.save()
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.getAllItems()
        }
    } catch {
    // error
    }
    }
    //حدف 
}

extension ViewController:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicdata.count

    }
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
       cell.productsdata(musicdata[indexPath.row] )
        if musicdata.count == 1{
                     print(indexPath.row)
                     createltem( musicdata[indexPath.row],producttype: "الأساسي")
                 }
        return cell
        
        }
       
  
 
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
  
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            self.delete(self.musicdata[indexPath.row])
            musicdata.remove(at: indexPath.row)
            print(indexPath.row)
            
   // createltem(_ productsData: ProductsData,producttype:String)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
//            if musicdata[indexPath.row].product_type == "احتياط"{
//                print(indexPath.row)
//                createltem( musicdata[0],producttype: "الأساسي")
//            }
        }
    }
}
