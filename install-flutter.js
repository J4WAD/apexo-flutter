const fs = require("fs");
const https = require("https");
const { execSync } = require("child_process");

const FLUTTER_VERSION = "3.16.5"; // Adjust version as needed

async function installFlutter() {
  console.log("Installing Flutter...");

  // Download Flutter SDK
  execSync(
    `git clone https://github.com/flutter/flutter.git -b stable /opt/flutter`
  );

  // Add Flutter to PATH
  process.env.PATH = `${process.env.PATH}:/opt/flutter/bin`;

  // Run Flutter doctor
  execSync("flutter doctor");

  // Enable web
  execSync("flutter config --enable-web");
}

installFlutter().catch(console.error);
