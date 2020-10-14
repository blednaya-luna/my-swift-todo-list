//
//  ContentView.swift
//  TodoList
//
//  Created by Blednaya Luna on 14.10.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var todoStore = TodoStore()
    @State var newTodo: String = ""
    
    func addTodo() {
        // TODO add auto generated id
        todoStore.todos.append(Todo(id: String(todoStore.todos.count + 1), title: newTodo))
        self.newTodo = ""
    }
    
    func moveTodo(from source : IndexSet, to destination : Int) {
        todoStore.todos.move(fromOffsets: source, toOffset: destination)
    }
    
    func deleteTodo(at offsets: IndexSet) {
        todoStore.todos.remove(atOffsets: offsets)
    }
    
    var addNewTodoBar: some View {
        HStack {
            TextField("Enter in a new todo", text: self.$newTodo)
            Button(action: self.addTodo, label: {
                Text("Add new")
            })
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                addNewTodoBar
                    .padding()
                List() {
                    ForEach(self.todoStore.todos) { todo in
                        Text(todo.title)
                    }
                    .onMove(perform: self.moveTodo)
                    .onDelete(perform: self.deleteTodo)
                }
                .navigationTitle("TODO")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
}
