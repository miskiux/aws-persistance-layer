const { baseServerlessConfig } = require("../../config/serverless-base");


module.exports = {
  ...baseServerlessConfig,
  service: "file-manager",
  functions: {
    main: {
      handler: "dist/main.handler",
      vpc: {
        securityGroupIds: ['sg-03c374bdac1d3e618'],
        subnetIds: ['subnet-0b682f62ef01d2f59', 'subnet-0880759320c935ae2'],
      },
      fileSystemConfig: {
        localMountPath: "${env:AWS_EFS_LOCAL_PATH}",
        arn: "arn:aws:elasticfilesystem:eu-central-1:705628343073:access-point/fsap-04921b4c555310d76",
      },
      events: [],
    },
  },
};