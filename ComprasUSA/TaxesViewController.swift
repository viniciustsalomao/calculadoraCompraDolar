//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Vinícius Tinajero Salomão on 25/08/20.
//  Copyright © 2020 Vinícius Tinajero Salomão. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    @IBOutlet weak var lbStateTaxDescription: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        lbStateTaxDescription.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTax, withCurrency: "")))%)"
        lbIOFDescription.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: "")))%)"

        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$ ")
        lbStateTax.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "US$ ")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$ ")

        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormattedValue(of: real, withCurrency: "R$ ")
        
    }

}
