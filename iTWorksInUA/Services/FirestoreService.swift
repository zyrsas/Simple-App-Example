//
//  FirestoreService.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import FirebaseFirestore

protocol FirestoreServiceProtocol: class {
    func createNote(withTitle title: String, body: String,  completionHandler: @escaping (String?) -> Void)
    func addNotesListener(completionHandler: @escaping ([Note]?, String?) -> Void)
}

struct FirestoreKey {
    static let root = "Notes"
}

class FirestoreService: FirestoreServiceProtocol {
    
    public static let shared = FirestoreService()
    
    private let db = Firestore.firestore()
    
    private init() { }
    
    func createNote(withTitle title: String, body: String, completionHandler: @escaping (String?) -> Void) {
        db.collection(FirestoreKey.root)
            .addDocument(data: [Note.keys.title: title,
                                Note.keys.body: body]) { error in
                                    completionHandler(error?.localizedDescription)
        }
    }
    
    func addNotesListener(completionHandler: @escaping ([Note]?, String?) -> Void) {
        db.collection(FirestoreKey.root)
            .addSnapshotListener { (querySnapshot, error) in
                if error == nil {
                    let notes = querySnapshot!.documents.map { Note($0.data(), id: $0.documentID) }
                    completionHandler(notes, nil)
                } else {
                    completionHandler(nil, error?.localizedDescription)
                }
        }
    }
}
