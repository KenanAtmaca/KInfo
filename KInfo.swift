//
//  Created by K&
//  kenanatmaca.com
//  Copyright © 2017 Kenan Atmaca. All rights reserved.
//

import UIKit


class KInfo {
    
    
    fileprivate var msgLabel:UILabel!
    fileprivate var msgView:UIView!
    fileprivate var msgText:String!
    fileprivate var rootView:UIView!
    var backgroundColor:UIColor?
    var textColor:UIColor?
    
    
    init (text:String,to view:UIView) {
        
        self.msgText = text
        self.rootView = view
        
    }
    
    func setup() {
    
        msgLabel = UILabel()
        msgLabel.text = msgText
        msgLabel.font = UIFont.systemFont(ofSize: 15)
        msgLabel.numberOfLines = 0
        msgLabel.lineBreakMode = .byWordWrapping
        msgLabel.textColor = self.textColor ?? UIColor.white
        msgLabel.textAlignment = .center
        msgLabel.frame = getTextSizes(str: msgText, fsize: 20)
        
        msgView = UIView()
        msgView.frame = getTextSizes(str: msgText, fsize: 20)
        msgView.layer.cornerRadius = 5
        msgView.layer.masksToBounds = true
        msgView.backgroundColor = self.backgroundColor?.withAlphaComponent(0.8) ?? UIColor.darkGray.withAlphaComponent(0.8)
        
        rootView.addSubview(msgView)
        
        msgView.addSubview(msgLabel)

    }
    
    func show(to point:CGPoint) {
        msgView.center = point
    }
    
    func dismiss(time:TimeInterval) {
        
       UIView.animate(withDuration: time, animations: { 
        self.msgView.alpha = 0
       }) { (_) in
        self.msgLabel.removeFromSuperview()
        self.msgView.removeFromSuperview()
        }
        
    }
    
    func touch(touches:Set<UITouch>) {
        
        msgView.alpha = 0
        
        UIView.animate(withDuration: 1.0) {
            self.msgView.alpha = 1
        }
        
        let touch = touches.first! as UITouch
        let pointRootView = touch.location(in: rootView)
        
       
        self.msgView.center = pointRootView
        
    }

    private func getTextSizes(str:String,fsize:CGFloat) -> CGRect {
        
        let size = CGSize(width: 300, height: 200)
        let opt = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: str).boundingRect(with: size, options: opt, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fsize)], context: nil)
        
    }

}
