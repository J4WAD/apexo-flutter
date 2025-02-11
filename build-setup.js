const { execSync } = require("child_process");
const path = require("path");

function execute(command) {
  console.log(`Executing: ${command}`);
  execSync(command, { stdio: "inherit" });
}

async function setup() {
  try {
    // Create directories with proper permissions
    execute("mkdir -p /opt/flutter");
    execute("mkdir -p /opt/go");

    // Install required tools
    execute("apt-get update && apt-get install -y wget unzip");

    // Download and install Flutter
    console.log("Installing Flutter...");
    execute(
      "wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.5-stable.tar.xz"
    );
    execute("tar xf flutter_linux_3.16.5-stable.tar.xz -C /opt");
    execute("chmod -R 755 /opt/flutter");

    // Set environment
    process.env.PATH = `${process.env.PATH}:/opt/flutter/bin`;

    // Configure Flutter
    execute("flutter config --no-analytics");
    execute("flutter config --enable-web");
    execute("flutter doctor");

    // Clean up
    execute("rm flutter_linux_3.16.5-stable.tar.xz");

    console.log("Setup completed successfully");
  } catch (error) {
    console.error("Setup failed:", error);
    process.exit(1);
  }
}

setup();
