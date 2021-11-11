//
//  URL.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 09/11/2021.
//

import Foundation
extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
