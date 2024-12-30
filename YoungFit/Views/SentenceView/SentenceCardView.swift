//
//  SentenceCardView.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct SentenceCardView: View {
	@State var sentences: [Sentence]
	@State var index: Int = 0
	@State var repeatCount: Int = 3
	let audioPlayer = AudioPlayerManager()
	
	var body: some View {
		VStack {
			Spacer()
			//				Text("Index: \(index)")
			//				Text("repeatCount: \(repeatCount)")
			CardView(sentence: $sentences[index])
			Spacer()
			HStack {
				CardButton(icon: "arrowshape.turn.up.left.fill", title: "이전", disabled: index < 1) { index -= 1 }
				CardButton(icon: "speaker.wave.2", title: "\(repeatCount)", disabled: false) {
					if repeatCount < 3 {
						repeatCount += 1
					} else {
						repeatCount = 1
					}
				}
				CardButton(icon: "play.fill", title: "재생", disabled: false) {
					audioPlayer.playSoundRepeat(koStrUrl: sentences[index].koreanAudioUrl, enStrUrl: sentences[index].englishAudioUrl, repeatCount: repeatCount) {
						DispatchQueue.main.async {
							if index < sentences.count - 1 {
								index += 1
							}
						}
					}
				}
				CardButton(icon: "pause.fill", title: "멈춤", disabled: false) {
					DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
						audioPlayer.stopPlayback()
					}
				}
				CardButton(icon: "arrowshape.turn.up.right.fill", title: "다음", disabled: index == sentences.count - 1) { index += 1}
			}
			.padding(.bottom)
		}
		.navigationTitle("학습")
		.navigationBarTitleDisplayMode(.inline)
	}
}

#Preview {
	SentenceCardView(sentences: sampleSentences)
}
