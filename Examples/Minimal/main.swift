import SwiftWebinix

let doc = "<html><head><script src='webinix.js'></script></head> Hello World</html>"

let win = newWindow()

try! win.show(doc)

wait()
