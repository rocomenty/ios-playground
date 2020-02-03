//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


struct StoryBrain {
    var storyNumber: Int = 0
    var stories: [Story]
    
    mutating func nextStory(userChoice: String) -> Story {
        if userChoice == self.stories[self.storyNumber].choice1 {
            self.storyNumber = self.stories[self.storyNumber].choice1Destination
        } else {
            self.storyNumber = self.stories[self.storyNumber].choice2Destination
        }
        return self.stories[self.storyNumber]
    }
}
