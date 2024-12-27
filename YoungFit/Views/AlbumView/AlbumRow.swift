//
//  AlbumRow.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import SwiftUI

struct AlbumRow: View {
	let album: Album
	var body: some View {
		HStack(spacing: 16) {
			VStack(alignment: .leading) {
				Text(album.name)
					.font(.headline)
				Text(album.level)
					.font(.footnote)
					.foregroundStyle(.secondary)
			}
			Spacer()
		}
		.padding(.vertical, 5)
	}
}

#Preview {
	AlbumRow(album: sampleAlbums[0])
}
