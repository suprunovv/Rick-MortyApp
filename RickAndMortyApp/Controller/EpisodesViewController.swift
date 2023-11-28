//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 17.11.2023.
//

import UIKit

protocol ColletionCellDelegate: AnyObject {
    func peredacha(model: PersonModel)
}

protocol TransferCell: AnyObject {
    func transfer(model: PersonModel)
}

final class EpisodesViewController: UIViewController {
    
    let mainView = EpisodesView()
    
    private let sessionConfig = URLSessionConfiguration.default
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    override func loadView() {
        view = mainView
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.barTintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEpisodes()
        mainView.seriesCollectionView.dataSource = self
    }
    
    private func getEpisodes() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else { return }
        session.dataTask(with: url) {[weak self] data, _, error in
            guard let self = self else {return}
            if error == nil, let parseData = data {
                guard let episodesResult = try? self.decoder.decode(Episod.self, from: parseData) else { return }
                episodesResult.results?.forEach{ res in
                    self.getCharacter(url: res.characters?.randomElement() ?? "") { char in
                        self.getImage(url: char.image ?? "") { image in
                            self.appendModel(episodesResult: res, charactersInfo: char, image: image)
                        }
                    }
                }
            }
        }.resume()
    }
    
    private func getCharacter(url: String, onComplete: @escaping (Characters) -> Void ) {
        guard let url = URL(string: url) else {return}
        session.dataTask(with: url) { data, _, error in
            if error == nil, let parseData = data {
                guard let character = try? self.decoder.decode(Characters.self, from: parseData) else {
                    return
                }
                    onComplete(character)
            }
        }.resume()
    }
    
    func getImage(url: String, onComplete: @escaping (UIImage) -> Void) {
        guard let url = URL(string: url) else {return}
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                onComplete(image)
            }
        }
    }

    private func appendModel(episodesResult: Result, charactersInfo: Characters, image: UIImage) {
            LikedEpisodes.shared.updatePerson(model: PersonModel(personName: charactersInfo.name ?? "",
                                                                 nameEpisode: episodesResult.name ?? "",
                                                                 image: image ?? UIImage(),
                                                                 nomberEpisode: episodesResult.episode ?? "",
                                                                 status: charactersInfo.status ?? "",
                                                                 species:  charactersInfo.species ?? "",
                                                                 gender:  charactersInfo.gender ?? "",
                                                                 id: String(charactersInfo.id ?? 1)))

        DispatchQueue.main.async {
            self.mainView.seriesCollectionView.reloadData()
        }
    }
}
