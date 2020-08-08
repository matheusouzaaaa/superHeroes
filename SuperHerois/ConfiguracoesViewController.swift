//
//  ConfiguracoesViewController.swift
//  SuperHerois
//
//  Created by Matheus Souza on 05/08/2020.
//  Copyright © 2020 Matheus Souza. All rights reserved.
//

import UIKit

class ConfiguracoesViewController: UIViewController {

    @IBOutlet weak var listarGrupo: UISwitch!
    @IBOutlet weak var listarNome: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let persistencia = PersistenciaConfig()
        let opcoes = persistencia.listar()
        
        let config1 = opcoes.first?.hashValue ?? 1
        
        if config1 == 1 {
            listarNome.setOn(true, animated: true)
            listarGrupo.setOn(false, animated: true)
        }else{
            listarNome.setOn(false, animated: true)
            listarGrupo.setOn(true, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnNomeClick(_ sender: UISwitch) {
        if sender.isOn{
            listarGrupo.setOn(false, animated: true)
        }
    }
    @IBAction func btnGrupoClick(_ sender: UISwitch) {
        if sender.isOn{
            listarNome.setOn(false, animated: true)
        }
    }
    
    @IBAction func limpar(_ sender: Any) {
        listarNome.setOn(false, animated: true)
        listarGrupo.setOn(false, animated: true)
    }
    @IBAction func salvar(_ sender: Any) {
        let listaNome: Bool = listarNome.isOn
        let listaGrupo: Bool = listarGrupo.isOn
        
        let persistencia = PersistenciaConfig()
        persistencia.adicionar(nome: listaNome, grupo: listaGrupo)
    }
    
}
