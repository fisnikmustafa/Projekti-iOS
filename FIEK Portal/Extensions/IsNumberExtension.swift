//
//  IsNumberExtension.swift
//  FIEK Portal
//
//  Created by Fisnik on 01/10/2022.
//

import Foundation

extension String {
    var isNumber: Bool {
        return self.allSatisfy { character in
            character.isWholeNumber

        }
    }
}
