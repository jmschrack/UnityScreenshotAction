#!/usr/bin/env bash

set -e
set -x

export SCREENSHOT_PATH=$PROJECT_DIR/Screenshots
mkdir -p $SCREENSHOT_PATH

${UNITY_EXECUTABLE:-xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' unity-editor} \
	  -projectPath $PROJECT_DIR \
	  -quit \
	  -batchmode \
	  -buildTarget $BUILD_TARGET \
	  -executeMethod ScreenshotPipeline.TakeScreenshots \
	  -logFile /dev/stdout

UNITY_EXIT_CODE=$?
ls -la $SCREENSHOT_PATH
