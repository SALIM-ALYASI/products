//
//  ViewController2.swift
//  products
//
//  Created by الياسي on 19/04/2022.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    var name:String?
    var musicdataas :Int?
    @IBOutlet weak var producttypeTextField: UITextField!
    var producttype:String?
    let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    open override func viewDidAppear(_ animated: Bool) {
        NSLog("viewDidAppear ")
       // musicdataas
        print("int:",musicdataas ?? 0)
    }
//    حفظ
    func createltem(name: String,producttype:String, product_name:String) {
        let products =  ProductsData(context: context)
        products.noun = name
        products.product_type = producttype
        products.product_name = product_name
      
        do {
            try context.save()
            dismiss(animated: true, completion: nil)
        }  catch {
            // error
        }}
    @IBAction func createltemdataButton(_ sender: UIButton) {
        
        name = nameTextField.text?.trimmingCharacters(in: .whitespaces)
        producttype = producttypeTextField.text?.trimmingCharacters(in: .whitespaces)
        
        if musicdataas == 0 {
            createltem(name: name ?? "",producttype: "الأساسي", product_name:producttype ?? "")
        }else{
            createltem(name: name ?? "",producttype: "احتياط", product_name:producttype ?? "")
        }
        
    }
    
   
}
