//
//  BaseWebViewController.swift
//  MainProject
//
//  Created by 尚软科技 on 2019/12/3.
//  Copyright © 2019 cnsunrun. All rights reserved.
//

import UIKit
import WebKit
import JavaScriptCore
class XMGBaseWebViewController: XMGBaseViewController {
    lazy private var progressView: UIProgressView = {
        let progress = UIProgressView.init(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: UIScreen.main.bounds.width, height: 2))
        progress.tintColor = UIColor.green
        progress.trackTintColor = UIColor.white
        return progress
    }()

    var destionationUrl:String=""
    private var webView:WKWebView!
    convenience init(destinationURL:String) {
        self.init()
        destionationUrl = destinationURL
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = WKWebViewConfiguration()
        // 实例化对象
        configuration.userContentController = WKUserContentController()
        // 调用JS方法
        // 进行偏好设置
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        configuration.preferences = preferences;
        
        webView = WKWebView(frame: self.view.frame, configuration: configuration)
        self.view.addSubview(webView!)
        webView?.snp.makeConstraints({ (m) in
            if #available(iOS 11.0, *) {
                m.top.bottom.leading.trailing.equalTo(self.view.safeAreaInsets)
            } else {
                m.edges.equalToSuperview()
            }
        })
        self.view.addSubview(progressView)
        loadWebView()
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        webView.removeObserver(self, forKeyPath: "title")
    }
    

    //添加观察者方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            
            //设置进度条
            if keyPath == "estimatedProgress"{
                progressView.alpha = 1.0
                progressView.setProgress(Float(webView.estimatedProgress), animated: true)
                if webView.estimatedProgress >= 1.0 {
                    UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut, animations: {
                        self.progressView.alpha = 0
                    }, completion: { (finish) in
                        self.progressView.setProgress(0.0, animated: false)
                    })
                }
            }
                
           //重设标题
            else if keyPath == "title" {
                self.title = self.webView.title
            }
        }

    private func loadWebView()  {
        let url = URL(string: destionationUrl)!
        let request = URLRequest(url: url)
        self.webView?.load(request)
    }
}
