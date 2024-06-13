import webinix

let doc = "<html><head><script src='webinix.js'></script></head> Hello World</html>"

let win = webinix_new_window()

_ = doc.withCString { html in
	webinix_show(win, UnsafeMutablePointer(mutating: html))
}

webinix_wait()
