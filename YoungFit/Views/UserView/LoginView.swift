//
//  LoginView.swift
//  YoungFit
//
//  Created by jhshin on 12/30/24.
//

import SwiftUI

struct LoginView: View {
	@State private var email: String = ""
	@State private var password: String = ""
	var body: some View {
		Text("YoungFit Login")
			.font(.title)
			.fontWeight(.bold)
			.padding()
		textFields
		WideImageButton(icon: "person.badge.plus", title: "로그인", backgroundColor: .purple) {
//			vm.login()
		}
		.padding()
	}
	private var textFields: some View {
		VStack {
			CustomTextField(icon: "person", placeholder: "예) youngfit@gmail.com", text: $email, isSecured: false)
			CustomTextField(icon: "lock.fill", placeholder: "비밀번호는 4자 이상 입력해주세요.", text: $password, isSecured: true)
		}
		.padding()
	}
}

#Preview {
	LoginView()
}
