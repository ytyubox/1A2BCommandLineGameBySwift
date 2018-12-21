//
//  main.swift
//  1A2B
//
//  Created by 游宗諭 on 2018/12/21.
//  Copyright © 2018 游宗諭. All rights reserved.
//

import Foundation
enum Game:String {
	case exit
	case Game1A2B = "1A2B"
}

while true {
	print("Welecome!\n\tNow we have:\n\t1A2B")
	let input = GeneralFunc.getString("Please choose a game: ")
	var isTest = false
	let game = input.components(separatedBy: " ")
	if game.count == 2 && game[1].uppercased() == "TEST"  {
		isTest = true
		print("==========TEST MODE========")
	}
	switch game[0].uppercased(){
	case "EXIT":
		exit(0)
	case"1A2B":
		let _ = Game1A2B(isTest)
	default:
		continue
	}
	if isTest{
		print("=======TEST MODE END=======")
	}
}
