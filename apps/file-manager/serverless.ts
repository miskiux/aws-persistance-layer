const { baseServerlessConfig } = require("../../config/serverless-base");


module.exports = {
  ...baseServerlessConfig,
  service: "file-manager",
  functions: {
    main: {
      handler: "dist/main.handler",
      vpc: {
        securityGroupIds: ['sg-0d90f6e9f117033ad'],
        subnetIds: ['subnet-0b682f62ef01d2f59', 'subnet-0880759320c935ae2'],
      },
      fileSystemConfig: {
        localMountPath: "${env:AWS_EFS_LOCAL_PATH}",
        arn: "arn:aws:elasticfilesystem:eu-central-1:705628343073:access-point/fsap-0cc77fdd30218dee9",
      },
      events: [
        {
          httpApi: {
            path: "/{proxy+}",
            method: "GET",
          },
        },
      ],
    },
  },
};
