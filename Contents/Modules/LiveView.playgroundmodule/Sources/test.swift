// budget version control, working version of LiveViewController.swift
// import PlaygroundSupport
// import UIKit
// import SwiftUI
// import CoreGraphics
// import QuartzCore
// import Foundation

// // make an instance variable of GridView
// var GridButtonList : [GridSquare] = []

// class GridViewController : UIViewController {

//     override func loadView() {
//         super.loadView()
//     }

//     override func viewDidLoad() {
//         super.viewDidLoad()
        
//         self.view.frame = CGRect(x: 0, y: 0, width: 2000, height: 2000)
//         self.view.backgroundColor = UIColor.white
//         self.view.isMultipleTouchEnabled = true


//         let gview = GridView(frame: CGRect(x: 0, y: 0, width: 5000, height: 5000))
//         let curModePicker = ModePicker(frame: CGRect(x: 20, y: 60, width: 440, height: 75))
//         let colorPicker = ColorPickerView(frame: CGRect(x: 20, y: 140, width: 75, height: 500))
//         (curModePicker.subviews.first as! ColorPicker).tieView(colorPicker)
//         (curModePicker.subviews.last as! AddStartAlgo).tieGraph(gview.graph)
//         (curModePicker.subviews[1] as! ResetButton).linkList(graph: gview.graph as! GridGraph)

//         for i in colorPicker.subviews {
//             (i as! ColorOption).tieView(colorPicker)
//         }

//         self.view.addSubview(gview)
//         for button in (gview.graph as! GridGraph).buttons {
//             print("WHAT")
//             print(button.id as! Int, button.frame)
//         }

//         self.view.addSubview(curModePicker)
//         self.view.addSubview(colorPicker)

//         // var myGesture = UIPanGestureRecognizer(target: self, action: #selector(panDetected))
//         // myGesture.maximumNumberOfTouches = 1
//         // self.view.addGestureRecognizer(myGesture)
//     }

//     @IBAction func panDetected(_ sender : UIPanGestureRecognizer) {

//         switch boardState {
//             case .addingBlocks:
//                 var loc = sender.location(in: self.view) as CGPoint
//                 // improve this by not iterating over buttons, directly compute which button or do O(rows)
//                 GridButtonList.forEach { (button) in 
//                     if button.frame.contains(loc) && (button.vertex as! Vertex).isSink == false {
//                         (button.vertex as! Vertex).active = false
//                         button.setColor(UIColor(red: 128.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1.0))
//                     }
//                 }
//             case .removingBlocks:
//                 var loc = sender.location(in: self.view) as CGPoint
//                 // improve this by not iterating over buttons, directly compute which button or do O(rows)
//                 GridButtonList.forEach { (button) in 
//                     if button.frame.contains(loc) && (button.vertex as! Vertex).active == false {
//                         (button.vertex as! Vertex).active = true
//                         // button.setColor(UIColor(red: 128.0/256.0, green: 128.0/256.0, blue: 128.0/256.0, alpha: 1.0))
//                         button.setColor(.white)
//                     }
//                 }
//                 return
//             default:
//                 return
//         }
//     }

//     // dynamically change where the top left of the grid is 
//     func addBlocks(length l: Int = 50, rows r: Int = 15, cols c: Int = 15) {
//         for i in 0..<r {
//             for j in 0..<c {
//                 var temp = GridSquare(frame:CGRect(x: 10+j*l, y:200 + i*l, width: l, height: l))
//                 self.view.addSubview(temp)
//                 self.view.sendSubviewToBack(view.subviews.last!)
//                 GridButtonList.append(temp)
//                 // self.view.addSubview(GridSquare(frame: CGRect(x: 10 + j*l, y: 200 + i*l, width: l, height: l)))
//             }
//         } 
//     }

//     func addView(_ a: UIView) {
//         self.view.addSubview(a)
//     }
// }

// extension UIButton {
//     #if targetEnvironment(macCatalyst)
//     @objc(_focusRingType)
//     var focusRingType: UInt {
//         return 1 //NSFocusRingTypeNone
//     }
//     #endif
// }

// public func setUpLiveView() {
//     PlaygroundPage.current.setLiveView(GridViewController())
//     // (PlaygroundPage.current.liveView as! GridViewController).addBlocks()

//     // var graph = GridGraph(rows: 15, cols: 15)
//     // graph.buttons = GridButtonList
//     // graph.buttons.forEach { (button) in
//     //     button.vertex = graph.vertices[button.id as! Int]
//     // }

//     // graph.sources.append(25)
//     // graph.BFS()

//     // BFS(graph: graph)
//     print("Created View")
// }


