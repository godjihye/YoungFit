//
//  QuestionCard.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct QuestionCard: View {
	@Binding var question: Question
	@State var answer: String = ""
	var body: some View {
		VStack {
			VStack {
				Text("문제 \(question.id)")
				Text(question.questionText)
			}
			.font(.title3)
			.fontWeight(.bold)
			.padding()
			Divider()
			VStack(alignment: .leading) {
				ForEach(question.options) { option in
					Button {
//						question.selectedOption = option.id
						question.selectedOption = option.id
								print("Selected option ID: \(option.id)")
								print("Question selectedOption: \(question.selectedOption ?? -1)")
//								if let index = questions.firstIndex(where: { $0.id == question.id }) {
//										questions[index] = question
//										print("Updated questions array: \(questions[index].selectedOption ?? -1)")
//								}
					} label: {
						
						Image(systemName: question.selectedOption == option.id ? "circle.fill" : "circle")
							Text(option.optionText)
							.multilineTextAlignment(.leading)
						
					}
					.foregroundStyle(question.selectedOption == option.id ? .black : .gray)
				}
			}
			.padding()
		}
	}
}

#Preview {
	QuestionCard(question: .constant(sampleQuestions[0]))
}
