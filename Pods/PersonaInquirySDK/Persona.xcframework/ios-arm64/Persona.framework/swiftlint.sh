set -e
if which swiftlint >/dev/null; then
    swiftlint autocorrect # Do a whitespace pass first
    swiftlint
else
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
