import { execSync } from "child_process";
import fetch from "node-fetch";

console.log("[DEPLOY_PREVIEW]: Start");

const command = "yarn deploy:staging";
const output = execSync(command, { encoding: "utf8" });

const outputLines = output.split("\n");
const DEPLOY_URL = outputLines[outputLines.length - 1];

console.log("[DEPLOY_PREVIEW]: End");

console.log(`You can see the deploy preview on: ${DEPLOY_URL}`);

console.log("[GITHUB_COMMENT]: Start");

const { GITHUB_TOKEN, GITHUB_REPOSITORY, GITHUB_PR_NUMBER } = process.env;

const GH_COMMENT = `
- Deploy URL: [${DEPLOY_URL}](${DEPLOY_URL})
`;

const defaultHeaders = {};
defaultHeaders["authorization"] = `token ${GITHUB_TOKEN}`;
defaultHeaders["accept"] =
  "application/vnd.github.v3+json; application/vnd.github.antiope-preview+json";
defaultHeaders["content-type"] = "application/json";

fetch(
  `https://api.github.com/repos/${GITHUB_REPOSITORY}/issues/${GITHUB_PR_NUMBER}/comments`,
  {
    headers: defaultHeaders,
    method: "POST",
    body: JSON.stringify({
      body: GH_COMMENT,
    }),
  }
)
  .then((response) => {
    if (response.ok) return response.json();

    throw new Error(response.statusText);
  })
  .catch((error) => {
    console.log("[COMMENT_ON_GITHUB] Error");
    throw new Error(error);
  })
  .finally(() => {
    console.log("[COMMENT_ON_GITHUB]: End");
  });
