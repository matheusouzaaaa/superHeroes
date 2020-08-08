//
//  ViewController.swift
//  SuperHerois
//
//  Created by Matheus Souza on 05/08/2020.
//  Copyright © 2020 Matheus Souza. All rights reserved.
//

import UIKit
import CoreData

class FormularioViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtGrupo: UITextField!
    
    var context: NSManagedObjectContext!
    var heroi: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func limpar(_ sender: Any) {
        txtNome.text = ""
        txtGrupo.text = ""
    }
    
    @IBAction func salvar(_ sender: Any) {
        adicionar()
    }
    
    func adicionar(){
        if let nome = txtNome.text, let grupo = txtGrupo.text {
            if nome != "", grupo != "" {
                let novoHeroi = NSEntityDescription.insertNewObject(forEntityName: "Herois", into: context)
                novoHeroi.setValue(nome, forKey: "nome")
                novoHeroi.setValue(grupo, forKey: "grupo")
                do{
                    try context.save()
                    txtNome.text = ""
                    txtGrupo.text = ""
                }catch let erro as NSError{
                    print("Erro ao adicionar \(erro)")
                }
            }
         }
    }
    
}

