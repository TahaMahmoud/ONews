# ONews
ONews is a simple iOS application, it retrieves news from free API [newsapi.org] and display it for the user, and allow the user to view article details and save it for later.
In the first launch, User choose language and country, then he will be allowed to select 3 categories as preferences.
Finally, The user can continue to the application and discover news and App. Features. 

Using [newsapi.org](https://newsapi.org)

## Don't Forget To Install Pods

```swift
pod install
```

## Used In The APP
- SWIFT
- Alamofire-based Network Layer
- VIPER Architecture Pattern, Using [VIPER Module Generator](https://github.com/TahaMahmoud/VIPER_Module_Generator)
- Coordinator Pattern For Handling Navigation
- Delegation Pattern For Communication between Module entities
- Kingfisher For Images Downloading and Caching
- XIB Files
- Localization [English, Arabic]
- Realm For Caching Preferred Articles using [Generic Realm Manager] 
- UserDefaults for Storing simple data using [Generic UserDefaults Manager]
- Adobe XD For Designing The UI

## TODO:-

- [ ] Code Refactoring
- [ ] Use Repository Pattern
- [ ] Dark Mode Support
- [ ] Unit Tests
- [ ] Enhance UI/UX

## Screenshots

### English Version

| Launch Screen | Select Language     | Select Country     | Select Preferences     |
| :-------- | :------- | :-------     | :-------     |
| <img src="/Screenshots/LaunchScreen.png" width="200" height="400">        | <img src="/Screenshots/SelectLanguage.en.png" width="200" height="400">       | <img src="/Screenshots/SelectCountry.en.png" width="200" height="400">       | <img src="/Screenshots/SelectPreferences.en.png" width="200" height="400">       |

| Home | Article Details     | Saved News     | Search     |
| :-------- | :------- | :-------     | :-------     |
| <img src="/Screenshots/Home.en.png" width="200" height="400">        | <img src="/Screenshots/ArticleDetails.en.png" width="200" height="400">       | <img src="/Screenshots/Saved.en.png" width="200" height="400">       | <img src="/Screenshots/Search.en.png" width="200" height="400">       |

### Arabic Version

| Launch Screen | Select Language     | Select Country     | Select Preferences     |
| :-------- | :------- | :-------     | :-------     |
| <img src="/Screenshots/LaunchScreen.png" width="200" height="400">        | <img src="/Screenshots/SelectLanguage.ar.png" width="200" height="400">       | <img src="/Screenshots/SelectCountry.ar.png" width="200" height="400">       | <img src="/Screenshots/SelectPreferences.ar.png" width="200" height="400">       |

| Home | Article Details     | Saved News     | Search     |
| :-------- | :------- | :-------     | :-------     |
| <img src="/Screenshots/Home.ar.png" width="200" height="400">        | <img src="/Screenshots/ArticleDetails.ar.png" width="200" height="400">       | <img src="/Screenshots/Saved.ar.png" width="200" height="400">       | <img src="/Screenshots/Search.ar.png" width="200" height="400">       |

## App Structure:
* App
   * Localizables
   * Configuration
   * Core
   * Extensions
   * Resources
      * Fonts
   * SupportingFiles
      * UIComponents
      * Common
   * Externals
      * Coordinator
      * Networking
      * DataPersistence
        * Realm Manager
        * UserDefaults Manager

* Modules
   * Onboarding [Select Language and Country]
      * Protocols
      * View
      * Interactor
      * Presenter
      * Router
   * Onboarding [Select Preferences]
      * Protocols
      * View
      * Interactor
      * Presenter
      * Entity
      * Router
   * Home
      * Protocols
      * View
      * Interactor
      * Presenter
      * Entity
      * Router
   * ArticleDetails
      * Protocols
      * View
      * Interactor
      * Presenter
      * Entity
      * Router   
   * Saved
      * Protocols
      * View
      * Interactor
      * Presenter
      * Router
   
## Authors:
Created by 
- Taha Mahmoud [LinkedIn](https://www.linkedin.com/in/engtahamahmoud/)

Please don't hesitate to ask any clarifying questions about the project if you have any.
