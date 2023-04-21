//
//  GenericService.swift
//  appNFT
//
//  Created by ALYSSON DODO on 20/04/23.
//

import Foundation
import Alamofire

enum Error: Swift.Error {
    case fileNoFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case erroRequest(AFError) //  Retorno do Alamofire (de erro)
}

enum TypeFetch {
    case mock
    case request
}

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
