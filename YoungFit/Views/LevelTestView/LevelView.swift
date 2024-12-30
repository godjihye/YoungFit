//
//  LevelView.swift
//  YoungFit
//
//  Created by jhshin on 12/30/24.
//

import SwiftUI

struct LevelView: View {
	@Environment(\.dismiss) private var dismiss
	@EnvironmentObject var vm: YFViewModel
    var body: some View {
			Text("사용자님의 현재 레벨은 \(vm.testLevel)입니다.")
			Button {
				dismiss()
			} label: {
				Text("재검사하기")
			}

    }
}

#Preview {
	let vm = YFViewModel()
	LevelView().environmentObject(vm)
}
