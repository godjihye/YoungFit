//
//  SentenceRow.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI
import AVFoundation

struct SentenceRow: View {
	
	let sentence: Sentence
	let audioPlayer = AudioPlayerManager()
	var body: some View {
		HStack(spacing: 0) {
			Text("\(sentence.id)")
				.foregroundStyle(.secondary)
				.padding(.trailing)
			VStack(alignment: .leading) {
				HStack {
					Text(sentence.koreanText)
					Image(systemName: "speaker.wave.2.fill")
						.onTapGesture {
							configureAudioSession()
							audioPlayer.playSound(from: sentence.koreanAudioUrl)
						}
				}
				HStack {
					Text(sentence.englishText)
					Image(systemName: "speaker.wave.2.fill")
						.onTapGesture {
							configureAudioSession()
							audioPlayer.playSound(from: sentence.englishAudioUrl)
						}
				}
				.font(.headline)
			}
		}
	}
	
	
}
func configureAudioSession() {
		do {
				let audioSession = AVAudioSession.sharedInstance()
				try audioSession.setCategory(.playback, mode: .default, options: [])
				try audioSession.setActive(true)
				print("오디오 세션 설정 완료")
		} catch {
				print("오디오 세션 설정 중 오류 발생: \(error.localizedDescription)")
		}
}
#Preview {
	SentenceRow(sentence: sampleSentences[5])
}
