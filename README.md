# SwiftCSV

Simple CSV parsing for Swift 3

## This Fork

This fork is intended as a server side utility. 

* It is Swift 3.0 and Swift Package Manager (SPM) ready.

The original repo can be found here: [https://github.com/naoty/SwiftCSV](https://github.com/naoty/SwiftCSV). Thanks @ naoty for the excellent work!


## Usage

CSV content can be loaded using the `CSV` class:

```swift
// As a string
let csv = CSV(string: "id,name,age\n1,Alice,18")
// With a custom delimiter character
let tsv = CSV(string: "id\tname\tage\n1\tAlice\t18", delimiter: "\t")
// From a file (with errors)
do {
    let csv = try CSV(name: "users.csv")
} catch {
    // Catch errors or something
}
// With a custom delimiter, errors, and custom encoding
do {
    let tsv = try CSV(name: "users.tsv", delimiter: tab, encoding: NSUTF8StringEncoding)
} catch {
    // Error handling
}
```

If you don't care about the columns, you can set the `loadColumns` argument to `false` and the columns Dictionary will not be populated.

### Reading Data

Works just like the original:

```swift
let csv = CSV(string: "id,name,age\n1,Alice,18\n2,Bob,19")
csv.header    //=> ["id", "name", "age"]
csv.rows      //=> [["id": "1", "name": "Alice", "age": "18"], ["id": "2", "name": "Bob", "age": "19"]]
csv.columns   //=> ["id": ["1", "2"], "name": ["Alice", "Bob"], "age": ["18", "19"]]
```

The rows can also parsed and passed to a block on the fly, reducing the memory needed to store the whole lot in an array:

```swift
// Access each row as an array (array not guaranteed to be equal length to the header)
csv.enumerateAsArray { array in
    print(array.first)
}
// Access them as a dictionary
csv.enumerateAsDict { dict in
    print(dict["name"])
}
```

## Installation

###Requirements

- Swift version 3.0

### Install via Swift Package Manager

* Add the following to your `Package.swift` file:

``` swift
.Package(
    url: "https://github.com/iamjono/SwiftCSV.git", 
    majorVersion: 1, minor: 0
    ),
```

Then, regenerate your Xcode project:

```
swift package generate-xcodeproj
```

