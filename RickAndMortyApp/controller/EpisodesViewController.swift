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
    
    let startView = EpisodesView()
    var likeEpispd = LikedEpisodes.shared
    var filterString = String()
    var filterArray = [Characters]()
    
    private let sessionConfig = URLSessionConfiguration.default
    private let session = URLSession.shared
    private let decoder = JSONDecoder()

    var arrayImage = [UIImage]()
    var characters = [Characters]()
    var episodes = LikedEpisodes.shared.selfEpisodes
    
    override func loadView() {
        view = startView
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.barTintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEpisodes()
        setDelegate()
    }
    
    
    private func setDelegate() {
        startView.seriesCollectionView.dataSource = self
        startView.seartchBar.delegate = self 
    }
    
    private func getEpisodes() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else { return }
        var result = Result()
        session.dataTask(with: url) {[weak self] data, _, error in
            guard let self = self else {return}
            if error == nil, let parseData = data {
                guard let episodesResult = try? self.decoder.decode(Episod.self, from: parseData) else { return }
                result = episodesResult.results?.randomElement() ?? Result()
                result.characters?.enumerated().forEach { index, episode in
                    self.getCharacter(url: episode) { characterInfo in
                        self.characters.append(characterInfo)
                        self.getImage(url: characterInfo.image ?? "") { image in
                            self.arrayImage.append(image)
                        }
                         if (result.characters?.count ?? 0) - 1 == index {
                             self.appendModel(episodesResult: result, charactersInfo: self.characters, image: self.arrayImage)
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

    private func appendModel(episodesResult: Result, charactersInfo: [Characters], image: [UIImage]) {
        let _ = charactersInfo.enumerated().forEach { index, char in
            LikedEpisodes.shared.updatePerson(model: PersonModel(personName: char.name ?? "",
                                                                 nameEpisode: episodesResult.name ?? "",
                                                                 image: image[index],
                                                                 nomberEpisode: episodesResult.episode ?? "",
                                                                 status: char.status ?? "",
                                                                 species:  char.species ?? "",
                                                                 gender:  char.gender ?? "",
                                                                 id: String(char.id ?? 1)))

        }
        DispatchQueue.main.async {
            self.startView.seriesCollectionView.reloadData()
        }
    }
}


