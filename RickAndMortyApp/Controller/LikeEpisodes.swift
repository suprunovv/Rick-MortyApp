//
//  TestSingle.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 20.11.2023.
//

import Foundation
import UIKit

final class LikedEpisodes {
    static let shared = LikedEpisodes()
    private init() {}
    
    var selfEpisodes: [PersonModel] = []
    var likeEpisodes: [PersonModel] = []
      
    func updateLikeEpisode(episode: PersonModel) {
        if likeEpisodes.isEmpty {
            likeEpisodes.append(episode)
        } else {
            for (index, epis) in likeEpisodes.enumerated() {
                 if epis.personName == episode.personName {
                    likeEpisodes.remove(at: index)
                    self.selfEpisodes[index].like.toggle()
                    return
                 }
            }
            likeEpisodes.append(episode)
        }
    }
    
    func updatePerson(model: PersonModel) {
        selfEpisodes.append(model)
        selfEpisodes.sort {$0.episodeId < $1.episodeId }
    }
}
