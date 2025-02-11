const { execSync } = require("child_process");

function runCommand(command, options = {}) {
  try {
    execSync(command, { stdio: "inherit", ...options });
  } catch (error) {
    console.error(`Command failed: ${command}`);
    throw error;
  }
}

async function installGo() {
  console.log("Installing Go...");
  // Use apt-get for more reliable installation
  runCommand("sudo apt-get update");
  runCommand("sudo apt-get install -y golang-1.19");

  // Set Go environment variables
  process.env.GOROOT = "/usr/lib/go-1.19";
  process.env.PATH = `${process.env.GOROOT}/bin:${process.env.PATH}`;

  // Verify installation
  runCommand("go version");
}

async function installFlutter() {
  console.log("Installing Flutter...");
  // Download Flutter SDK directly
  runCommand(
    "curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.5-stable.tar.xz"
  );
  runCommand("tar xf flutter_linux_3.16.5-stable.tar.xz -C /opt");

  // Add to PATH and configure
  process.env.PATH = `${process.env.PATH}:/opt/flutter/bin`;
  runCommand("flutter precache");
  runCommand("flutter doctor");
  runCommand("flutter config --enable-web");
}

async function main() {
  try {
    await installGo();
    await installFlutter();
  } catch (error) {
    console.error("Setup failed:", error);
    process.exit(1);
  }
}

main();
