//
//  main.swift
//  A1KRUPA
//

import Foundation

// Array of 3 different English words
let words = ["ontario", "saskatchewan", "quebec"]

// Function to calculate the total number of chances
func calculateChances(for word: String) -> Int {
    var uniqueLetters = Set<Character>()
    for char in word {
        uniqueLetters.insert(char)
    }
    return uniqueLetters.count + 2
}

// Select a random word from the array as the secret word
let secretWord = words.randomElement()!

// Calculate the total number of chances
let totalChances = calculateChances(for: secretWord)

// Initialize the masked string as an array of underscores
var maskedString = Array(repeating: "_", count: secretWord.count)

// Initialize variables for tracking game state
var remainingChances = totalChances
var points = 0
var guessedLetters = Set<Character>()

print("Welcome to the Word Guessing Game!\n")
print("Your secret word has \(secretWord.count) letters.")
print("You have \(totalChances) chances to guess the word.\n")

// Main game loop
while remainingChances > 0 {
    // Display current state of masked string, remaining chances, and points
    print("Current state: \(maskedString.joined(separator: " "))\n")
    print("Remaining chances: \(remainingChances)")
    print("Points: \(points)")
    
    // Prompt user to guess a letter
    print("\nGuess a letter:")
    let guess = Character(readLine()!)
    
    // Check if the letter has already been guessed
    if guessedLetters.contains(guess) {
        print("\nYou already guessed that letter. Please try again.")
        continue
    }
    
    // Add guessed letter to set of guessed letters
    guessedLetters.insert(guess)
    
    // Check if the letter is in the secret word
    if secretWord.contains(guess) {
        // Update masked string with guessed letter in appropriate positions
        for (index, char) in secretWord.enumerated() {
            if char == guess {
                maskedString[index] = String(guess)
            }
        }
        // Award points and reduce remaining chances
        points += 10
        remainingChances -= 1
        // Check if the user has guessed the entire word
        if !maskedString.contains("_"){
                    points += 100
                    print("Congratulations! You guessed the word '\(secretWord)' and earned \(points) points!")
                    exit(0)
                }
                print("\nGood guess!\n")
            } else {
                // Deduct points and reduce remaining chances
                points -= 10
                remainingChances -= 1
                print("Sorry, that letter is not in the word.")
            }
        }
// Game over - display win/lose message, secret word, and total points
print("Game over!")

if !maskedString.contains("_"){
    print("\nCongratulations! You guessed the word '\(secretWord)' and earned \(points) points!")
} else {
    print("\nSorry, you ran out of chances. The secret word was '\(secretWord)'.")
}
print("\nTotal points: \(points)")
