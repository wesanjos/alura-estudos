import { execSync } from "child_process";

console.log("[DEPLOY_PREVIEW]: Start");

const command = "yarn deploy:staging";
const output = execSync(command, { encoding: "utf8" });

const outputLines = output.split("\n");
const DEPLOY_URL = outputLines[outputLines.length - 1];

console.log("[DEPLOY_PREVIEW]: End");

console.log(`You can see the deploy preview on: ${DEPLOY_URL}`);
