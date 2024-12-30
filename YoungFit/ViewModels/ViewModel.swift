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
	@Published var testScore: Int = 0
	@Published var testLevel: String = ""
	@Published var showAlert: Bool = false
	@Published var userInfo: User?
	
	@Published var showAlertSignUp: Bool = false
	@Published var messageSignUp: String = ""
	@Published var showAlertSignIn: Bool = false
	@Published var messageSignIn: String = ""
	
	var answers: [Answer] = []
	let endPoint = (Bundle.main.object(forInfoDictionaryKey: "ENDPOINT") as? String) ?? ""
	
	// MARK: - fetch Albums / Sentences / Questions
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
				self.currentAlbum = root.album
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
	
	// MARK: - Auth
	func login(email: String, password: String) {
		let url = "\(endPoint)/users/login"
		let params: Parameters = ["email": email, "password": password]
		request(url, method: .post, params: params) { (result: Result<SignIn, Error>) in
			switch result {
			case .success(let root):
				UserDefaults.standard.set(root.token, forKey: "token")
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func register(email: String, password: String, name: String) {
		let url = "\(endPoint)/users/register"
		let params: Parameters = ["email": email, "password": password, "name": name]
		request(url, method: .post, params: params) { (result: Result<SignUp, Error>) in
			switch result {
			case .success(let root):
				self.showAlertSignUp = true
				self.messageSignUp = root.message
			case .failure(let error):
				self.showAlertSignUp = true
				self.messageSignUp = error.localizedDescription
			}
		}
	}
	
	// MARK: - submit LevelTest Answer
	func submitAnswer() {
		let url = "\(endPoint)/submit"
		if let jsonData = createOrderedJSON(answers: answers) {
			let headers: HTTPHeaders = ["Content-Type": "application/json"]
			request(url, method: .post, params: nil, encoding: JSONEncoding.default, headers: headers, requestModifier: { request in request.httpBody = jsonData}) { (result: Result<TestResult, Error>) in
				switch result {
				case .success(let root):
					self.testLevel = root.level
					self.testScore = root.total_score
					self.showAlert = true
				case .failure(let error):
					print(error.localizedDescription)
				}
			}
		}
	}
	
	private func request<T: Decodable>(_ url: String, method: HTTPMethod, params: Parameters? = nil, encoding: ParameterEncoding? = nil, headers: HTTPHeaders? = nil, requestModifier: Session.RequestModifier? = nil, completion: @escaping (Result<T, Error>) -> Void) {
		AF.request(url, method: method, parameters: params, encoding: encoding ?? URLEncoding.default, headers: headers, requestModifier: requestModifier).response { response in
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
				if let data = response.data, let errorResponse = try? JSONDecoder().decode(APIError.self, from: data) {
					completion(.failure(NetworkError.custom(message: errorResponse.message)))
				} else {
					completion(.failure(NetworkError.server))
				}
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

// JSON 배열 안 값의 순서가 바뀌는 경우 쓴다.
func createOrderedJSON(answers: [Answer]) -> Data? {
	// JSON 배열 생성
	let jsonArray = answers.map { answer in
		[
			"question_id": answer.question_id,
			"answer": answer.answer
		]
	}
	let jsonObject: [String: Any] = ["answers": jsonArray]
	
	// JSON 직렬화
	do {
		let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
		return jsonData
	} catch {
		print("Error creating JSON: \(error)")
		return nil
	}
}
