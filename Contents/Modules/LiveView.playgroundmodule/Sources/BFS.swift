import UIKit
import Foundation
import SwiftUI
import SpriteKit

class Queue<T> {
    private var elems: [T] = []

    var isEmpty: Bool {
        get { return self.elems.isEmpty }
    } 

    var front: T {
        get { return self.elems.first! }
    }

    init() {}

    func push(_ item: T) {
        self.elems.append(item)
    }

    func pop() {
        self.elems.remove(at: 0) 
    }

    func pop_front() -> T {
        self.pop()
        return self.front
    }
}

func delay(_ seconds: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}

func paintSquares(toUpdate: [GridSquare], i idx: Int = 0) {
    boardState = .drawing
    if idx < toUpdate.count {
        delay(0.02) {
            if ((toUpdate[idx] as! GridSquare).vertex as! Vertex).isSource == false {
                (toUpdate[idx] as! GridSquare).setColor(paintColor)
            }
            paintSquares(toUpdate: toUpdate, i: idx + 1)
        }
    } else {
        boardState = .addingBlocks
    }
}

extension GridGraph {
    @IBAction func BFS() {
        var queue = Queue<Vertex>()

        for vertex in self.vertices {
            if vertex.isSource == true {
                self.sources.append(vertex.id)
            }
        }

        for s in self.sources {
            queue.push(self.vertices[s]) 
        }

        var toUpdate : [GridSquare] = []

        while !queue.isEmpty {
            let cur: Vertex = queue.front
            queue.pop()

            if cur.isSink == true {
                break
            }

            if self.visited(id: cur.id) { continue }

            self.visit(id: cur.id)
            toUpdate.append(self.buttons[cur.id])

            for id in cur.adj {
                if !self.visited(id: id) && self.vertices[id].active == true {
                    queue.push(self.vertices[id])
                }   
            }
        }

        if toUpdate.count == 0{
            return
        }
        paintSquares(toUpdate: toUpdate)
    }
}
