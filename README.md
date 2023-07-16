# NSLayoutConstraintBuilderDSL

Use the vanilla Auto Layout API, just a little bit easier.

The primary focus of this package is to provide a result builder to enable creating layout constraints with a declarative syntax.

Example:
```swift
NSLayoutConstraint.activate {
    someView.topAnchor.constraint(equalTo: otherView.topAnchor)
    someView.leadingAnchor.constraint(equalTo: otherView.leadingAnchor)
    someView.bottomAnchor.constraint(equalTo: otherView.bottomAnchor)
    someView.trailingAnchor.constraint(equalTo: otherView.trailingAnchor)
}
```

The result builder syntax allows other expressions to provide a concise, clean, and declarative API surface; no need for intermediate arrays or temporary variables to express complex constraint creation.

Example:
```swift
NSLayoutConstraint.activate {
    for view in [someView, anotherView, thingView] {
        view.leadingAnchor.constraint(equalTo: awesomeView.leadingAnchor)
        view.trailingAnchor.constraint(equalTo: awesomeView.trailingAnchor)
    }

    someView.topAnchor.constraint(equalTo: awesomeView.topAnchor)
    thingView.bottomAnchor.constraint(equalTo: awesomeView.bottomAnchor)

    if someCondition {
        anotherView.widthAnchor.constraint(equalTo: awesomeView.widthAnchor)
    }
}
```

Other conveniences provided by this package can simplify the creation of common constraints.

The previous example with these conveniences can be expressed as:
```swift
NSLayoutConstraint.activate {
    for view in [someView, anotherView, thingView] {
        Pin(edges: .horizontal, of: view, to: awesomeView)
    }

    Pin(edges: .top, of: someView, to: awesomeView)
    Pin(edges: .bottom, of: thingView, to: awesomeView)

    if someCondition {
        Pin(dimension: .width, of: anotherView, to: awesomeView)
    }
}
```
