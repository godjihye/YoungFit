//
//  AlbumListView.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct AlbumListView: View {
	@EnvironmentObject var vm: YFViewModel
	
    var body: some View {
			NavigationSplitView {
				List {
					ForEach(vm.albums.sorted(by: {$0.id < $1.id})) { album in
							NavigationLink {
								SentenceListView(albumId: album.id)
							} label: {
								AlbumRow(album: album)
							}
					}
				}
				.listStyle(.inset)
				.navigationTitle("학습문장 앨범 리스트")
				.onAppear {
					vm.fetchAlbums()
				}
			} detail: {
				Text("앨범을 선택하세요")
			}

    }
}

//#Preview {
//	AlbumListView(albums: sampleAlbums)
//}
