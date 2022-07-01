//
//  ErrorHandler_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 18.06.2022.
//

import Foundation
import BabyNet


final class ErrorHandler_SP {
    func handle(error: Error) -> String {
        //        print(error) //log
        if let error = error as? BabyNetError {
            switch error {
            case .badRequest(let err):
                if let err = err as? URLError, (err.code == .notConnectedToInternet || err.code == .dataNotAllowed) {
                    return "Отсутствует интернет соединение, проверьте подключение и попробуйте еще раз"
                } else {
                    return "Неизвестная ошибка"
                }
            case .badResponse(let respCode):
                return "Ой, какая-то внешняя проблема, код ошибки \(respCode)"
            default:
                return "Внутренняя ошибка"
            }
            
        } else if let _ = error as? ActionError_SP {
            return "Внутренняя ошибка"
        } else {
            return "Неизвестная ошибка"
        }
    }
}
