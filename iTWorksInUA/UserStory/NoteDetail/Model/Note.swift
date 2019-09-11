//
//  Note.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation

struct Note {
    struct keys {
        static let title = "title"
        static let body = "body"
    }
    
    var id: String
    var title: String?
    var body: String?
    
    init(_ dict: [String: Any], id: String) {
        self.id = id
        self.title = dict[keys.title] as? String
        self.body = dict[keys.body] as? String
    }
}
