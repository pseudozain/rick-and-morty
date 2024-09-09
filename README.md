# Rick & Morty
Rick & Morty is an iOS application built using Swift that allows users to view, filter, and explore a list of characters. The app is structured around a clean, maintainable, and testable architecture, leveraging MVVM (Model-View-ViewModel) design patterns to ensure separation of concerns, reusability, and scalability. The app interacts with a [Rick & Morty API](https://rickandmortyapi.com/documentation/) to fetch character data and displays it in a user-friendly format.

### Key Features:
- Character List: Displays a paginated list of characters retrieved from the server.
- Character Filters: Allows users to filter characters by their status (Alive, Dead, Unknown) using a custom header.
- Character Details: Shows detailed information about the selected character, including name, species, gender, status, and location.
- Loading Indicators: Includes a custom loader for indicating background data fetching.
- SwiftUI Integration: Utilizes SwiftUI for rendering certain UI components, seamlessly integrated with UIKit.
- MVVM Architecture: Follows MVVM pattern, promoting clean code, testability, and modularity.
- Unit Tests: Comprehensive unit test coverage to ensure code quality and prevent regressions.

### Techonologies
- Swift: The core language for building the application.
- SwiftUI: Used for rendering views like the loader in a declarative way.
- UIKit: For view controllers, table views, and navigation throughout the app.
- Alamofire: Handles networking and API requests.
- Modular achitecture: A modular approach is followed for scalability.
- XCTest: For comprehensive unit testing of view models, services, and UI components.

## Modules
The project is modularized into two primary modules, Networking and Extensions, which are integrated into the main project using Swift Package Manager (SPM).

### Networking
The Networking module is responsible for handling network requests. It abstracts the complexities of making API calls, managing request configurations, and processing responses. Key features include:

- API Request Management: Simplifies the process of creating and sending HTTP requests.
- Error Handling: Provides mechanisms for dealing with network errors and responses.
- Data Parsing: Handles the conversion of JSON or other data formats into Swift models.

### Extensions
The Extensions module includes various utility extensions and helper functions that enhance the functionality of standard Swift and UIKit components. This module helps keep the main project clean and maintainable by providing reusable components and common functionalities.

## How to run
1. Open the Project: Launch Xcode and open the project file located at [RickAndMorty/RickAndMorty.xcodeproj](RickAndMorty/RickAndMorty.xcodeproj).
2. Resolve Dependencies: Allow Xcode to resolve all dependencies managed by Swift Package Manager (SPM). This process may take a few moments.
3. Select Rick&Morty scheme from the available schemes.
4. Run the App: Select an iPhone Simulator with iOS 15.0 or later from the target device list and click the "Run" button in Xcode to build and launch the app.
5. Run Tests: To execute the unit tests, press Cmd + U or navigate to Product > Test in the Xcode menu.

## Assumptions and Limitations
1. Testing Coverage: Currently, only unit tests are implemented. There are no UI tests included in this project.
2. Scope of Unit Tests: Unit tests have been written for ViewModels and utility functions including modules. Other components or aspects of the application may not be covered.
