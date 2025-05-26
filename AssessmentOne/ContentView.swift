//
//  ContentView.swift
//  AssessmentOne
//
//  Created by Pushpendra on 26/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    @State private var result: String = ""
    @State private var isValid: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("🧩 Valid Parentheses Checker")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            TextField("Enter brackets like ()[]{}", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .autocapitalization(.none)

            Button(action: {
                self.isValid = isValid(input)
                result = isValid == true ? "✅ Valid" : "❌ Invalid"
            }) {
                Text("Validate")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            if !result.isEmpty {
                Text(result)
                    .font(.headline)
                    .foregroundColor(isValid == true ? .green : .red)
                    .padding(.top)
            }

            Spacer()
        }
        .padding()
    }
    
    private func isValid(_ input : String) -> Bool {
        if input.isEmpty {
            return false
        }
        let matching : [Character : Character] = [")" : "(", "]" : "[", "}": "{"]
        var stack : [Character] = []
        
        for char in input {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else if let match = matching[char] {
                if stack.isEmpty || stack.removeLast() != match {
                    return false
                }
            } else {
                return false
            }
        }
        return stack.isEmpty
    }

}


#Preview {
    ContentView()
}
