//
//  GenericService.swift
//  appNFT
//
//  Created by ALYSSON DODO on 20/04/23.
//

import Foundation
import Alamofire

enum Error: Swift.Error {
    case fileNoFound(name: String, Swift.Error)
    case fileDecodingFailed(name: String, Swift.Error)
    case erroRequest(AFError) //  Retorno do Alamofire (de erro)
}


protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
