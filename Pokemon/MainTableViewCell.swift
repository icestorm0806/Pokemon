//
//  MainTableViewCell.swift
//  Pokemon
//
//  Created by Aaron Fulwider on 10/31/20.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
    let pokemonSpriteImageView = UIImageView()
    let nameLabel = UILabel()
    let typeLabel = UILabel() // may change to image later
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        uiSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func uiSetup(){
        addSubview(pokemonSpriteImageView)
        addSubview(nameLabel)
        addSubview(typeLabel)
        
        pokemonSpriteImageView.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints  = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        pokemonSpriteImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        pokemonSpriteImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pokemonSpriteImageView.widthAnchor.constraint(equalToConstant: 96).isActive = true
        pokemonSpriteImageView.heightAnchor.constraint(equalToConstant: 96).isActive = true
        pokemonSpriteImageView.contentMode = .scaleToFill
        pokemonSpriteImageView.clipsToBounds = true
        pokemonSpriteImageView.backgroundColor = .white
        
        nameLabel.topAnchor.constraint(equalTo: pokemonSpriteImageView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: pokemonSpriteImageView.trailingAnchor, constant: 2).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -1).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .lightText
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.backgroundColor = .blue
        
        typeLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 1).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: pokemonSpriteImageView.trailingAnchor, constant: 2).isActive = true
        typeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        typeLabel.textAlignment = .center
        typeLabel.backgroundColor = .lightText
        typeLabel.adjustsFontSizeToFitWidth = true
        typeLabel.backgroundColor = .red
    }
}
