
import WebKit

let header = "<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\"> <style>body,html{width:100%;height: 100%;}*{margin:0;padding:0;}img{max-width:100%;display:block;   width:auto; height:auto;}</style></head>"

public extension WKWebView{
    
    func xmg_loadHtml(htmlStr:String){
        self.loadHTMLString("<html>\(header)" + "<body>" + htmlStr + "</body></html>", baseURL: nil)
        
    }
    
}
