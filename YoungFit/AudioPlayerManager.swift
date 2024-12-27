//
//  AudioPlayerManager.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import Foundation
import AVFoundation

class AudioPlayerManager {
	private var audioPlayer: AVPlayer?
	private var repeatCount = 0
	private var maxRepeats = 0
	private var urls: [URL] = []
	private var currentIndex = 0
	private var isPlaying = false
	private var onCompletion: (() -> Void)?
	
	func playSound(from url: String) {
		print("playSound 함수 실행")
		guard let audioURL = URL(string: url) else {
			print("유효하지 않은 URL")
			return
		}
		audioPlayer = AVPlayer(url: audioURL)
		audioPlayer?.play()
		print("audioPlayer play")
	}
	
	func playSoundRepeat(koStrUrl: String, enStrUrl: String, repeatCount: Int, onCompletion: @escaping () -> Void) {
		guard let koUrl = URL(string: koStrUrl), let enUrl = URL(string: enStrUrl) else { return }
		self.urls = [koUrl, enUrl]
		self.repeatCount = 0
		self.maxRepeats = repeatCount * urls.count
		self.currentIndex = 0
		self.isPlaying = true
		self.onCompletion = onCompletion
		playCurrentAudio()
		
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(handleAudioFinished),
			name: .AVPlayerItemDidPlayToEndTime,
			object: audioPlayer?.currentItem
		)
	}
	
	private func playCurrentAudio() {
		guard repeatCount < maxRepeats else {
			stopAudio()
			onCompletion?()
			return
		}
		
		let currentUrl = urls[currentIndex]
		audioPlayer = AVPlayer(url: currentUrl)
		// 알림 등록 전에 기존 알림 제거
		NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
		
		// 새로운 AVPlayerItem에 대해 알림 등록
		if let currentItem = audioPlayer?.currentItem {
			NotificationCenter.default.addObserver(
				self,
				selector: #selector(handleAudioFinished),
				name: .AVPlayerItemDidPlayToEndTime,
				object: currentItem
			)
		}
		audioPlayer?.play()
		repeatCount += 1
		currentIndex = (currentIndex + 1) % urls.count
	}
	
	@objc private func handleAudioFinished() {
		playCurrentAudio()
	}
	
	private func stopAudio() {
		audioPlayer?.pause()
		audioPlayer = nil
		NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
		isPlaying = false
	}
	func stopPlayback() {
		stopAudio()
	}
}
