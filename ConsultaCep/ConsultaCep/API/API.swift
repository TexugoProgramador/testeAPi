//
//  API.swift
//  ConsultaCep
//
//  Created by humberto Lima on 17/03/20.
//  Copyright © 2020 humberto Lima. All rights reserved.
//

import UIKit

class API: NSObject {

    var enderecoUsuario = EnderecoModel()
    
    func consultaEnderecoCep(cepConsultar: String, onSuccess:@escaping(Bool) -> Void) {
        var request = URLRequest(url: URL(string: "https://viacep.com.br/ws/\(cepConsultar)/json/")!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        //print(request.url)
        //print(request.allHTTPHeaderFields)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) {jsonRet,response,error in
            DispatchQueue.main.async {
                let httpResponse = response as? HTTPURLResponse
                //print(httpResponse?.statusCode)
                if httpResponse?.statusCode == 200 || httpResponse?.statusCode == 201 {
                    do {
                        if let temp = try? JSONDecoder().decode(EnderecoModel.self, from: jsonRet!) {
                            self.enderecoUsuario = temp
                            onSuccess(true)
                        }else{ print("Erro Decode"); onSuccess(false) }
                    }
                }else{ print("Erro"); onSuccess(false) }
            }
        }
        dataTask.resume()
    }
}
