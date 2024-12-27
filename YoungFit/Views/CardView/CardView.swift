//
//  CardView.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct CardView: View {
	@Binding var sentence: Sentence
    var body: some View {
			VStack(spacing: 20) {
				Text(sentence.koreanText)
					.font(.system(size: 40, weight: .black))
				Text(sentence.englishText)
					.font(.system(size: 40, weight: .black, design: .rounded))
			}
			.padding()
    }
}

#Preview {
	CardView(sentence: .constant(sampleSentences[0]))
}
