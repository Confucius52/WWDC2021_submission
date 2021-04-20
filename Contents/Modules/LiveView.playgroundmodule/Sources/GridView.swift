import UIKit
import SwiftUI

class GridView : UIView {

    static var numSquares: Int = 0
    var ButtonList: [GridSquare] = []
    var graph: GridGraph?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.graph = GridGraph(rows: defaultRows, cols: defaultCols)
        self.addBlocks()
        (self.graph as! GridGraph).buttons = self.ButtonList

        for i in 0..<ButtonList.count {
            ButtonList[i].vertex = (self.graph as! GridGraph).vertices[i]
        }

        var myGesture = UIPanGestureRecognizer(target: self, action: #selector(panDetected))
        myGesture.maximumNumberOfTouches = 1
        self.addGestureRecognizer(myGesture)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func addSquare(length l: Int = defaultLength, x xpos: Int, y ypos: Int) {
        var newSquare: GridSquare = GridSquare(frame: CGRect(x: xpos, y: ypos, width: l, height: l), id: GridView.numSquares)
        GridView.numSquares += 1
        ButtonList.append(newSquare)
        self.addSubview(newSquare)
    }

    func addBlocks(length l: Int = defaultLength, rows r: Int = defaultRows, cols c: Int = defaultCols) {
        for i in 0..<r {
            for j in 0..<c {
                self.addSquare(length: l, x: 10 + j*l, y: 200 + i*l)
            }
        } 
    }

    @IBAction func panDetected(_ sender : UIPanGestureRecognizer) {
        var loc = sender.location(in: self) as CGPoint
        switch boardState {
            case .addingBlocks:
                self.ButtonList.forEach { (button) in 
                    if button.frame.contains(loc) && (self.graph as! GridGraph).vertices[button.id as! Int].isSink == false && 
                    (self.graph as! GridGraph).vertices[button.id as! Int].isSource == false {
                        (self.graph as! GridGraph).vertices[button.id as! Int].active = false
                        // (button.vertex as! Vertex).active = false
                        button.setColor(UIColor(red: 128.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1.0))
                    }
                }
            case .removingBlocks:
                self.ButtonList.forEach { (button) in 
                    if button.frame.contains(loc) && (self.graph as! GridGraph).vertices[button.id as! Int].isSource == false && 
                    (self.graph as! GridGraph).vertices[button.id as! Int].isSink == false && 
                    (self.graph as! GridGraph).vertices[button.id as! Int].active == false {
                        (self.graph as! GridGraph).vertices[button.id as! Int].active = true
                        // button.setColor(UIColor(red: 128.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1.0))
                        button.setColor(.white)
                    }
                }
                return
            default:
                return
        }
    }

    private func setUpView() {}
}


class GridSquare : UIButton {
    // move numSqures to GridView 
    static var numSquares: Int = 0
    var id: Int?
    var vertex: Vertex?

    init (frame: CGRect, id: Int) {
        super.init(frame: frame)
        self.id = id
        self.setUpView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // move to GridView
        self.id = GridSquare.numSquares
        GridSquare.numSquares += 1
        self.setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
    }

    func setColor(_ c: UIColor) {
        self.backgroundColor = c 
    }

    override func draw(_ rect: CGRect) { }

    @IBAction func toggleButton(sender: UIButton, forEvent event: UIEvent) {
        print("pressed")
        // self.backgroundColor = .black
        if boardState == .addingStarts {
            let cur = (self.vertex as! Vertex)
            cur.isSource = true
            self.backgroundColor = .systemGreen            
        } else if boardState == .addingDestinations {
            let cur = (self.vertex as! Vertex)
            cur.isSink = true
            self.backgroundColor = .systemRed
        }
    }

    private func setUpView() {
        self.layer.borderWidth = 1 
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderColor = CGColor(red: 158.0/255.0, green: 158.0/255.0, blue: 158.0/255.0, alpha: 1.0)

        self.addTarget(self, action: #selector(toggleButton), for: .touchDown)
    }
}
