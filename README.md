# Ai_Bharata_AMPIY_assignment

## Overview

**AMPIY** is a cryptocurrency trading app built using Flutter. The app provides a user-friendly interface to track, buy, and sell various cryptocurrencies. It includes several features such as a market variation spectrum, popular coins of the month, trending coins, news updates, and a zones section categorizing coins by different platforms like NFT, PoS, DeFi, and more.

## Features

- **User Authentication**: Basic authentication flow with account verification.
- **Market Variation Spectrum**: Displays a line chart showing market variations with a color-coded graph (green for highs, red for lows).
- **Popular Coins of the Month**: Highlights top-performing cryptocurrencies with images, names, and monthly price changes.
- **Trending Coins**: Lists trending coins with percentage changes in price, color-coded by performance.
- **News Updates**: Provides the latest news related to cryptocurrencies, with images and detailed descriptions.
- **Zones**: Categorizes coins into different platforms such as NFT, PoS, and DeFi, displaying relevant coin data with images and percentage changes.

## Screenshots

### Home Screen
![Home Screen]<img src="assets/Homepage.png" alt="AMPIY App" width="400" height="500">

### Coins Screen
![Coinspage]<img src="assets/Coinspage.png" alt="AMPIY App" width="400" height="500">



## Installation

To run this project locally, follow these steps:

### Prerequisites

- **Flutter**: Ensure you have Flutter installed on your local machine. You can download it from [Flutter's official website](https://flutter.dev/docs/get-started/install).
- **Dart**: Dart is included with Flutter SDK, so no additional installation is necessary.

### Clone the Repository

```bash
git clone https://github.com/yourusername/ampiy-crypto-app.git
cd ampiy-crypto-app
Install Dependencies
bash
Copy code
flutter pub get
Run the App
To run the app on your connected device or emulator:

bash
Copy code
flutter run
Directory Structure
bash
Copy code
ampiy-crypto-app/
|- android/                # Android-specific files
|- assets/                 # Assets such as images
|- ios/                    # iOS-specific files
|- lib/
   |- screens/             # Screens of the app
   |- widgets/             # Reusable widgets
   |- main.dart            # Main entry point of the application
|- test/                   # Test files
|- pubspec.yaml            # Flutter dependencies and assets configuration
|- README.md               # Documentation file

### Notes:
- Replace `path/to/...` with the actual path of your screenshots if you include them.
- Ensure that the email and LinkedIn links are correct before finalizing the README.
- Customize the repository link in the "Clone the Repository" section to point to the correct GitHub repository. 

This README provides a comprehensive overview of the project, including installation instructions, features, and how to contribute.

The Coins Page provides a detailed view of various cryptocurrencies listed on the platform. Each coin is displayed with relevant information, including:

- **Coin Image**: A thumbnail image representing the cryptocurrency.
- **Coin Name**: The name of the cryptocurrency (e.g., Bitcoin, Ethereum).
- **Current Price**: The current trading price of the cryptocurrency.
- **Price Change**: The percentage change in the price over the last 24 hours, color-coded for clarity (green for an increase, red for a decrease).
- **Market Spectrum**: A graphical representation of the coin's price variations over time, helping users visualize the coin's performance.
- **Zones**: Categorization of coins into different platforms such as NFT, PoS, and DeFi, showing their relevance and performance within those platforms.

### Popular Coins

This section highlights the top-performing cryptocurrencies of the month. Each coin is showcased with:

- **Coin Image**: A distinctive image representing the cryptocurrency.
- **Coin Name**: The official name of the coin.
- **Monthly Price Increment**: A label showing the percentage increase in the coin's value over the past month, helping users identify potential investment opportunities.

### Trending Coins

In the Trending Coins section, users can explore:

- **Coin Image and Name**: Each cryptocurrency is displayed with its image and name.
- **Percentage Change**: A concise indicator of the coin's recent performance, with the percentage change displayed in green or red, based on whether the coin's price has risen or fallen.

The Coins Page is designed to give users quick access to crucial market information, enabling informed decision-making for both novice and experienced cryptocurrency traders.

### How to Navigate the Coins Page

1. **Browse Popular Coins**: Scroll through the horizontally arranged list of top-performing coins. Tap on any coin to view more details.
2. **Check Trending Coins**: View the latest trending coins along with their price changes. Tap on a coin to explore its historical data and market trends.
3. **Filter by Zones**: Explore coins categorized by their platform type, such as NFT or DeFi. This helps users target specific segments of the cryptocurrency market.