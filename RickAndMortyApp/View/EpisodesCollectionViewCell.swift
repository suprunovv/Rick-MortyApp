//
//  SeriesCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 17.11.2023.
//

import UIKit



final class EpisodesCollectionViewCell: UICollectionViewCell {
    static let reuseID = "SeriesCollectionViewCell"
    
    let mainView = UIView()
    let botomView = UIView()
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let seriesNameLabel = UILabel()
    let seriesNum = UILabel()
    let likeButton = UIButton(type: .system)
    let playButton = UIButton(type: .system)
    var model: PersonModel?
    var like = false
    weak var delegate: ColletionCellDelegate?
    weak var transferDelegate: TransferCell?
    weak var reloadDelegate: ReloadCollection?
    
    func setCell(_ episodeModel: PersonModel, delegate: ColletionCellDelegate?, transferDelegate: TransferCell?, reloadDelegate: ReloadCollection?) {
        self.reloadDelegate = reloadDelegate
        self.transferDelegate = transferDelegate
        self.delegate = delegate
        model = episodeModel
        backgroundColor = .white
        layer.shadowRadius = 0.5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1
        
        contentView.addSubview(botomView)
        botomView.layer.cornerRadius = 16
        botomView.backgroundColor = UIColor(named: "ColorCellButton")
        botomView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.text = episodeModel.personName
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = episodeModel.image
        imageView.isUserInteractionEnabled = true
        
        let tapOnImageGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        imageView.addGestureRecognizer(tapOnImageGestureRecogniser)
        
        seriesNameLabel.text = episodeModel.nameEpisode
        seriesNameLabel.font = .systemFont(ofSize: 16, weight: .light)
        seriesNum.font = .systemFont(ofSize: 16, weight: .light)
        seriesNum.text = episodeModel.nomberEpisode
        
        likeButton.setBackgroundImage(episodeModel.like ? UIImage(named: "Vector") : UIImage(named: "heart"), for: .normal)
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        playButton.setBackgroundImage(UIImage(named: "Play"), for: .normal)
        
        
        NSLayoutConstraint.activate([
            botomView.leftAnchor.constraint(equalTo: leftAnchor),
            botomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            botomView.rightAnchor.constraint(equalTo: rightAnchor),
            botomView.heightAnchor.constraint(equalToConstant: 71)
        ])
        
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            nameLabel.bottomAnchor.constraint(equalTo: botomView.topAnchor),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            nameLabel.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        let stack = UIStackView(view: [playButton, seriesNum, seriesNameLabel, likeButton], axis: .horizontal, spasing: 20, alignment: .fill)
        
        botomView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            likeButton.heightAnchor.constraint(equalToConstant: 30),
            likeButton.widthAnchor.constraint(equalToConstant: 30),
            playButton.heightAnchor.constraint(equalToConstant: 30),
            playButton.widthAnchor.constraint(equalToConstant: 30),
            seriesNum.widthAnchor.constraint(equalToConstant: 60),
            stack.leftAnchor.constraint(equalTo: botomView.leftAnchor, constant: 20),
            stack.rightAnchor.constraint(equalTo: botomView.rightAnchor, constant: -20),
            stack.centerYAnchor.constraint(equalTo: botomView.centerYAnchor)
        ])
    }
    
    @objc func likeTapped() {
        UIView.animate(withDuration: 0.1) {
            self.likeButton.frame.size.width = 1
            self.likeButton.frame.size.height = 1
            
        }
        
        self.model?.like.toggle()
        if model?.like ?? Bool() {
            likeButton.setBackgroundImage(UIImage(named: "Vector"), for: .normal)
        } else {
            likeButton.setBackgroundImage(UIImage(named: "heart"), for: .normal)
        }
        transferDelegate?.transfer(model: model! )
        reloadDelegate?.reloadCollection()
    }
    
    @objc func imageTapped() {
        guard let model = model else {
            return
        }
        delegate?.peredacha(model: model)
        
    }
    
}
