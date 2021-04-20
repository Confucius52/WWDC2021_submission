import PlaygroundSupport
import UIKit
import SwiftUI
import CoreGraphics
import QuartzCore
import Foundation

// make an instance variable of GridView
var GridButtonList : [GridSquare] = []

class GridViewController : UIViewController {

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect(x: 0, y: 0, width: 2000, height: 2000)
        self.view.backgroundColor = UIColor.white
        self.view.isMultipleTouchEnabled = true


        let gview = GridView(frame: CGRect(x: 0, y: 0, width: 5000, height: 5000))
        let curModePicker = ModePicker(frame: CGRect(x: 20, y: 60, width: 440, height: 75))
        let colorPicker = ColorPickerView(frame: CGRect(x: 20, y: 140, width: 75, height: 500))
        (curModePicker.subviews.first as! ColorPicker).tieView(colorPicker)
        (curModePicker.subviews.last as! AddStartAlgo).tieGraph(gview.graph)
        (curModePicker.subviews[1] as! ResetButton).linkList(graph: gview.graph as! GridGraph)

        for i in colorPicker.subviews {
            (i as! ColorOption).tieView(colorPicker)
        }

        self.view.addSubview(gview)
        self.view.addSubview(curModePicker)
        self.view.addSubview(colorPicker)
    }

    func addView(_ a: UIView) {
        self.view.addSubview(a)
    }
}

extension UIButton {
    #if targetEnvironment(macCatalyst)
    @objc(_focusRingType)
    var focusRingType: UInt {
        return 1 //NSFocusRingTypeNone
    }
    #endif
}

public func setUpLiveView() {
    PlaygroundPage.current.setLiveView(GridViewController())
    // (PlaygroundPage.current.liveView as! GridViewController).addBlocks()

    // var graph = GridGraph(rows: 15, cols: 15)
    // graph.buttons = GridButtonList
    // graph.buttons.forEach { (button) in
    //     button.vertex = graph.vertices[button.id as! Int]
    // }

    // graph.sources.append(25)
    // graph.BFS()

    // BFS(graph: graph)
    print("Created View")
}

