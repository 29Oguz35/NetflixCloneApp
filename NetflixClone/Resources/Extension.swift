//
//  Extension.swift
//  NetflixClone
//
//  Created by naruto kurama on 22.05.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
