import UIKit

var paintColor: UIColor = UIColor(red: 155.0/255.0, green: 250.0/255.0, blue: 156.0/255.0, alpha: 1.0)
var boardState: State = .addingBlocks
public var file: File = .BFS

// default grid information
var defaultLength: Int = 25 
var defaultRows: Int = 30
var defaultCols: Int = 30

public enum State {
    case drawing
    case normal
    case addingBlocks
    case removingBlocks 
    case addingStarts
    case addingDestinations
}

public enum File {
    case BFS
    case FF
    case dijkstra

}
