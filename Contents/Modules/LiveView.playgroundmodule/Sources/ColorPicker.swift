import UIKit
import SwiftUI

class ColorPickerView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 200.0/256.0, green: 200.0/256.0, blue: 200.0/256.0, alpha: 1.0)
        self.layer.cornerRadius = 10
        self.isHidden = true
        self.setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
    }

    private func setUpView() {
        self.addSubview(ColorOption(frame: CGRect(x: 13, y: 15, width: 50, height: 50), color: UIColor(red: 252.0/255.0, green: 13.0/255.0, blue: 27.0/255.0, alpha: 1.0)))
        self.addSubview(ColorOption(frame: CGRect(x: 13, y: 15+60, width: 50, height: 50), color: UIColor(red: 253.0/255.0, green: 153.0/255.0, blue: 39.0/255.0, alpha: 1.0)))
        self.addSubview(ColorOption(frame: CGRect(x: 13, y: 15+60*2, width: 50, height: 50), color: UIColor(red: 255.0/255.0, green: 253.0/255.0, blue: 56.0/255.0, alpha: 1.0)))
        self.addSubview(ColorOption(frame: CGRect(x: 13, y: 15+60*3, width: 50, height: 50), color: UIColor(red: 41.0/255.0, green: 253.0/255.0, blue: 47.0/255.0, alpha: 1.0)))
        self.addSubview(ColorOption(frame: CGRect(x: 13, y: 15+60*4, width: 50, height: 50), color: UIColor(red: 45.0/255.0, green: 255.0/255.0, blue: 254.0/255.0, alpha: 1.0)))
        self.addSubview(ColorOption(frame: CGRect(x: 13, y: 15+60*5, width: 50, height: 50), color: UIColor(red: 11.0/255.0, green: 36.0/255.0, blue: 251.0/255.0, alpha: 1.0)))
        self.addSubview(ColorOption(frame: CGRect(x: 13, y: 15+60*6, width: 50, height: 50), color: UIColor(red: 152.0/255.0, green: 37.0/255.0, blue: 251.0/255.0, alpha: 1.0)))
        self.addSubview(ColorOption(frame: CGRect(x: 13, y: 15+60*7, width: 50, height: 50), color: UIColor(red: 253.0/255.0, green: 40.0/255.0, blue: 252.0/255.0, alpha: 1.0)))
    }

    @IBAction func toggle() {
        self.isHidden = !self.isHidden
    }
}

class ColorOption : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }

    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = color
        self.setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
    }

    private func setUpView() {
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.addTarget(self, action: #selector(changeColor), for: .touchDown)
    }

    func tieView(_ view : ColorPickerView) {
        self.addTarget(view, action: #selector(ColorPickerView.toggle), for: .touchDown)
    }

    @IBAction func changeColor(sender: UIButton, forEvent event: UIEvent) {
        paintColor = self.backgroundColor as! UIColor
    }
}
