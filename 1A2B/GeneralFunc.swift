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
	
	static func  getString(_ str:String) -> String {
		print(str, separator: "",terminator: "")
		let inputData = keyboard.availableData
		let strData = String(data: inputData, encoding: String.Encoding.utf8)!
		return strData.trimmingCharacters(in: CharacterSet.newlines)
	}
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

}
