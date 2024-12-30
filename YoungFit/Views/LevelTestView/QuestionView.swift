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
			if vm.testLevel == "" {
				if vm.questions.isEmpty {
					ProgressView("질문을 불러오는 중...")
				} else {
					QuestionCard(question: $vm.questions[questionIndex])
				}
				buttons
			} else {
				LevelView()
			}
		}
		//.fullScreenCover(isPresented: vm.testLevel != "", content: <#T##() -> View#>)
		.onAppear {
			vm.fetchQuestions()
			questionIndex = 0
		}
		.alert("YoungFit", isPresented: $vm.showAlert) {
			Button("확인", role: .cancel) {
				
			}
		} message: {
			Text("\(vm.testScore)점으로 \(vm.testLevel)레벨입니다.")
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
				vm.submitAnswer()
			}
		}
	}
}

#Preview {
	let vm = YFViewModel()
	QuestionView().environmentObject(vm)
}
