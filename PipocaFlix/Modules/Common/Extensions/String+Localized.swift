//
//  String+Localized.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 27/10/22.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
