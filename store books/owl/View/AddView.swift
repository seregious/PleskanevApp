//
//  AddView.swift
//  owl
//
//  Created by Сергей Иванчихин on 11.01.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewVodel : ListViewModel

    @State var titleText = ""
    @State var authorText = ""
    @State var alertTitle = "Please enter a book title 📕"
    @State var showAlert = false
    
    var body: some View {
            ScrollView {
                VStack {
                    Section (header: Text("Title")
                                .font(.title)
                                .fontWeight(.semibold)
                    ) {
                        TextField("enter new title", text: $titleText)
                            .foregroundColor(.black)
                            .padding()
                            .background(.ultraThickMaterial)
                            .cornerRadius(30)
                            .font(.body)
                    }
                    
                    Section (header: Text("Author")
                                .font(.title)
                                .fontWeight(.semibold)
                             
                    ) {
                        TextField("enter new author", text: $authorText)
                            .foregroundColor(.black)
                            .padding()
                            .background(.ultraThickMaterial)
                            .cornerRadius(30)
                            .font(.body)
                    }
                    
                    Button(action: {
                        saveButtonPressed()
                    }, label: {
                        Text("Save")
                            .modifier(standartButton())
                    }) .padding()
                }
                .padding()
            }
            .navigationTitle("Add book")
        
            
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    func saveButtonPressed() {
        if isTitleEntered() {
            listViewVodel.addItem(title: titleText, author: authorText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func isTitleEntered() -> Bool {
        if titleText.count == 0 {
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        } .environmentObject(ListViewModel())
            .accentColor(.white)
    }
}
