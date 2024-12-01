//
//  main.swift
//  AdventOfCode2024-01
//
//  Created by Pietro Rea on 12/1/24.
//

import Foundation

let currentDir = URL(fileURLWithPath: "/Users/pietrorea/data/aoc", isDirectory: true)
let inputFileUrl = currentDir.appendingPathComponent("2024-01.txt");

//Read everything into memory. Don't do this at home for large input.
let string = try! String(contentsOf: inputFileUrl, encoding: .utf8)
let lines = string.split(separator: "\n")

guard !lines.isEmpty else {
    print("The input file is empty.")
    exit(1)
}

var leftColumn = [Int]();
var rightColumn = [Int]();

// Parse into arrays
for line in lines {
    let numbers = line.split(separator: " ")
    guard numbers.count == 2 else {
        print("There are \(numbers.count) numbers in the line and there should be 2.")
        exit(1)
    }
    
    guard let leftInt = Int(numbers.first!),
          let rightInt = Int(numbers[1]) else {
        print("Cannot convert to an integer.")
        exit(1)
    }
    
    leftColumn.append(leftInt)
    rightColumn.append(rightInt)
}

// Sort
let sortedLeftColumn = leftColumn.sorted()
let sortedRightColumn = rightColumn.sorted()

guard sortedLeftColumn.count == sortedRightColumn.count else {
    print("The two columns should have the same number of elements.")
    exit(1)
}

// Find total absolute distance
var distanceAccumulator = 0;
for idx in 0...sortedLeftColumn.count - 1 {
    let distance = abs(sortedRightColumn[idx] - sortedLeftColumn[idx])
    distanceAccumulator += distance
}

print("Total distance: \(distanceAccumulator)")


