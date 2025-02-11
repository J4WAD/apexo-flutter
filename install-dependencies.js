const { execSync } = require("child_process");
const https = require("https");
const fs = require("fs");
const path = require("path");

async function installGo() {
  console.log("Installing Go 1.19...");
  const GO_VERSION = "1.19";
  const GO_URL = `https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz`;

  // Download and extract Go
  execSync(`curl -OL ${GO_URL}`);
  execSync("rm -rf /usr/local/go");
  execSync("tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz");

  // Set Go environment variables
  process.env.GOROOT = "/usr/local/go";
  process.env.PATH = `${process.env.GOROOT}/bin:${process.env.PATH}`;

  console.log("Go installation completed");
}

async function installFlutter() {
  console.log("Installing Flutter...");
  execSync(
    "git clone https://github.com/flutter/flutter.git -b stable /opt/flutter"
  );
  process.env.PATH = `${process.env.PATH}:/opt/flutter/bin`;
  execSync("flutter doctor");
  execSync("flutter config --enable-web");
}

async function main() {
  await installGo();
  await installFlutter();
}

main().catch(console.error);
