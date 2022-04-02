//
//  PlaySound.swift
//  Learn by Doing
//
//  Created by Piotr Szerszeń on 02/04/2022.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound() {
    playSound(sound: "sound-chime", type: "mp3")
}

private func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    }
}
