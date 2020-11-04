//
//  NetworkManager.swift
//  Pokemon
//
//  Created by Aaron Fulwider on 10/31/20.
//

import Foundation
import UIKit

final class NetworkManager {
    static var shared = NetworkManager()
    let session: URLSession
    private init(session: URLSession = URLSession.shared){
        self.session = session
    }
}

extension NetworkManager {
    func fetchPokemonPage(_ url:String, completion: @escaping (PokePagination?) ->()) {
        guard let url = URL(string:url) else { completion(nil); return }
        session.dataTask(with: url) { data, response, error in
            if let _ = error { completion(nil); return }
            let decoder = JSONDecoder()
            do {
                let poke = try decoder.decode(PokePagination.self, from:data!)
                completion(poke)
            } catch let error {
                print("error: \(error.localizedDescription)")
            }
            return
        }.resume()
    }
    
    func fetchPokemon(_ url:String, completion: @escaping (Pokemon?) ->()) {
        guard let url = URL(string:url) else { completion(nil); return }
        session.dataTask(with: url) { data, response, error in
            if let _ = error { completion(nil); return }
            let decoder = JSONDecoder()
            do {
                let poke = try decoder.decode(Pokemon.self, from:data!)
                completion(poke)
            } catch let error {
                print("error: \(error.localizedDescription)")
            }
            return
        }.resume()
    }
}

extension NetworkManager {
    func GetData(_ url:URL, _ data:Data) -> Pokemon? {
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            return try JSONDecoder().decode(Pokemon.self, from: data)
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func GetURL() ->String {
        let myString = ""
        return myString
    }
}
