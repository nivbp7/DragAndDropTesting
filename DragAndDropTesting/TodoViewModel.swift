//
//  TodoViewModel.swift
//  DragAndDropTesting
//
//  Created by niv ben-porath on 20/11/2023.
//

import Foundation

class TodoViewModel {

    internal init(reload: @escaping (() -> Void)) {
        self.reload = reload
    }    
    
    let reload: (() -> Void)
    
    private var todos = [1,2,3,4,5,6]
    
    func todo(at index: IndexPath) -> Int? {
        guard index.row < todos.count else {return nil}
        return todos[index.row]
    }
    
    func numberOfTodos() -> Int {
        return todos.count
    }
    
    func moveTodo(fromIndex sourceIndex: IndexPath, toIndex destinationIndex: IndexPath) {
        let moved = todos.remove(at: sourceIndex.row)
        todos.insert(moved, at: destinationIndex.row)
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.reload()
        }
        
    }
    
    func allTodos() -> [Int] {
        return todos
    }
    
}
