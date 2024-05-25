/*
 E5IOSUI
 Basic classes and extension for IOS
 Copyright: Michael Rönnau mr@elbe5.de
 */

import UIKit

extension UIViewController{
    
    public var isDarkMode: Bool {
        return self.traitCollection.userInterfaceStyle == .dark
    }
    
    public func showAlert(title: String, text: String, onOk: (() -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok".localize(table: "Base"),style: .default) { action in
            onOk?()
        })
        self.present(alertController, animated: true)
    }
    
    public func showDestructiveApprove(title: String, text: String, onApprove: (() -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "yes".localize(table: "Base"), style: .destructive) { action in
            onApprove?()
        })
        alertController.addAction(UIAlertAction(title: "no".localize(table: "Base"), style: .cancel))
        self.present(alertController, animated: true)
    }
    
    public func showApprove(title: String, text: String, onApprove: (() -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "yes".localize(table: "Base"), style: .default) { action in
            onApprove?()
        })
        alertController.addAction(UIAlertAction(title: "no".localize(table: "Base"), style: .cancel))
        self.present(alertController, animated: true)
    }
    
    public func showDone(title: String, text: String){
        let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok".localize(table: "Base"), style: .default))
        self.present(alertController, animated: true)
    }
    
    public func showError(_ reason: String){
        showAlert(title: "error".localize(table: "Base"), text: reason.localize())
    }
    
    public func startSpinner() -> UIActivityIndicatorView{
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.setAnchors(centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        return spinner
    }
    
    public func stopSpinner(_ spinner: UIActivityIndicatorView?) {
        if let spinner = spinner{
            spinner.stopAnimating()
            self.view.removeSubview(spinner)
        }
    }
    
}

