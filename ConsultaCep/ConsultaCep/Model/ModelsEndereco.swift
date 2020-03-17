//
//  ModelsEndereco.swift
//  ConsultaCep
//
//  Created by humberto Lima on 17/03/20.
//  Copyright © 2020 humberto Lima. All rights reserved.
//

import UIKit

struct EnderecoModel: Codable {
    var cep: String?
    var logradouro: String?
    var complemento: String?
    var bairro: String?
    var localidade: String?
    var uf: String?
    var unidade: String?
}
