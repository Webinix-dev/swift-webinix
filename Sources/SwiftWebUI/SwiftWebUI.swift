import webinix

public typealias Event = UnsafeMutablePointer<webinix_event_t>?

public typealias BindCallback = @convention(c) (Event) -> Void

enum WebinixError: Error {
	case runtimeError(String)
}

public final class Window {
	let id: Int

	public init(_ webinix_win: Int) {
		id = webinix_win
	}

	public func bind(_ element: String, _ cb: BindCallback) {
		webinix_bind(id, element, cb)
	}

	public func show(_ html: String) throws {
		if !(html.withCString { html in
			webinix_show(id, html)
		}) {
			throw WebinixError.runtimeError("error: failed to show window")
		}
	}

	public func close() {
		webinix_close(id)
	}

	public func destroy() {
		webinix_destroy(id)
	}

	public func is_shown() -> Bool {
		webinix_is_shown(id)
	}
}

public func newWindow() -> Window {
	return Window(webinix_new_window())
}

public func wait() {
	webinix_wait()
}

public func exit() {
	webinix_exit()
}

public func clean() {
	webinix_clean()
}

public func getArg<T>(_ event: Event, _ idx: Int = 0) throws -> T {
	let arg_count = webinix_get_count(event)
	if idx >= arg_count {
		throw WebinixError.runtimeError("error: argument index out of range (index: \(idx), argument count: \(arg_count))")
	}
	if T.self == String.self {
		let str = webinix_get_string_at(event, idx)!
		return String(cString: str) as! T
	} else if T.self == Int.self {
		return Int(webinix_get_int_at(event, idx)) as! T
	} else if T.self == Bool.self {
		return webinix_get_bool_at(event, idx) as! T
	} else if T.self == Double.self {
		return webinix_get_float_at(event, idx) as! T
	}
	// TODO: automatically decode other types.
	throw WebinixError.runtimeError("error: failed to get argument at index `\(idx)`")
}

public func response<T>(_ event: Event, _ value: T) {
	if value is String {
		(value as! String).withCString { str in
			webinix_return_string(event, str)
		}
	} else if value is Int {
		webinix_return_int(event, Int64(value as! Int))
	} else if value is Bool {
		webinix_return_bool(event, value as! Bool)
	} else if value is Double {
		webinix_return_float(event, value as! Double)
	}
	// TODO: automatically encode other types as JSON string.
}
