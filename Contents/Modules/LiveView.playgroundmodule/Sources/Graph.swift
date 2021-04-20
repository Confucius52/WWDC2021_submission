import UIKit
import SwiftUI

class Vertex {
    var id: Int
    var row: Int?
    var col: Int?
    var active: Bool = true // "active" in the graph 
    var visited: Bool = false
    var isSource: Bool = false
    var isSink: Bool = false
    var adj: [Int] = []
    
    init(id: Int) {
        self.id = id 
    }

    init(id: Int, row: Int, col: Int) {
        self.id = id
        self.row = row
        self.col = col
    }

    func visit() {
        self.visited = true
    }
}

class GridGraph {
    
    static let directions: [(Int, Int)] = [(0,1), (0,-1), (1,0), (-1,0)]
    
    var vertices: [Vertex] = [] 
    var numVertices = 0
    var buttons: [GridSquare] = []
    var sources: [Int] = []
    var sink: [Int] = []

    init() {}
    
    init(rows r: Int, cols c: Int) {
        for i in 0..<r {
            for j in 0..<c {
                self.vertices.append(Vertex(id: self.numVertices, row: i, col: j))
                
                for (dx,dy) in GridGraph.directions {
                    if 0..<c ~= (j+dx) && 0..<r  ~= (i+dy) { 
                        (self.vertices.last as! Vertex).adj.append((i+dy)*c + j+dx) 
                    }
                }

                self.numVertices += 1
            }
        }     
    }

    func visit(id: Int) {
        self.vertices[id].visit() 
    }

    func visited(id: Int) -> Bool {
        return (self.vertices[id] as! Vertex).visited
    }

    func active(id: Int) -> Bool {
        return (self.vertices[id] as! Vertex).active
    }

    @IBAction func reset(sender: UIButton, forEvent event: UIEvent) {
        for button in self.buttons {
            (button.vertex as! Vertex).visited = false
            (button.vertex as! Vertex).active = true
            (button.vertex as! Vertex).isSink = false 
            (button.vertex as! Vertex).isSource = false 
            button.setColor(.white)
        }
        boardState = .addingBlocks
        self.sources = []
    }
}

