//
//  SuperHeroisTableViewController.swift
//  SuperHerois
//
//  Created by Matheus Souza on 05/08/2020.
//  Copyright © 2020 Matheus Souza. All rights reserved.
//

import UIKit
import CoreData

class SuperHeroisTableViewController: UITableViewController {
    
    var herois: [NSManagedObject] = []
    var context: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        listarHerois()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.herois.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaHeroi", for: indexPath)

        // Configure the cell...
        let heroi = self.herois[indexPath.row]
        let stringNome = heroi.value(forKey: "nome") as? String
        let stringGrupo = heroi.value(forKey: "grupo") as? String
        cell.textLabel?.text =  stringNome! + " - " + stringGrupo!
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func listarHerois(){
        let requestHerois = NSFetchRequest<NSFetchRequestResult>(entityName: "Herois")
    
        let persistencia = PersistenciaConfig()
        let opcoes = persistencia.listar()
        
        let config1 = opcoes.first?.hashValue ?? 1
        var ordenacao = NSSortDescriptor()
        
        if config1 == 1 {
           ordenacao = NSSortDescriptor(key: "nome", ascending: true)
        }else{
           ordenacao = NSSortDescriptor(key: "grupo", ascending: true)
        }
        
        requestHerois.sortDescriptors = [ordenacao]
        
        do{
            let heroisRecuperados = try context.fetch(requestHerois)
            self.herois = heroisRecuperados as! [NSManagedObject]
            self.tableView.reloadData()
        }catch let erro as NSError{
            print("Erro ao listar \(erro)")
        }
    }

}
