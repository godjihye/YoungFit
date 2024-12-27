//
//  Sample.swift
//  YoungFit
//
//  Created by jhshin on 12/23/24.
//

import Foundation

let sampleAlbums: [Album] = [
	Album(id: 44, name: "A1 Beginner Level", level: "A1", isPublic: true),
	Album(id: 45, name: "A2 Elementary Level", level: "A2", isPublic: true),
	Album(id: 46, name: "B1 Intermediate Level", level: "B1", isPublic: true),
	Album(id: 47, name: "B2 Upper-Intermediate Level", level: "B2", isPublic: true),
	Album(id: 48, name: "C1 Advanced Level", level: "C1", isPublic: true),
	Album(id: 49, name: "C2 Proficiency Level", level: "C2", isPublic: true),
	Album(id: 147, name: "실전회화1 : 스타벅스에서 커피와 음식 주문하기 ☕", level: "A1", isPublic: true),
	Album(id: 148, name: "실전회화2 : 맥도날드에서 맥모닝 주문하기 🍔", level: "A1", isPublic: true),
	Album(id: 149, name: "실전회화3 : 호텔 체크인 하기 🏤", level: "A1", isPublic: true),
	Album(id: 150, name: "실전회화4 : 길 물어보기 🚦", level: "A1", isPublic: true),
	Album(id: 151, name: "실전회화5 : 회의 스케쥴 정하기 ⏰", level: "A1", isPublic: true),
]

let albumLevel = ["A1", "A2", "B1", "B2", "C1", "C2"]

