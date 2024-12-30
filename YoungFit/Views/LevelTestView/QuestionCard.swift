//
//  QuestionCard.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct QuestionCard: View {
	@EnvironmentObject var vm: YFViewModel
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

						question.selectedOption = option.id
						if vm.answers.contains(where: {$0.question_id == question.id}) {
							if let index = vm.answers.firstIndex(where: {$0.question_id == question.id}) {
								vm.answers[index].answer = option.id
							}
						} else {
							vm.answers.append(Answer(question_id: question.id, answer: option.id))
						}
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
