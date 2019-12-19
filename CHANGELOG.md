# Changelog

## 1.2.1

- Bumped sigv4 version
- Fixed build status badge
- Removed deprecated `author:` field from pubspec

## 1.2.0+1

- Formatting, updated readme

## 1.2.0

### **BREAKING CHANGES:**

- Changed all ID parameteres to non-optional

## 1.1.2

Updated README to reflect the recent changes in the library.

## 1.1.1

Actually forgot to bump package version. Because of serious OCD, the pub version and pubspec version _has_ to be in sync.

## 1.1.0

DNB recently updated their APIs, resulting in various changes

### **Breaking changes:**

- Removed all Open Banking APIs no longer supported by DNB
- Removed optional JWT token for all methods, as it's only a duplicate of the `jwt` field anyway.
- Separated their Open Banking APIs into its own client to separate from their PSD2 APIs, which is coming to this library in the next minor version
- Changed parameters for Currency APIs

Other changes:

- Only signing the `getToken`method as it's the only API call that needs AWS Signature
- Added versioning for each API (defaults to current newest version, will try to update ASAP for each release)
- Updated dependencies
- Code cleanup and formatting

## 1.0.1

- Added example

## 1.0.0

- Initial release
