//
//  SentenceListView.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct SentenceListView: View {
	@EnvironmentObject var vm: YFViewModel
	let albumId: Int

	var body: some View {
		NavigationView {
			VStack {
				Text(vm.currentAlbum?.name ?? "")
					.font(.title3)
					.fontWeight(.bold)
					.padding()
				List {
					NavigationLink {
						SentenceCardView(sentences: vm.sentences)
					} label: {
						Text("학습 시작")
							.foregroundStyle(.purple)
					}
					
					ForEach(vm.sentences) { sentence in
						SentenceRow(sentence: sentence)
					}
				}
				.listStyle(.plain)
				.onAppear {
					vm.fetchSentences(albumId: albumId)
				}
			}
		}
	}
}

//#Preview {
//	SentenceListView(name: "A1 Beginner Level", sentences: sampleSentences)
//}