let sampleSentences: [Sentence] = [
	Sentence(id: 1, koreanText: "안녕하세요", englishText: "Hello!", koreanAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_ko_001_안녕하세요.wav", englishAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_en_001_Hello!.wav"),
	Sentence(id: 2, koreanText: "반갑습니다", englishText: "Nice to meet you!", koreanAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_ko_002_반갑습니다.wav", englishAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_en_002_Nice to meet you!.wav"),
	Sentence(id: 3, koreanText: "제 이름은 민수입니다", englishText: "My name is Minsu.", koreanAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_ko_003_제 이름은 민수입니다.wav", englishAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_en_003_My name is Minsu..wav"),
	Sentence(id: 4, koreanText: "저는 책을 좋아해요", englishText: "I love reading books.", koreanAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_ko_004_저는 책을 좋아해요.wav", englishAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_en_004_I love reading books..wav"),
	Sentence(id: 5, koreanText: "이 쪽은 제 친구예요", englishText: "This is my friend.", koreanAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_ko_005_이 쪽은 제 친구예요.wav", englishAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_en_005_This is my friend..wav"),
	Sentence(id: 6, koreanText: "저희는 지금 학교에 있어요", englishText: "We're at school right now.", koreanAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_ko_006_저희는 지금 학교에 있어요.wav", englishAudioUrl: "https://yfendpoint-baenbhhrfyd2ajfk.z01.azurefd.net/yfblob2container/a1_en_006_We're at school right now..wav")
]

let sampleQuestions: [Question] = [
	Question(id: 1, level: "A1", questionText: "How are you?", correctAnswer: 2, points: 5, options: [Option(id: 4, optionText: "At 5 o'clock"), Option(id: 3, optionText: "No, I don’t."), Option(id: 2, optionText: "I’m fine, thank you."), Option(id: 1, optionText: "Yes, please.")]),
	Question(id: 2, level: "A1", questionText: "How do you introduce yourself?", correctAnswer: 3, points: 5, options: [Option(id: 1, optionText: "It’s sunny today."), Option(id: 2, optionText: "My name is Anna."), Option(id: 3, optionText: "Good morning!"), Option(id: 4, optionText: "She is from Canada.")])
]

/*
 [
		 {
				 "id": 1,
				 "level": "A1",
				 "question_text": "How are you?",
				 "correct_answer": 2,
				 "points": 5,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "At 5 o’clock."
						 },
						 {
								 "option_number": 3,
								 "option_text": "No, I don’t."
						 },
						 {
								 "option_number": 2,
								 "option_text": "I’m fine, thank you."
						 },
						 {
								 "option_number": 1,
								 "option_text": "Yes, please."
						 }
				 ]
		 },
		 {
				 "id": 2,
				 "level": "A1",
				 "question_text": "How do you introduce yourself?",
				 "correct_answer": 3,
				 "points": 5,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "It’s sunny today."
						 },
						 {
								 "option_number": 3,
								 "option_text": "My name is Anna."
						 },
						 {
								 "option_number": 2,
								 "option_text": "Good morning!"
						 },
						 {
								 "option_number": 1,
								 "option_text": "She is from Canada."
						 }
				 ]
		 },
		 {
				 "id": 3,
				 "level": "A2",
				 "question_text": "Where is the nearest bank?",
				 "correct_answer": 1,
				 "points": 5,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "It’s nearby."
						 },
						 {
								 "option_number": 3,
								 "option_text": "At the park."
						 },
						 {
								 "option_number": 2,
								 "option_text": "I am fine, thank you."
						 },
						 {
								 "option_number": 1,
								 "option_text": "Turn left at the corner."
						 }
				 ]
		 },
		 {
				 "id": 4,
				 "level": "A2",
				 "question_text": "I ___ reading a book.",
				 "correct_answer": 1,
				 "points": 5,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "does"
						 },
						 {
								 "option_number": 3,
								 "option_text": "is"
						 },
						 {
								 "option_number": 2,
								 "option_text": "was"
						 },
						 {
								 "option_number": 1,
								 "option_text": "am"
						 }
				 ]
		 },
		 {
				 "id": 5,
				 "level": "B1",
				 "question_text": "Choose the correct sentence:",
				 "correct_answer": 3,
				 "points": 10,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "She visits Paris last year."
						 },
						 {
								 "option_number": 3,
								 "option_text": "She visited Paris last year."
						 },
						 {
								 "option_number": 2,
								 "option_text": "She visiting Paris last year."
						 },
						 {
								 "option_number": 1,
								 "option_text": "She has visit Paris."
						 }
				 ]
		 },
		 {
				 "id": 6,
				 "level": "B1",
				 "question_text": "Which word fits best: He ___ the email to his boss this morning.",
				 "correct_answer": 1,
				 "points": 10,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "found"
						 },
						 {
								 "option_number": 3,
								 "option_text": "deleted"
						 },
						 {
								 "option_number": 2,
								 "option_text": "read"
						 },
						 {
								 "option_number": 1,
								 "option_text": "sent"
						 }
				 ]
		 },
		 {
				 "id": 7,
				 "level": "B2",
				 "question_text": "What does this mean: \"Innovative\"?",
				 "correct_answer": 1,
				 "points": 10,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "Difficult to understand"
						 },
						 {
								 "option_number": 3,
								 "option_text": "Traditional and old-fashioned"
						 },
						 {
								 "option_number": 2,
								 "option_text": "Bright and shiny"
						 },
						 {
								 "option_number": 1,
								 "option_text": "Creative and new"
						 }
				 ]
		 },
		 {
				 "id": 8,
				 "level": "B2",
				 "question_text": "Select the most contextually appropriate phrase to complete the sentence: The contract must be adhered to ______.",
				 "correct_answer": 1,
				 "points": 10,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "for the purpose of clarity."
						 },
						 {
								 "option_number": 3,
								 "option_text": "without further consultation."
						 },
						 {
								 "option_number": 2,
								 "option_text": "as a means of improving morale."
						 },
						 {
								 "option_number": 1,
								 "option_text": "in accordance with the terms outlined."
						 }
				 ]
		 },
		 {
				 "id": 9,
				 "level": "C1",
				 "question_text": "Which of these sentences uses proper grammar in a formal context?",
				 "correct_answer": 2,
				 "points": 15,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "Gonna head out now, see ya later!"
						 },
						 {
								 "option_number": 3,
								 "option_text": "Can you lend me a hand for a sec?"
						 },
						 {
								 "option_number": 2,
								 "option_text": "If I were there, I would’ve handled the situation differently."
						 },
						 {
								 "option_number": 1,
								 "option_text": "The data is incorrect, ain’t it?"
						 }
				 ]
		 },
		 {
				 "id": 10,
				 "level": "C2",
				 "question_text": "Choose the most accurate interpretation of the statement: The professor's groundbreaking research was hailed as a paradigm shift in the field.",
				 "correct_answer": 3,
				 "points": 20,
				 "createdAt": "2024-12-03T05:24:06.692Z",
				 "updatedAt": "2024-12-03T05:24:06.692Z",
				 "options": [
						 {
								 "option_number": 4,
								 "option_text": "The professor's findings were acknowledged but remained relatively unnoticed."
						 },
						 {
								 "option_number": 3,
								 "option_text": "The professor's research introduced a revolutionary perspective that redefined the field."
						 },
						 {
								 "option_number": 2,
								 "option_text": "The professor's work introduced a minor improvement in the field."
						 },
						 {
								 "option_number": 1,
								 "option_text": "The professor's work was criticized for its controversial conclusions."
						 }
				 ]
		 }
 ]
 */

