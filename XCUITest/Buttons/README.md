# Buttons
# XCUITest Sample iOS App and Test

This sample includes an Xcode project for an App and XCUITest written using Swift. It has a shell script for submitting the tests to App Center Test. This sample does not require any App Center specific extensions.

Primary documentation for App Center Test is available here: [App Center Test](https://docs.microsoft.com/en-us/appcenter/test-cloud/)

Primary documentation for XCUITest in App Center Test is available here: [Preparing XCUITest Tests for Upload](https://docs.microsoft.com/en-us/appcenter/test-cloud/preparing-for-upload/xcuitest).
(Note: this documentation may still reference the AppCenter XCUITest Extensions. They are *newly* no longer required and this sample illustrates how to create and submit tests without those extensions.)

Clone or download this repository so you can work with it locally.

## Building & running locally

1. In Xcode, open this project.
2. Run the tests locally with Xcode>Product>Test (or CMD+U).

## Uploading app & tests

1. Create an account and setup your local environment. See [Getting started with App Center Test](https://docs.microsoft.com/en-us/appcenter/test-cloud/getting-started).
2. Generate a command line for upload for an iOS App using the XCUITest framework. This app requires iOS 9.x or greater, so specify at least one device that is iOS 9.x or greater. 
See [Starting A Test Run](https://docs.microsoft.com/en-us/appcenter/test-cloud/starting-a-test-run).
3. Using the `--app name` and `--devices slug` from that generated command line, modify the file `XCUItest/Buttons/app-submit.sh` to include your `app_name` and `devices_slug`.
4. Run the command (from the folder `XCUItest/Buttons/`): `sh app-submit.sh`

## Test Details

If you submit the tests to App Center Test and view the Test Report you will be able to see one test step and one screenshot for the test `testNoActivities` and there are five screenshots and test steps for the test `testPass`. This is a result of how the tests are written. You can compare the source code for these two tests in `ButtonsUITests.swift`. In `testPass` the various test steps are wrapped in `XCTContext.runActivity` and in `testNoActivities` they are not. To generate screenshots and test steps wrap your test steps or sub tests in `XCTContext.runActivity`. For more information, see [Grouping Tests into Substeps with Activities](https://developer.apple.com/documentation/xctest/activities_and_attachments/grouping_tests_into_substeps_with_activities).
