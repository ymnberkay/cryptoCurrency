//
//  CryptoViewModel.swift
//  PazaramaBootacamp2.2
//
//  Created by Berkay Yaman on 21.10.2023.
//

import Foundation
import RxCocoa
import RxSwift

class CryptoViewModel {
    
    let cryptos: PublishSubject<[Crypto]> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()
    let loading: PublishSubject<Bool> = PublishSubject()
    
    func requestData() {
        self.loading.onNext(true)
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrencies(url: url) { result in
            self.loading.onNext(false)
            switch result {
            case .success(let cryptos):
                self.cryptos.onNext(cryptos)
            case.failure(let error):
                switch error {
                case.urlError:
                    self.error.onNext("url Error")
                case.serverError:
                    self.error.onNext("server error")
                case.decodingError:
                    self.error.onNext("decoding error")
                    
                }
            }
        }
    }
}
