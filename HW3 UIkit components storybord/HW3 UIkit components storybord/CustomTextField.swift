//
//  CustomTextField.swift
//  HW3 UIkit components storybord
//
//  Created by Iryna Mishyna on 22.09.2021.
//

import UIKit

final class CustomTextField: UITextField {
    
    enum CustomState {
        case unfocused
        case focused
        case error
        case success
        
        var underTextLineColor: UIColor {
            switch self {
            case .focused:
                return .darkGray
            case .unfocused:
                return .lightGray
            case .error:
                return .red
            case .success:
                return .green
            }
        }
        
        var placeholderLabelColor: UIColor {
            switch self {
            case .focused:
                return .darkGray
            case .unfocused:
                return .lightGray
            case .error:
                return .red
            case .success:
                return .green
            }
        }
        
        var countingCharactersLabelColor: UIColor {
            switch self {
            case .focused:
                return .darkGray
            case .unfocused:
                return .lightGray
            case .error:
                return .red
            case .success:
                return .green
            }
        }
    }
    
    var textChangedCallback: ((String) -> Void)?
    var textFieldLostFocusCallback: (() -> Void)?
    var didTapReturnCallback: (() -> Void)?
    var textFieldBecomeFocused: (() -> Void)?
    
    private var xInset: CGFloat {
        return (leftView?.frame.width ?? 15) + 5
    }
    private var yInset: CGFloat {
        return bounds.height / 2 - 15
    }
    
    private let placeholderLabel = UILabel()
    private let countingCharactersLabel = UILabel()
    
    private lazy var placeholderVerticalConstraint: NSLayoutConstraint = {
        placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5)
    }()
    
    private lazy var placeholderCenterYConstraint: NSLayoutConstraint = {
        placeholderLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    }()
    
    private lazy var placeholderLeadingConstraint: NSLayoutConstraint = {
        placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xInset)
    }()
    
    private lazy var countingCharactersBottomConstraint : NSLayoutConstraint = {
        countingCharactersLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
    }()
    
    private lazy var countingCharactersTrailingConstraint : NSLayoutConstraint = {
        countingCharactersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
    }()
    
    private lazy var lineUnderTextViewHeightConstraint : NSLayoutConstraint = {
        lineUnderTextView.heightAnchor.constraint(equalToConstant: 3)
    }()

    
    private let lineUnderTextView: UIView = {
        var lineUnderTextView = UIView(frame: .zero)
        return lineUnderTextView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialSetup()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: xInset,
                      y: yInset,
                      width: bounds.width - xInset * 2,
                      height: bounds.height - yInset * 2)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: xInset,
                      y: yInset,
                      width: bounds.width - xInset * 2,
                      height: bounds.height - yInset * 2)
    }
    
    private func initialSetup() {
        
        addTarget(self, action: #selector(textDidChanged(textField:)), for: .editingChanged)
        delegate = self
        
        backgroundColor = .white
        borderStyle = UITextField.BorderStyle.roundedRect
        textColor = .darkGray
        addSubview(countingCharactersLabel)
        addSubview(placeholderLabel)
        addSubview(lineUnderTextView)
        
        //        togglePasswordVisibility()
        setUpAutoLayout()
        
        countingCharactersLabel.text = "\((text ?? "").count) Сhar"
        countingCharactersLabel.font = UIFont.systemFont(ofSize: 8)
        
        placeholderLabel.text = "Card number"
        
        setState(to: .unfocused)
        
    }
    
    func addLeftControl(_ control: UIControl) {
        
        leftView = control
        leftViewMode = .always
        placeholderLeadingConstraint.constant = xInset
    }
    
    
    @objc func textDidChanged(textField: UITextField) {
        print("Text changed")
        
        
        textChangedCallback?(textField.text ?? "")
        
        let charsCount = (textField.text ?? "").count
        countingCharactersLabel.text = "\(charsCount) Сhar"
        let textFieldIsEmpty = (textField.text ?? "").isEmpty
        
        placeholderCenterYConstraint.isActive = textFieldIsEmpty
        placeholderVerticalConstraint.isActive = !textFieldIsEmpty
        
        
        UIView.animate(withDuration: 0.2) {
            self.placeholderLabel.font = UIFont.systemFont(ofSize: textFieldIsEmpty ? 16 : 8)
            self.layoutIfNeeded()
        }
        
        if charsCount != 16 {
            setState(to: .error)
        } else if charsCount == 0 {
            setState(to: .focused)
        } else {
            setState(to: .success)
        }
    }
    
    private func setUpAutoLayout() {
        countingCharactersLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        lineUnderTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countingCharactersBottomConstraint,
            countingCharactersTrailingConstraint,
            
            placeholderLeadingConstraint,
            placeholderCenterYConstraint,
            
            lineUnderTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineUnderTextView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineUnderTextView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineUnderTextViewHeightConstraint
        ])
    }
    
    private func validateText(_ text: String) {
        
        let charsCount = text.count
        
        if charsCount != 16  {
            setState(to: .error)
        } else if charsCount == 0 {
            setState(to: .focused)
        } else {
            setState(to: .success)
        }
    }
    
    private func setState(to state: CustomState) {
        lineUnderTextView.backgroundColor = state.underTextLineColor
        placeholderLabel.textColor = state.placeholderLabelColor
        countingCharactersLabel.textColor = state.countingCharactersLabelColor
    }
}

// MARK: - UITextFieldDelegate

extension CustomTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldBecomeFocused?()
        validateText(textField.text ?? "")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldLostFocusCallback?()
        setState(to: .unfocused)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didTapReturnCallback?()
        
        return true
    }
}

//extension CustomTextField {
//    func togglePasswordVisibility() {
//        isSecureTextEntry = !isSecureTextEntry
//
//        if let existingText = text, isSecureTextEntry {
//            /* When toggling to secure text, all text will be purged if the user
//             continues typing unless we intervene. This is prevented by first
//             deleting the existing text and then recovering the original text. */
//            deleteBackward()
//
//            if let textRange = textRange(from: beginningOfDocument, to: endOfDocument) {
//                replace(textRange, withText: existingText)
//            }
//        }
//
//        /* Reset the selected text range since the cursor can end up in the wrong
//         position after a toggle because the text might vary in width */
//        if let existingSelectedTextRange = selectedTextRange {
//            selectedTextRange = nil
//            selectedTextRange = existingSelectedTextRange
//        }
//    }
//}

