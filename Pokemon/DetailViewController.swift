//
//  DetailViewController.swift
//  Pokemon
//
//  Created by Aaron Fulwider on 10/30/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    let sprite = UIImage()
    let pokemonName = UILabel()
    
    let pokemonSpriteImageView = UIImageView()
    let nameLabel = UILabel()
    let typeLabel = UILabel()
    let movesLabel = UILabel()
    let abilitiesLabel = UILabel()
    
    var pokemon = Pokemon() {
        didSet {
            view.backgroundColor = .white
            setupUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupUI() {
        view.addSubview(pokemonSpriteImageView)
        view.addSubview(nameLabel)
        view.addSubview(typeLabel)
        view.addSubview(movesLabel)
        view.addSubview(abilitiesLabel)
        
        pokemonSpriteImageView.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints  = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        movesLabel.translatesAutoresizingMaskIntoConstraints = false
        abilitiesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        pokemonSpriteImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
        pokemonSpriteImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        pokemonSpriteImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
        pokemonSpriteImageView.heightAnchor.constraint(equalToConstant: view.frame.width - 4).isActive = true
        pokemonSpriteImageView.contentMode = .scaleToFill
        pokemonSpriteImageView.clipsToBounds = true

        let imageURL = URL(string: (pokemon.sprites?.front_default)!)
        let imageData = try? Data(contentsOf: imageURL!)
        pokemonSpriteImageView.image = UIImage(named: "PokemonImage")
        DispatchQueue.main.async { [self] in
            pokemonSpriteImageView.image = UIImage(data: imageData!)
        }
        
        nameLabel.topAnchor.constraint(equalTo: pokemonSpriteImageView.bottomAnchor, constant: 4).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.text = pokemon.name
        nameLabel.textColor = .red
        nameLabel.backgroundColor = .cyan
        
        typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
        typeLabel.textAlignment = .center
        typeLabel.adjustsFontSizeToFitWidth = true
        typeLabel.text = "Type: " + (pokemon.types![0].type?.name)!
        typeLabel.textColor = .green
        typeLabel.backgroundColor = .lightGray
        
        abilitiesLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 2).isActive = true
        abilitiesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
        abilitiesLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        abilitiesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
        abilitiesLabel.textAlignment = .center
        abilitiesLabel.numberOfLines = 0
        abilitiesLabel.adjustsFontSizeToFitWidth = true
        abilitiesLabel.text = "Abilities: "
        for i in pokemon.abilities! {
            abilitiesLabel.text! = abilitiesLabel.text! + (i.ability?.name)! + ", "
        }
        abilitiesLabel.textColor = .blue
        abilitiesLabel.backgroundColor = .cyan
        abilitiesLabel.adjustsFontSizeToFitWidth = true
        
        movesLabel.topAnchor.constraint(equalTo: abilitiesLabel.bottomAnchor, constant: 2).isActive = true
        movesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
        movesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
        movesLabel.textAlignment = .center
        movesLabel.numberOfLines = 0
        movesLabel.adjustsFontSizeToFitWidth = true
        movesLabel.text = "Moves: "
        for i in pokemon.moves! { movesLabel.text! = movesLabel.text! + ((i.move?.name!)! + ", ") }
        movesLabel.textColor = .purple
        movesLabel.backgroundColor = .lightGray
        movesLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        movesLabel.adjustsFontSizeToFitWidth = true
    }
}
