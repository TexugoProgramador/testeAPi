//
//  ViewController.swift
//  ConsultaCep
//
//  Created by humberto Lima on 17/03/20.
//  Copyright © 2020 humberto Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var campoBusca: UITextField!
    @IBOutlet var endereco: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func alerta(title: String, mensagem:String){
        let alert = UIAlertController(title: title, message: mensagem, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buscaCep(_ sender: UITextField) {
        
        if (sender.text?.count ?? 0) == 8 {
            apiUsar.consultaEnderecoCep(cepConsultar: (sender.text ?? "")) { (ret) in
                if ret {
                    self.geraEndereco()
                }else{
                    self.alerta(title: "Aviso", mensagem: "OCorreu um erro ao eocntrar o endereço")
                }
            }
        }
    }
    
    func geraEndereco()  {
        self.endereco.text = "\(apiUsar.enderecoUsuario.bairro ?? "") - \(apiUsar.enderecoUsuario.logradouro ?? "")"
    }
    
}

