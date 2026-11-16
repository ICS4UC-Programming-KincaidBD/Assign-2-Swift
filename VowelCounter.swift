// import statements
import Foundation

// Function to count vowels in a file, it uses an Array set to Character type to store every character in the text given.
func countVowels(fileName: String) -> [Character] {

    // Create two Arrays, one for all characters and one for vowels
    var characterList: [Character] = []
    var vowelList: [Character] = []

    // try to read file, if it fails, print error message and return empty vowelList
    do {
        // Read the file contents inside do-catch block to catch if the file doesn't exist or is unreadable to the computer
        let content = try String(contentsOfFile: fileName, encoding: .utf8)
        let lines = content.components(separatedBy: .newlines)

        // for each line in the file
        for line in lines {
            // it adds every character in the line to the characterList Array
            for char in line {
                characterList.append(char)
            }
        }

    } catch {
        print("Error reading file.") // print error message if file cannot be read
        return vowelList // returns just the list of all vowels found in the file, which will be empty if the file cannot be read
    }

    // Loop through the characterList and check if each character is a vowel, if it is, add it to the vowelList
    for i in 0..<characterList.count {
        let character = characterList[i].lowercased()

        // if statement checking if the character is a vowel
        if character == "a" || character == "e" || character == "i" || character == "o" || character == "u" {
            // adds the vowel to the vowel list
            vowelList.append(characterList[i])
        }
    }

    return vowelList
}

func outputVowels(vowels: [Character], fileName: String) {
    // write the number of vowels found in the file to the output file
    do {
        // format the output string
        let outputString = "Number of vowels in \(fileName): \(vowels.count)\n"
        // write the number of vowels found in the file to the output file
        try outputString.write(toFile: fileName, atomically: true, encoding: .utf8)
    } catch {
        // print error message if file cannot be written to
        print("Error writing to output file.")
    }
}

// Main execution to call the countVowels function and write the number of vowels found in the file
// call upon the countVowels function and store the result in an Array of Characters
let vowels = countVowels(fileName: "/home/vscode/ICS4UC/Assign/Assign-02/Assign-2-Swift/File.txt")
// call the outputVowels function to write the number of vowels found in the file to the output file
outputVowels(vowels: vowels, fileName: "/home/vscode/ICS4UC/Assign/Assign-02/Assign-2-Swift/output.txt")