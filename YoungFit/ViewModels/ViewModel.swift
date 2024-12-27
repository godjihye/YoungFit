//
//  ViewModel.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import Foundation
import Alamofire

class YFViewModel: ObservableObject {
	@Published var albums: [Album] = []
	@Published var sentences: [Sentence] = []
	@Published var questions: [Question] = []
	@Published var currentAlbum: Album? = nil
	let endPoint = (Bundle.main.object(forInfoDictionaryKey: "ENDPOINT") as? String) ?? ""
	
	func fetchAlbums() {
		let url = "\(endPoint)/albums/public"
		request(url, method: .get) { (result: Result<AlbumRoot, Error>) in
			switch result {
			case .success(let root):
				self.albums = root.albums
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func fetchSentences(albumId: Int) {
		let url = "\(endPoint)/albums/public/\(albumId)/sentences"
		request(url, method: .get) { (result: Result<SentenceRoot, Error>) in
			switch result {
			case .success(let root):
				self.sentences = root.sentences
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func fetchQuestions() {
		let url = "\(endPoint)/questions"
		request(url, method: .get) { (result: Result<[Question], Error>) in
			switch result {
			case .success(let root):
				self.questions = root
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func submitAnswer() {
		let url = "\(endPoint)/submit"
		
	}
	private func request<T: Decodable>(_ url: String, method: HTTPMethod, params: Parameters? = nil, headers: HTTPHeaders? = nil, completion: @escaping (Result<T, Error>) -> Void) {
//					SVProgressHUD.show()
					AF.request(url, method: method, parameters: params, headers: headers).response { response in
//									SVProgressHUD.dismiss()
									guard let statusCode = response.response?.statusCode else {
											completion(.failure(NetworkError.unknown))
											return
									}
									switch statusCode {
									case 200..<300:
											if let data = response.data {
													do {
															let result = try JSONDecoder().decode(T.self, from: data)
															completion(.success(result))
													} catch {
															completion(.failure(error))
													}
											}
									case 300..<600:
										completion(.failure(NetworkError.server))
//											if let data = response.data, let errorResponse = try? JSONDecoder().decode(ApiResponse.self, from: data) {
//													completion(.failure(NetworkError.custom(message: errorResponse.message)))
//											} else {
//													completion(.failure(NetworkError.server))
//											}
									default:
											completion(.failure(NetworkError.unknown))
									}
							}
			}
}

// MARK: - Network Error
enum NetworkError: LocalizedError {
		case unknown
		case server
		case custom(message: String)
		
		var errorDescription: String? {
				switch self {
				case .unknown: return "서버 연결에 실패했습니다.\n잠시 후 다시 시도해주세요."
				case .server: return "서버 오류가 발생했습니다."
				case .custom(let message): return message
				}
		}
}
