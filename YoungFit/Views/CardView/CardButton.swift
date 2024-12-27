//
//  CardButton.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct CardButton: View {
	let icon: String
	let title: String?
	let disabled: Bool
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			HStack(spacing: 3) {
				Image(systemName: icon)
				if let title {
					Text(title)
				}
			}
			.foregroundStyle(disabled ? .gray : .black)
			.frame(width: 60, height: 50)
			.background(.white)
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(.black)
				)
		}
		.disabled(disabled)
		
	}
}

#Preview {
	HStack {
		CardButton(icon: "arrowshape.turn.up.left.fill", title: "이전", disabled: true){}
		CardButton(icon: "speaker.wave.2", title: "1", disabled: false){}
		CardButton(icon: "play.fill", title: "재생", disabled: false){}
		CardButton(icon: "pause.fill", title: "멈춤", disabled: false){}
		CardButton(icon: "arrowshape.turn.up.right.fill", title: "다음", disabled: false){}
	}
}
