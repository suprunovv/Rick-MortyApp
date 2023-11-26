//
//  CharacterDetailsView.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 18.11.2023.
//

import UIKit

final class CharacterDetailsView: UIView {

    let informationTabelView = UITableView(frame: .zero, style: .plain)
    let avatarImageView = UIImageView()
    let nameLabel = UILabel()
    let cameraButton = UIButton(type: .system)
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        backgroundColor = .white
        setTabelView()
        setAvatarImageView()
        setNameLabel()
        setCameraButton()
    }
    
    private func setAvatarImageView() {
        avatarImageView.image = UIImage(named: "rick")
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.layer.borderWidth = 5
        avatarImageView.layer.borderColor = UIColor(named: "ColorCellButton")?.cgColor
        addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 124),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        
        ])
    }
    
    private func setCameraButton() {
        addSubview(cameraButton)
        cameraButton.setBackgroundImage(UIImage(named: "Camera"), for: .normal)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cameraButton.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 5),
            cameraButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            cameraButton.heightAnchor.constraint(equalToConstant: 32),
            cameraButton.widthAnchor.constraint(equalToConstant: 32)
        ])
        
    }
    
    private func setNameLabel() {
        addSubview(nameLabel)
        nameLabel.font = .systemFont(ofSize: 32)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 320),
            nameLabel.bottomAnchor.constraint(equalTo: informationTabelView.topAnchor, constant: -19),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    
        }
    
    private func setTabelView() {
        addSubview(informationTabelView)
        informationTabelView.backgroundColor = .white
        informationTabelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            informationTabelView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            informationTabelView.centerXAnchor.constraint(equalTo: centerXAnchor),
            informationTabelView.topAnchor.constraint(equalTo: topAnchor, constant: 370),
            informationTabelView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
        
        ])
        
        
    }
}
