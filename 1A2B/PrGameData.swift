//
//  PrGameData.swift
//  Games
//
//  Created by 游宗諭 on 2018/12/21.
//  Copyright © 2018 游宗諭. All rights reserved.
//

import Foundation

///基本遊戲必備資料
protocol  GameData {
	///遊戲正確答案
	var answer:String 		{get}
	///STD1轉換成argv格式
	var inputArray:[String] 	{get}
	///STD1轉換成基本字串
	var inputString:String	{get}
}

///1A2B的必備資料
///TODO: setAnswer的Random seed
protocol Data1A2B:GameData {
	///儲存每次輸入的解答
	var status:(A:Int,B:Int) 	{get}
	///可將遊戲限制有效範圍，預設是0...9，可更動範圍是0...9
	var answerSet:LazyCollection<(ClosedRange<Int>)> {get}
	init(_ Devaloper:Bool,answerSet:LazyCollection<(ClosedRange<Int>)>)
	///遊戲多樣性的關鍵，尚未完成seed
	func setAnswer(answerSet:LazyCollection<(ClosedRange<Int>)>) -> String
	///判斷單筆輸入是否有效
	func isValid(_ input:String) -> Bool
	///遊戲重點，回傳AB對應的值
	func getAB(answer:String,input:String)->(A:Int,B:Int)
}
