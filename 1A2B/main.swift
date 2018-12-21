//
//  main.swift
//  1A2B
//
//  Created by 游宗諭 on 2018/12/21.
//  Copyright © 2018 游宗諭. All rights reserved.
//

import Foundation


func getString()             -> String {
	
	let keyboard = FileHandle.standardInput
	let inputData = keyboard.availableData
	let strData = String(data: inputData, encoding: String.Encoding.utf8)!
	return strData.trimmingCharacters(in: CharacterSet.newlines)
}
func getString(_ str:String) -> String {
	print(str, separator: "",terminator: "")
	let keyboard = FileHandle.standardInput
	let inputData = keyboard.availableData
	let strData = String(data: inputData, encoding: String.Encoding.utf8)!
	return strData.trimmingCharacters(in: CharacterSet.newlines)
}

var input = String()

func isValid(_ input:String) -> Bool {
		for char in input{
			guard let _ = Int(String(char)) else {return false}
		}
	return Set(input).count == 4
}











let answerSet = (0...9).lazy
var answer:String = ""

while answer.count < 4{
	var isOK = true
	let tmp = answerSet.randomElement() ?? 0
	for i in answer{
		if String(i) == String(tmp) {isOK = false}
	}
	if isOK {	answer += String(tmp)}
}





print("1A2B Game:\n",answer)
var status:(A:Int,B:Int) = (0,0)

while true{
	if status.A == 4{ print("You Win! the answer is", answer)
		break
	}
	input = getString("Guess: ")
	if !isValid(input)
	{
		
		continue
	}
	status = (0,0)
	let inputArray = Array(input)
	for i in 0...3
	{
		for j in 0...3
		{
			if inputArray[i] == Array(answer)[j] {
				if i == j {status.A += 1}
				else {status.B += 1}
			}
		}
	}
	for _ in 1...4
	{
		print(".",separator: "",terminator: "")
		sleep(1)
	}
	print(status.A,"A",status.B,"B", separator: "", terminator: "\n")
}
//for i in 1...4
//{
//	print(".",separator: "",terminator: "")
//	sleep(1)
//}
sleep(3)
print("Thank you for playing")



