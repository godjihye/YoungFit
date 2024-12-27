//
//  Model.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import Foundation

struct Album: Codable, Identifiable, Hashable {
	let id: Int
	let name: String
	let level: String
	let isPublic: Bool?
}
struct AlbumRoot: Decodable {
	let message: String
	let albums: [Album]
}
struct Sentence: Codable, Identifiable, Hashable {
	let id: Int
	let koreanText: String
	let englishText: String
	let koreanAudioUrl: String
	let englishAudioUrl: String
}
struct SentenceRoot: Decodable {
	let message: String
	let album: Album
	let sentences: [Sentence]
}

struct Question: Decodable, Identifiable {
	let id: Int
	let level: String
	let questionText: String
	let correctAnswer: Int
	let points: Int
	let options: [Option]
	var selectedOption: Int?
	enum CodingKeys: String, CodingKey {
		case id
		case level
		case questionText = "question_text"
		case correctAnswer = "correct_answer"
		case points
		case options
		case selectedOption
	}
}
struct Option: Decodable, Identifiable {
	let id: Int
	let optionText: String
	
	enum CodingKeys: String, CodingKey {
		case id = "option_number"
		case optionText = "option_text"
	}
}
struct Answer: Codable {
	let question_id: Int
	let answer: Int
}

struct Answers: Codable {
	let answers: [Answer]
}

/*
 
	
{
	"answers": [
		{ "question_id": 1, "answer": 2 },
		{ "question_id": 2, "answer": 3 },
		{ "question_id": 3, "answer": 1 },
		{ "question_id": 4, "answer": 4 },
		{ "question_id": 5, "answer": 3 },
		{ "question_id": 6, "answer": 2 },
		{ "question_id": 7, "answer": 4 },
		{ "question_id": 8, "answer": 1 },
		{ "question_id": 9, "answer": 2 },
		{ "question_id": 10, "answer": 4 }
	]
}
 */
