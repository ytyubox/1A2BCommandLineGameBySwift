//
//  GeneralFunc.swift
//  1A2B
//
//  Created by 游宗諭 on 2018/12/21.
//  Copyright © 2018 游宗諭. All rights reserved.
//

import Foundation



class GeneralFunc {
	static var keyboard = FileHandle.standardInput
	///取得STD1的資料，str為提示字串，打印之後不換行
	/// - Parameter str: 提示字串，打印之後不換行
	static func  getString(_ str:String) -> String {
		print(str, separator: "",terminator: "")
		let inputData = keyboard.availableData
		let strData = String(data: inputData, encoding: String.Encoding.utf8)!
		return strData.trimmingCharacters(in: CharacterSet.newlines)
	}
	
	///取得STD1的資料，str為提示字串，打印之後不換行
	/// - Parameter str: 提示字串，打印之後不換行
	static func printInTime(texts:String...,count:UInt,newline:Bool = false,interval:UInt32 = 1){
		for _ in 0..<count{
			for text in texts
			{
				print(text, separator: "", terminator: "")
				if texts.count < 2 {continue}
				sleep(interval)
			}
			if texts.count < 2 { sleep(interval) }
		}
		if newline {print()}
	}
	
	static
		func GetKeyPress () -> Int
	{
		var key: Int = 0
		var c: cc_t = 0
		var cct = (c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c) // Set of 20 Special Characters
		var oldt: termios = termios(c_iflag: 0, c_oflag: 0, c_cflag: 0, c_lflag: 0, c_cc: cct, c_ispeed: 0, c_ospeed: 0)
		
		tcgetattr(STDIN_FILENO, &oldt) // 1473
		var newt = oldt
		newt.c_lflag = 1217  // Reset ICANON and Echo off
		tcsetattr( STDIN_FILENO, TCSANOW, &newt)
		key = Int(getchar())  // works like "getch()"
		tcsetattr( STDIN_FILENO, TCSANOW, &oldt)
		return key
	}
}
