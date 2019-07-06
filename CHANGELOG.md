## 1.1.0

DNB recently updated their APIs, resulting in various changes

### **Breaking changes:**

* Removed all Open Banking APIs no longer supported by DNB
* Removed optional JWT token for all methods, as it's only a duplicate of the `jwt` field anyway.
* Separated their Open Banking APIs into its own client to separate from their PSD2 APIs, which is coming to this library in the next release
* Changed parameters for Currency APIs

Other changes:

- Only signing the `getToken`method as it's the only API call that needs AWS Signature
- Added versioning for each API (defaults to current newest version, will try to update ASAP for each release)
- Updated dependencies
- Code cleanup and formatting

## 1.0.1

* Added example

## 1.0.0

* Initial release
