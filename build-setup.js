const { execSync } = require("child_process");
const os = require("os");
const path = require("path");

function execute(command) {
  console.log(`Executing: ${command}`);
  execSync(command, { stdio: "inherit" });
}

async function setup() {
  try {
    // Use home directory for installations
    const HOME = os.homedir();
    const FLUTTER_HOME = path.join(HOME, ".flutter");

    // Create directories
    execute(`mkdir -p ${FLUTTER_HOME}`);

    // Download Flutter
    console.log("Installing Flutter...");
    process.chdir(HOME);
    execute(
      "wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.5-stable.tar.xz"
    );
    execute(`tar xf flutter_linux_3.16.5-stable.tar.xz -C ${FLUTTER_HOME}`);

    // Set environment variables
    process.env.FLUTTER_ROOT = path.join(FLUTTER_HOME, "flutter");
    process.env.PATH = `${process.env.FLUTTER_ROOT}/bin:${process.env.PATH}`;

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
