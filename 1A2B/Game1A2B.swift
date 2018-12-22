//
//  Game1A2B.swift
//  1A2B
//
//  Created by 游宗諭 on 2018/12/21.
//  Copyright © 2018 游宗諭. All rights reserved.
//

import Foundation

///TODO: 將Ｐ和Ｆ不可被外界呼叫
class Game1A2B:Pr_Data1A2B {
	var openString: String = """
	 __          ___  ____
	/_ |   /\\   |__ \\|  _ \\
	 | |  /  \\     ) | |_) |
	 | | / /\\ \\   / /|  _ <
	 | |/ ____ \\ / /_| |_) |
	 |_/_/    \\_\\____|____/
	"""
	
	
	var inputArray: [String] = []
	var inputString = String()
	var status:(A:Int,B:Int) = (0,0)
	let answerSet = (0...9).lazy
	var answer = String()
	
	func isValid(_ input:String) -> Bool {
		for char in input { guard let _ = Int(String(char)) else {return false}
		}
		return Set(input).count == 4
	}
	
	func getAB(answer:String,input:String)->(A:Int,B:Int){
		var A = 0, B = 0
		for i in 0...3{
			for j in 0...3{
				if Array(input)[i] == Array(answer)[j] {
					if i == j {A += 1} else {B += 1}
				}
			}
		}
		return (A,B)
	}
	
	func setAnswer(answerSet:LazyCollection<(ClosedRange<Int>)>) -> String {
		let range = (0...9).lazy
		return Array(range).shuffled()[0...3].map {String($0)}.joined(separator: "")

	}
	
	func printGameOver(isFinish:Bool = true) {
		if isFinish{ print("Thank you for playing 1A2B..",separator: "",terminator: "")
			GeneralFunc.printInTime(texts: ".", count: 3,newline: true)
		}
		print("Press any key to continue...", separator: "", terminator: "")
		let _ = GeneralFunc.GetKeyPress()
		print()
	}
	
	required init(_ Devaloper:Bool = false,answerSet:LazyCollection<(ClosedRange<Int>)> = (0...9).lazy)
	{
		answer = setAnswer(answerSet: answerSet)
		print(openString)
		print("1A2B Game:\n")
		if Devaloper {print(answer)}
		while true
		{
			if status.A == 4{ print("You Win! the answer is", answer)
				break
			}
			inputString = GeneralFunc.getString("Guess: ").components(separatedBy: " ")[0]
			if inputString.uppercased() == "EXIT" {
				printGameOver(isFinish: false)
				return
			}
			if !isValid(inputString){
				print("Need 4 unique digits")
				continue
			}
			status = getAB(answer: answer, input: inputString)
			GeneralFunc.printInTime(texts: "\(status.A)A","\(status.B)B", count: 1, newline: true, interval: 1)
		}
		printGameOver()
	}
}
