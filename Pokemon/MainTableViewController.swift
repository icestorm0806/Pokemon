//
//  MainTableViewController.swift
//  Pokemon
//
//  Created by Aaron Fulwider on 10/30/20.
//

import UIKit

class MainTableViewController: UITableViewController {
    var pokemon = [Pokemon?]()
    let baseURL = "https://pokeapi.co/api/v2/pokemon/?limit=150"
    var currentPageArray = [NameURL?]() {
        didSet {
            //            var count = 0
            for i in currentPageArray {
                NetworkManager.shared.fetchPokemon((i?.url!)!) { [self] (data) in
                    pokemon.append(data!)
                    DispatchQueue.main.async(execute: {
                        self.tableView.reloadData()
                    })
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadNext()
    }
    
    func loadNext() {
        NetworkManager.shared.fetchPokemonPage(baseURL) { [self] (data) in
            currentPageArray = data!.results
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        let row = indexPath.row// + (30*pageNumber)
        print("row: \(row)")
        let imageURL = URL(string: (pokemon[row]!.sprites?.front_default)!)
        let imageData = try? Data(contentsOf: imageURL!)
        print("pokemon[row]!.types![0].type?.url: \(pokemon[row]!.types![0].type?.url)")
        cell.pokemonSpriteImageView.image = UIImage(named: "PokemonImage")
        DispatchQueue.main.async {
            cell.pokemonSpriteImageView.image = UIImage(data: imageData!)
        }
        cell.nameLabel.text = pokemon[row]!.name!// + ": " + String(row)
        cell.typeLabel.text = pokemon[row]!.types![0].type?.name
        cell.backgroundColor = .yellow
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.pokemon = pokemon[indexPath.row]!
        _ = navigationController?.pushViewController(vc, animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func loadPokemon(forItemAtIndex index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        if self.tableView.indexPathsForVisibleRows?.contains(indexPath) ?? false {
            self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        }
    }
}

extension MainTableViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        print("prefetchRowsAt \(indexPaths)")
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancelPrefetchingForRowsAt \(indexPaths)")
    }
}
