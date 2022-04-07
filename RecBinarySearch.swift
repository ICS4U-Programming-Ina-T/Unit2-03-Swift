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
    let mid: Int = lowIndex + ((highIndex - lowIndex) / 2)

    if lowIndex > highIndex {
        return -1
    }

    // checks the index of where the user's number is
    if userArray[mid] == userNumber {
        return mid
    } else if userNumber < userArray[mid] {
        return binarySearch(userArray: userArray, userNumber: userNumber, lowIndex: lowIndex, highIndex: mid - 1)
    } else {
        return binarySearch(userArray: userArray, userNumber: userNumber, lowIndex: mid + 1, highIndex: highIndex)
    }
}

// stores exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that throws exception
func catchString() throws {
    throw MyError.runtimeError("ERROR: Invalid Input")
}

// declaring constants
let maxNum = 999
let minNum = 0
let arraySize = 250

// declaring variables
var randomNumberArray: [Int] = [Int](repeating: 0, count: arraySize)
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

    // adds extra zero(s) to beginning of non 3 digit numbers
    for element in numberArray {
        padded = String(format: "%03d", element)
        print("\(padded), ", terminator: "")
    }

    print()
    print()

    // getting input from the user
    print("What number are you searching for in the array (integer between 0 and 999): ", terminator: "")
    userNumString = readLine()!
    print()

    searchNumber = Int(userNumString) ?? 0

    if searchNumber != Int(userNumString) {
        try catchString()
    }

    // // ensuring the user inputs an appropriate integer
    if searchNumber > maxNum || searchNumber < minNum {
        try catchString()
    } else {
        searchResult =
            binarySearch(userArray: numberArray,
                userNumber: searchNumber, lowIndex: 0, highIndex: numberArray.count - 1)

        // outputting the results of the search
        if searchResult == -1 {
            print("Value does not exist in the array.")
        } else {
            print("Your number is in index: \(searchResult)")
        }
    }
} catch MyError.runtimeError(let errorMessage) {
    print(errorMessage)
}
