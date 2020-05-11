//
//  ContentView.swift
//  ToDoApp
//
//  Created by user174672 on 5/11/20.
//  Copyright © 2020 Iuga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext)var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    @State private var newTodoItem=""
    
    var body: some View {
        NavigationView{
            List{
                Section(){
                    HStack{
                        TextField("Sarcina noua",text:self.$newTodoItem)
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newTodoItem
                            toDoItem.createdAt=Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            self.newTodoItem=""
                            }){
                            Image(systemName: "plus.circle.fill").foregroundColor(.green).imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header:Text("Sarcini")){
                    ForEach(self.toDoItems){
                        toDoItem in
                        ToDoItemView(title: toDoItem.title!, createdAt: "\(toDoItem.createdAt!)")
                    }.onDelete{
                        indexSet in let deleteItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                }
            }.navigationBarTitle(Text("Lista de sarcini"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
