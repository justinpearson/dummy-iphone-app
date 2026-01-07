//
//  ContentView.swift
//  DummyTodoApp
//
//  Created by Justin Pearson on 1/7/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TodoItem.createdAt, order: .reverse) private var todos: [TodoItem]
    @State private var newTodoTitle = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("New todo...", text: $newTodoTitle)
                        .textFieldStyle(.roundedBorder)
                    Button(action: addTodo) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                    .disabled(newTodoTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()

                List {
                    ForEach(todos) { todo in
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(todo.isCompleted ? .green : .gray)
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                                .foregroundStyle(todo.isCompleted ? .secondary : .primary)
                        }
                    }
                    .onDelete(perform: deleteTodos)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Todos")
        }
    }

    private func addTodo() {
        let trimmedTitle = newTodoTitle.trimmingCharacters(in: .whitespaces)
        guard !trimmedTitle.isEmpty else { return }
        let todo = TodoItem(title: trimmedTitle)
        modelContext.insert(todo)
        newTodoTitle = ""
    }

    private func deleteTodos(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(todos[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
