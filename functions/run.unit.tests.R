
library(RUnit)

test.suite <- defineTestSuite("R Blog Builder Unit Tests",
                              dirs = file.path(sprintf("%s/functions/unit-tests", getwd())),
                              testFileRegexp = '^\\d+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)
