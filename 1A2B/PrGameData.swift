//
//  PrGameData.swift
//  Games
//
//  Created by 游宗諭 on 2018/12/21.
//  Copyright © 2018 游宗諭. All rights reserved.
//

import Foundation

protocol  GameData {
	var answer:String 		{get}
	var inputArray:[String] 	{get}
	var inputString:String	{get}
}

protocol Data1A2B:GameData {
	var status:(A:Int,B:Int) 	{get}
	var answerSet:LazyCollection<(ClosedRange<Int>)> {get}
}
