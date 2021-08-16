# MovieBox - Simple application

## 1. Introduction
Name: Duy Nguyen  
Blog: https://nhatduy.info  
Link to my resume: https://github.com/nhatduy129/ios-core/blob/master/CV/DuyNguyen_CV.pdf

## 2. System
iOS target: **14.1**  
Xcode version: **12.5.1**  
Language: **Swift 5**

## 3. App's demonstrate
![MovieBox demonstrate](https://i.imgur.com/aVLmWjJ.gifv)

## 4. What I have done in this app
* Wrote 65 unit tests, covered 83%. It includes testing API calls, view models, view controllers and extensions.

![Drag Racing](https://i.im.ge/2021/08/01/LiSOf.png)
* Used Swiftlint and follow its rules strictly.
* Used MVVM architecture.
* Respected SOLID printciles strictly.
* Created Splash screen to load list of movies and posters.
* Handled calling APIs fail.

## 5. Libraries
| Name | Purpose |
| ------------- |-------------|
| Alamofire | Keep code clean in calling APIs.     |
| SDWebImage | Load and cache image for UIImageView.     |
| PullToRefreshKit | Handling load more data for UITableView.     |
| SVProgressHUD | Display loading indicator and block UI during the loading time. |
| Mocker | This library is only installed to UnitTests target. It helps to mock json response for API requests. |
