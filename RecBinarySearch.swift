//
// RecBinarySearch.swift
//
// Created by Ina Tolo
// Created on 2022-3-1
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The RecBinarySearch program implements an application that
// generates 250 random numbers in an array and allows the
// user to search the array for a number.

import Foundation

func binarySearch(userArray: [Int], userNumber: Int, lowIndex: Int, highIndex: Int) -> Int {
    // declaring variables
    var mid: Int = lowIndex + ((highIndex - lowIndex) / 2)

    if lowIndex > highIndex {
        return -1
    }

    if userArray[mid] == userNumber {
        return mid
    } else if userNumber < userArray[mid] {
        return binarySearch(userArray, userNumber, mid + 1, highIndex)
    } else {
        return binarySearch(userArray: userNumber, low, mid - 1)
    }
}

// stores exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that throws exception
func catchString() throws {
    throw MyError.runtimeError("This is not an integer!")
}

// main part of program

// declaring constants
let maxNum = 999
let minNum = 0
let arraySize = 250

// declaring variables
// var ranNum: Int = Int.random(in: minNum..<maxNum + minNum)
var randomNumberArray: [Int] = Array(count: arraySize)
var numberArray: [Int]
var searchNumber: Int
var searchResult: Int
var userNumString: String
var padded: String

print("Binary Search Program")
print()

do {
    // adding numbers to the array
    for counter in 1..<randomNumberArray.count {
        randomNumberArray[counter] = Int.random(in: minNum..<maxNum + minNum)
    }

    // sorting the array
    numberArray = randomNumberArray
    numberArray.sort()

    print()
    print("Sorted list of numbers:")
    print()

    for element in numberArray {
        // https://reactgo.com/swift-convert-int-string-leading-zeros/#:~:text=swift1min%20read,initializer.&text=Here%20is%20an%20example%2C%20that%20adds%20leading%200%20to%20the%201%20.&text=If%20you%20want%20to%20add,can%20do%20it%20like%20this.
        padded = String(format: "%02d", 1)
        print("\(padded) , ")
    }

    print()

    // getting input from the user
    print("What number are you searching for in the array (integer between 0 and 999):", terminator: "")
    userNumString = readLine()!
    print()

    searchNumber = Int(userNumString) ?? 0

    if searchNumber != Int(userNumString) {
        try catchString()
    }

    if searchNumber > maxNum || searchNumber < minNum {
        try catchString()
    } else {
        searchResult = binarySearch(userArray: numberArray, userNumber: searchNumber, lowIndex: 0, highIndex: numberArray.length - 1)
        print()
        print("Your number is in index: \(searchResult)")
    }
} catch MyError.runtimeError(let errorMessage) {
    print(errorMessage)
}