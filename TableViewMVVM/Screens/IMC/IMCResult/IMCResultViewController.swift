//
//  IMCResultViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/30/22.
//

import UIKit

class IMCResultViewController: UIViewController {
    private var imcResultView: IMCResultViewProtocol = IMCResultView()
    private var imc: IMC

    init(imc: IMC) {
        self.imc = imc
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imcResultView.delegate = self
        imcResultView.updateView(imc)
    }

    override func loadView() {
        super.loadView()
        view = imcResultView.view
    }
}

extension IMCResultViewController: IMCResultViewDelegate {
    func didTapCalculate() {
        navigationController?.popViewController(animated: true)
    }

    func didTapClose() {
        navigationController?.popToRootViewController(animated: true)
    }
}
