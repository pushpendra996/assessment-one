//
//  ContentView.swift
//  AssessmentOne
//
//  Created by Pushpendra on 26/05/25.
//

import SwiftUI // Importing SwiftUI to build the UI components

// Main content view of the app
struct ContentView: View {
    
    // Holds the user's input string from the TextField
    @State private var input: String = ""
    
    // Stores the validation result as a message (e.g., "✅ Valid" or "❌ Invalid")
    @State private var result: String = ""
    
    // Keeps track of whether the input is valid or not for UI coloring
    @State private var isValid: Bool = false

    var body: some View {
        // Vertical layout to arrange elements with spacing between them
        VStack(spacing: 20) {
            
            // Title of the screen
            Text("🧩 Valid Parentheses Checker")
                .font(.largeTitle) // Makes it big
                .bold() // Makes it bold
                .padding(.top) // Adds space from the top of the screen

            // TextField for user to input brackets
            TextField("Enter brackets like ()[]{}", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // UI styling
                .padding(.horizontal) // Padding on left and right
                .autocapitalization(.none) // Avoids capital letters automatically

            // Validate button
            Button(action: {
                // Calls the isValid function with current input
                self.isValid = isValid(input)
                
                // Updates result string based on validity
                result = isValid == true ? "✅ Valid" : "❌ Invalid"
            }) {
                // Button label styling
                Text("Validate")
                    .padding() // Padding inside the button
                    .frame(maxWidth: .infinity) // Makes it full-width
                    .background(Color.blue) // Blue background
                    .foregroundColor(.white) // White text
                    .cornerRadius(10) // Rounded corners
            }
            .padding(.horizontal) // Horizontal padding for button

            // Show result only when it’s not empty
            if !result.isEmpty {
                Text(result)
                    .font(.headline) // Slightly smaller than title
                    .foregroundColor(isValid == true ? .green : .red) // Color based on result
                    .padding(.top) // Adds space from the button
            }

            Spacer() // Pushes content to the top
        }
        .padding() // Padding around the entire VStack
    }
    
    // MARK: - Validation Logic
    
    // Function to check if the input string has valid parentheses
    private func isValid(_ input : String) -> Bool {
        
        // If input is empty, we return false directly
        if input.isEmpty {
            return false
        }

        // Dictionary mapping closing brackets to their matching opening brackets
        let matching : [Character : Character] = [")" : "(", "]" : "[", "}": "{"]
        
        // Stack to keep track of opening brackets
        var stack : [Character] = []
        
        // Iterate over each character in the input string
        for char in input {
            
            // If it's an opening bracket, push it to the stack
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            
            // If it's a closing bracket
            } else if let match = matching[char] {
                
                // Check if stack is empty or top doesn't match the expected opening bracket
                if stack.isEmpty || stack.removeLast() != match {
                    return false // Mismatch found
                }
            
            // If character is not a bracket (unexpected character)
            } else {
                return false // Invalid input
            }
        }

        // If stack is empty, all brackets matched correctly
        return stack.isEmpty
    }

}

// Preview provider for Xcode canvas
#Preview {
    ContentView()
}
