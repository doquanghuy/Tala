//
//  RuleTableViewCellViewModel.swift
//  TaLa
//
//  Created by huydoquang on 12/27/17.
//  Copyright © 2017 huydoquang. All rights reserved.
//

import Foundation

protocol RuleTableViewCellViewModelInterface {
    var nameRule: Dynamic<String> { get }
    var value: Dynamic<Double> { get }
    var ruleType: RulesValue { get }
    func changeValue(to value: Double)
    func parse()
}

class RuleTableViewCellViewModel: RuleTableViewCellViewModelInterface {
    var nameRule: Dynamic<String> = Dynamic("")
    var value: Dynamic<Double> = Dynamic(0.0)
    var ruleType: RulesValue
    var rule: Rule
    
    init(ruleType: RulesValue, rule: Rule) {
        self.ruleType = ruleType
        self.rule = rule
    }
    
    func changeValue(to value: Double) {
        self.value.value = value
    }
    
    func parse() {
        self.nameRule.value = ruleType.contentDisplay
        if let keyPath = ruleType.keyPath {
            self.value.value = Double(rule.value(forKeyPath: keyPath) as? Int16 ?? 0)
        }
    }
}
