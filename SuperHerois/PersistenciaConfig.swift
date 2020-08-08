//
//  PersistenciaConfig.swift
//  SuperHerois
//
//  Created by Matheus Souza on 05/08/2020.
//  Copyright © 2020 Matheus Souza. All rights reserved.
//

import UIKit

class PersistenciaConfig{
    
    let chaveConfig = "config"
    
    var config: [Bool] = [true,false]
    
    func adicionar(nome: Bool, grupo: Bool){
        excluir()
        config.append(nome)
        config.append(grupo)
        UserDefaults.standard.set(config, forKey: chaveConfig)
    }
    
    func listar() ->Array<Bool> {
        if let listaConfig = UserDefaults.standard.object(forKey: chaveConfig){
            return listaConfig as! Array
        }else{
            return []
        }
    }
    
    func excluir(){
        config = listar()
        config.removeAll()
        UserDefaults.standard.set(config, forKey: chaveConfig)
    }
    
}
