//
//  GameControlView.swift
//  tapGame
//
//  Created by Павел Гришутенко on 23.10.2021.
//

import UIKit

@IBDesignable
class GameControlView: UIView {
    
    private let timeLabel = UILabel()
    private let stepper = UIStepper()
    private let actionButton = UIButton()
    @IBInspectable var gameTimeLeft: Double = 5 {
        didSet {
            updateUI()
        }
    }
    @IBInspectable var isGameActive: Bool = false {
        didSet {
            updateUI()
        }
    }
    @IBInspectable var gameDuration: Double {
        get {
            return stepper.value
        }
        set {
            stepper.value = newValue
            updateUI()
        }
    }
    var  startStopHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override var intrinsicContentSize: CGSize {
        let timeLabelSize = timeLabel.intrinsicContentSize
        let stepperSize = stepper.intrinsicContentSize
        let buttonSize = actionButton.intrinsicContentSize
        
        let width = timeLabelSize.width + timeToStepperMargin + stepperSize.width
        let height = stepperSize.height + actionButtonTopMargin + buttonSize.height
        return CGSize(width: width, height: height)
    }
    
    @objc func stepperChanged() {
        updateUI()
    }
    
    @objc func actionButtonTapped( ) {
        startStopHandler?()
    }
    
    private let timeToStepperMargin: CGFloat = 8
    private let actionButtonTopMargin: CGFloat = 8
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let stepperSize = stepper.intrinsicContentSize
        stepper.frame = CGRect(
            origin: CGPoint(
                x: bounds.maxX - stepperSize.width,
                y: bounds.minY),
            size: stepperSize)
        
        let timeLabelSize = timeLabel.intrinsicContentSize
        timeLabel.frame = CGRect(
            origin: CGPoint(
                x: bounds.minX,
                y: bounds.minY + (stepperSize.height - timeLabelSize.height) / 2 ),
            size: timeLabelSize)
        
        let buttonSize = actionButton.intrinsicContentSize
        actionButton.frame = CGRect(
            origin: CGPoint(
                x: bounds.minX + (bounds.width - 2 * buttonSize.width) / 2,
                y: stepper.frame.maxY + actionButtonTopMargin),
            size: timeLabelSize)
    }
    
    private func setupViews() {
        addSubview(timeLabel)
        addSubview(stepper)
        addSubview(actionButton)
        timeLabel.translatesAutoresizingMaskIntoConstraints = true
        stepper.translatesAutoresizingMaskIntoConstraints = true
        actionButton.translatesAutoresizingMaskIntoConstraints = true
        
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        updateUI()
        
        actionButton.setTitleColor(actionButton.tintColor, for: .normal)
    }
    
    private func updateUI() {
        stepper.isEnabled = !isGameActive
        if isGameActive {
            actionButton.setTitle("Остановать", for: .normal)
            timeLabel.text = "Осталось \(Int(gameTimeLeft)) сек"
        } else {
            actionButton.setTitle("Начать", for: .normal)
            timeLabel.text = "Время: \(Int(stepper.value)) сек"
        }
        setNeedsLayout()
    }
}
