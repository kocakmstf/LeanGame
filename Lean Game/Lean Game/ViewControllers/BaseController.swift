//
//  BaseController.swift
//  Lean Game
//
//  Created by Mustafa KOCAK on 13.08.2020.
//  Copyright © 2020 Mustafa Kocak. All rights reserved.
//

import Foundation
import UIKit
protocol BaseViewControllerProtocol {
    func showErrorMessage(_ message: String)
    func showLoader() -> Void
    func hideLoader() -> Void
}
public class BaseViewController:UIViewController{
    private  var loaderView: UIView?
    
    func createEmptyView(on frame:CGRect, with message: String) -> UIView  {
        let emptyView = UIView(frame: frame)
        emptyView.alpha = 0.75
        emptyView.backgroundColor = UIColor.gray
        let titleLabel = UILabel()
        let activityIndicator = UIActivityIndicatorView()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = message
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        activityIndicator.color = UIColor.white
        activityIndicator.style = .whiteLarge
        activityIndicator.startAnimating()
        titleLabel.textColor = UIColor.white
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(activityIndicator)
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        activityIndicator.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        activityIndicator.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = title
        return emptyView
        // The only tricky part is here:
    }
}
extension BaseViewController :BaseViewControllerProtocol{
    @objc func hideLoader() {
          self.loaderView?.removeFromSuperview()
          self.loaderView = nil
      }

    @objc  func showLoader() {
          if(loaderView == nil){
              loaderView = createEmptyView(on: self.view.frame, with: "Loading")
          }
          self.view.addSubview(loaderView!)
          self.view.bringSubviewToFront(loaderView!)
          
      }
      
    
     @objc func showErrorMessage(_ message: String) {
          let alertController = UIAlertController(
              title: "Error!",
              message: message,
              preferredStyle: .alert
          )
          alertController.addAction(UIAlertAction(title: "Ok", style: .default))
          self.present(alertController, animated: true, completion: nil)
      }
      
    
}

