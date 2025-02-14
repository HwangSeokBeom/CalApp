//
//  CalulatorView.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/15/24.
//

import UIKit
import SnapKit

class CalculatorView: UIView {
    

    let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.backgroundColor = .black
        label.textColor = .white
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .right
        return label
    }() // 결과 라벨 인스턴스 생성 및 초기화
    
    let buttonStack: UIStackView
        
    override init(frame: CGRect) {
        buttonStack = CalculatorView.createButtonStack() // 버튼 인스턴스 생성 및 초기화
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = .black
        addSubview(displayLabel)
        addSubview(buttonStack)
        
        displayLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(100)
        }
        
        buttonStack.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.top.equalTo(displayLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
    }
    
    private static func createButtonStack() -> UIStackView {
        
        let buttonTitles = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"]
        ]

        let stackView = UIStackView.create(with: .vertical)
        
        for row in buttonTitles {
            let rowStack = UIStackView.create(with: .horizontal)
            
            for title in row {
                let button = UIButton.create(withTitle: title)
                rowStack.addArrangedSubview(button)
            }
            stackView.addArrangedSubview(rowStack)
        }
        return stackView
    }

}
