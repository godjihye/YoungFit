//
//  ContentView.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
			TabView {
				AlbumListView().environmentObject(YFViewModel())
					.tabItem {
						Text("학습")
					}
				QuestionView().environmentObject(YFViewModel())
					.tabItem {
						Text("테스트")
					}
			}
    }
}

#Preview {
    ContentView()
}
