//
//  extension+Array.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 2/6/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

extension Array {
    mutating func remove(at indexes: [Int]) {
        for index in indexes.sorted(by: >) {
            remove(at: index)
        }
    }
}
