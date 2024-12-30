# CoinPaprika API iOS App

This iOS app integrates with the **CoinPaprika API** to provide real-time cryptocurrency data. It allows users to view information about cryptocurrencies, including their prices, ranks, and market details.

## Features

- Displays a list of cryptocurrencies with details such as name, symbol, rank, and price in USD.
- Provides real-time market data for cryptocurrencies.
- Simple, user-friendly interface built using **UIKit** (or **SwiftUI**, depending on your implementation).



## Requirements

- Xcode 12.0 or later
- Swift 5.0 or later
- iOS 14.0 or later
- Network connectivity to access the CoinPaprika API

## Installation

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/stevechacha/KryptoSwift.git
```

### 2. Open the Project in Xcode

Navigate to the project folder and open the `.xcodeproj` or `.xcworkspace` file in Xcode:

```bash
open KryptoSwift.xcodeproj
```

### 3. Install Dependencies (if any)

If you're using **CocoaPods** or **Swift Package Manager** for dependencies, make sure to install them.

For **CocoaPods**, run:
```bash
pod install
```

For **Swift Package Manager**, dependencies will be resolved automatically when you open the project in Xcode.

## Usage

Once the app is installed and running, you can access the following features:

1. **Cryptocurrency List:** The main screen displays a list of cryptocurrencies with details such as name, symbol, and price in USD.
2. **Coin Details:** Tap on a cryptocurrency to view additional information about that specific coin, including market data and other statistics.

The app uses the **CoinPaprika API** to fetch cryptocurrency data in real time. You do not need an API key to use the basic endpoints.

## API Endpoints Used

The app makes use of the following **CoinPaprika API** endpoints:

- **Get All Coins:** `GET /coins`  
  Fetches a list of all available cryptocurrencies.

- **Get Coin Details:** `GET /coins/{coin_id}`  
  Retrieves detailed information about a specific cryptocurrency.

- **Get Markets for a Coin:** `GET /coins/{coin_id}/markets`  
  Retrieves market data for a specific cryptocurrency.

- **Get Global Data:** `GET /global`  
  Retrieves global cryptocurrency market data.

For further details on the API and its capabilities, visit the [CoinPaprika API Documentation](https://api.coinpaprika.com/).

## Contributing

We welcome contributions to this project. If you would like to contribute, please fork the repository and submit a pull request. Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Implement your changes.
4. Test the changes to ensure everything works as expected.
5. Submit a pull request with a description of the changes you've made.


## Repository Link

You can find the repository on GitHub: [KryptoSwift](https://github.com/stevechacha/KryptoSwift)
