import UIKit
import SwiftUI
import SpriteKit
import CoreGraphics
import QuartzCore

class ModePicker : UIView {
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray
        self.backgroundColor = UIColor(red: 200.0/256.0, green: 200.0/256.0, blue: 200.0/256.0, alpha: 1.0)
        self.layer.cornerRadius = 10

        self.setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
    }

    private func setUpView() {
        self.addSubview(ColorPicker(frame: CGRect(x: 15, y: 13, width: 50, height: 50)))
        self.addSubview(ResetButton(frame: CGRect(x: 15 + 60, y: 13, width: 50, height: 50)))
        self.addSubview(AddBlockButton(frame: CGRect(x: 15 + 60*2, y: 13, width: 50, height: 50)))
        self.addSubview(RemoveBlockButton(frame: CGRect(x: 15 + 60*3, y: 13, width: 50, height: 50)))
        self.addSubview(AddStart(frame: CGRect(x: 15 + 60*4, y: 13, width: 50, height: 50)))
        self.addSubview(AddDestination(frame: CGRect(x: 15 + 60*5, y: 13, width: 50, height: 50)))
        self.addSubview(AddStartAlgo(frame: CGRect(x: 15 + 60*6, y: 13, width: 50, height: 50)))
    }
}

class AddBlockButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "standard brick.png"), for: UIControl.State.normal)
        self.addTarget(self, action: #selector(toggleMode), for: .touchDown)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func toggleMode(sender: UIButton, forEvent event: UIEvent) {
        boardState = .addingBlocks
    }
}

class RemoveBlockButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "standard delete button.png"), for: UIControl.State.normal)
        self.addTarget(self, action: #selector(toggleMode), for: .touchDown)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func toggleMode(sender: UIButton, forEvent event: UIEvent) {
        boardState = .removingBlocks
    }
}

class AddStartAlgo : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "standard begin.png"), for: UIControl.State.normal)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func tieGraph(_ graph : GridGraph?) {
        self.addTarget(graph, action: #selector(GridGraph.BFS), for: .touchDown)
        // switch file {
        //     case BFS:
        //         self.addTarget(graph, action: #selector(GridGraph.BFS), for: .touchDown)
        //     case FF:
        //         self.addTarget(graph, action: #selector(GridGraph.FloodFill), for: .touchDown)
        //     default:
        //         return
        // }
    }
}

class AddStart : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "standard start.png"), for: UIControl.State.normal)
        self.addTarget(self, action: #selector(toggleMode), for: .touchDown)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func toggleMode(sender: UIButton, forEvent event: UIEvent) {
        boardState = .addingStarts
    }
}

class AddDestination : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "standard destination.png"), for: UIControl.State.normal)
        self.addTarget(self, action: #selector(toggleMode), for: .touchDown)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func toggleMode(sender: UIButton, forEvent event: UIEvent) {
        boardState = .addingDestinations
    }
}

class ColorPicker : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "Even Better Color Wheel.png"), for: UIControl.State.normal)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setUpView() {}

    func tieView(_ view : ColorPickerView) {
        self.addTarget(view, action: #selector(ColorPickerView.toggle), for: .touchDown)
    }
}

class ResetButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "standard reset arrow.png"), for: UIControl.State.normal)
        self.addTarget(self, action: #selector(resetBoard), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func linkList(graph: GridGraph) {
        self.addTarget(graph, action: #selector(GridGraph.reset), for: .touchDown)
    }

    @IBAction func resetBoard(sender: UIButton, forEvent event: UIEvent) {
        if boardState == .drawing {
            return
        }

        ResetButton.animate(withDuration: 0.25, animations: { () -> Void in 
            self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        })

        ResetButton.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
            self.transform = self.transform.rotated(by: CGFloat.pi)
        }, completion: { completed in 
            delay (1) {
                self.transform = CGAffineTransform(rotationAngle: 0.0) 
            }
        })


        boardState = .addingBlocks

        print("pressed reset")
    }
}
