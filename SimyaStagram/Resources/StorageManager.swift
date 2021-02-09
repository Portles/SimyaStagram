//
//  StorageManager.swift
//  SimyaStagram
//
//  Created by Nizamet Özkan on 3.02.2021.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageError: Error {
        case failedDownload
    }
    
    public func uploadUserPhotoPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(with referance: String, completion: @escaping (Result<URL, IGStorageError>) -> Void) {
        bucket.child(referance).downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                completion(.failure(IGStorageError.failedDownload))
                return
            }
            completion(.success(url))
        })
    }
}
