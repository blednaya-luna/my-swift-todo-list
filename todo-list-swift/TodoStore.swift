//
//  TodoStore.swift
//  TodoList
//
//  Created by Blednaya Luna on 14.10.2020.
//

import Foundation

struct Todo: Identifiable {
    var id = String()
    var title = String()
    var isComplited = Bool(false);
}

class TodoStore: ObservableObject {
    @Published var todos = [Todo]()
}
