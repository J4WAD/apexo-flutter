const download = require("download");
const extract = require("extract-zip");
const path = require("path");
const fs = require("fs");

async function installFlutter() {
  // Download Flutter SDK
  console.log("Downloading Flutter SDK...");
  const flutterZip = await download(
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.19.0-stable.zip"
  );

  fs.writeFileSync("flutter.zip", flutterZip);

  // Extract Flutter
  console.log("Extracting Flutter SDK...");
  await extract("flutter.zip", { dir: process.cwd() });

  // Add Flutter to PATH
  process.env.PATH = `${process.cwd()}\\flutter\\bin;${process.env.PATH}`;

  // Enable web
  console.log("Enabling Flutter web...");
  require("child_process").execSync("flutter config --enable-web", {
    stdio: "inherit",
  });
}

installFlutter().catch(console.error);
