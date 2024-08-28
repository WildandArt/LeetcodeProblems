#!/bin/bash

# Usage: ./create_leetcode_problem.sh "Problem Name" ProblemID

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 \"Problem Name\" ProblemID"
  exit 1
fi

# Arguments
PROBLEM_NAME=$1
PROBLEM_ID=$2

# Convert problem name to camel case with first letter lowercase (e.g., "Is Same Tree" -> "isSameTree")
PROBLEM_CAMEL_CASE=$(echo "$PROBLEM_NAME" | sed -r 's/(^| )(\w)/\U\2/g' | sed -r 's/ //g')
PROBLEM_CAMEL_CASE=$(echo "$PROBLEM_CAMEL_CASE" | sed -r 's/^./\L&/')

# Create folder path
FOLDER_PATH="LeetcodeProblems/src/main/java/com/artozersky/leetcode/${PROBLEM_CAMEL_CASE}${PROBLEM_ID}"

# Create the directory structure
mkdir -p "$FOLDER_PATH"

# Create the Java file
JAVA_CLASS_NAME="${PROBLEM_CAMEL_CASE}${PROBLEM_ID}.java"
touch "$FOLDER_PATH/$JAVA_CLASS_NAME"

# Create the Test file
TEST_FOLDER_PATH="LeetcodeProblems/src/test/java/com/artozersky/leetcode/${PROBLEM_CAMEL_CASE}${PROBLEM_ID}"
mkdir -p "$TEST_FOLDER_PATH"
TEST_CLASS_NAME="${PROBLEM_CAMEL_CASE}${PROBLEM_ID}Test.java"
touch "$TEST_FOLDER_PATH/$TEST_CLASS_NAME"

# Optionally, create a README file in the problem's folder
README_PATH="LeetcodeProblems/src/main/java/com/artozersky/leetcode/${PROBLEM_CAMEL_CASE}${PROBLEM_ID}/README.md"
touch "$README_PATH"

# Output the structure created
echo "Created folder structure for: $PROBLEM_NAME ($PROBLEM_ID)"
tree "LeetcodeProblems/src/main/java/com/artozersky/leetcode/${PROBLEM_CAMEL_CASE}${PROBLEM_ID}"

