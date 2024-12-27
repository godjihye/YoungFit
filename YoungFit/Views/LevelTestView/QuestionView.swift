//
//  QuestionView.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct QuestionView: View {
	@EnvironmentObject var vm: YFViewModel
	@State var questionIndex: Int = 0
	
    var body: some View {
			VStack {
				if vm.questions.isEmpty {
						ProgressView("질문을 불러오는 중...")
				} else {
						QuestionCard(question: $vm.questions[questionIndex])
				}
				buttons
			}
			.onAppear {
				//				if vm.questions.isEmpty {
				//					vm.fetchQuestions()
				//				}
				vm.fetchQuestions()
				questionIndex = 0
			}
    }
	private var buttons: some View {
		HStack {
			CardButton(icon: "arrowshape.turn.up.left.fill", title: "이전", disabled: questionIndex <= 0) {
				questionIndex -= 1
			}
			CardButton(icon: "arrowshape.turn.up.right.fill", title: "다음", disabled: questionIndex == vm.questions.count - 1) {
				questionIndex += 1
			}
			CardButton(icon: "", title: "제출", disabled: questionIndex != vm.questions.count - 1) {
				
			}
		}
	}
}

#Preview {
	let vm = YFViewModel()
	
	QuestionView().environmentObject(vm)
}
