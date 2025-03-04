// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "TreeSitterOrg",
  platforms: [.macOS(.v10_13), .iOS(.v11)],
  products: [
    .library(name: "TreeSitterOrg", targets: ["TreeSitterOrg"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "TreeSitterOrg",
      path: ".",
      exclude: [
        "Cargo.toml",
        "Makefile",
        "binding.gyp",
        "bindings/c",
        "bindings/go",
        "bindings/node",
        "bindings/python",
        "bindings/rust",
        "prebuilds",
        "grammar.js",
        "package.json",
        "package-lock.json",
        "pyproject.toml",
        "setup.py",
        "test",
        "examples",
        ".editorconfig",
        ".github",
        ".gitignore",
        ".gitattributes",
        ".gitmodules",
      ],
      sources: [
        "src/parser.c",
        // NOTE: if your language has an external scanner, add it here.
        "src/scanner.c",
      ],
      resources: [
        .copy("queries")
      ],
      publicHeadersPath: "bindings/swift",
      cSettings: [.headerSearchPath("src")])
  ],
  cLanguageStandard: .c11
)
