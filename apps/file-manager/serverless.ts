const { baseServerlessConfig } = require("../../config/serverless-base");


module.exports = {
  ...baseServerlessConfig,
  service: "file-manager-app",
  functions: {
    main: {
      handler: "dist/main.handler",
      vpcEndpointIds: ["vpce-01b62e3bcf0cfac40"],
      vpc: {
        securityGroupIds: ["sg-03077987e3501afff", "sg-0e462f92292eead39"],
        subnetIds: ["subnet-09d7b92cf1db57efe", "subnet-0b712119533e251c9"],
      },
      fileSystemConfig: {
        localMountPath: "${env:AWS_EFS_LOCAL_PATH}",
        arn: "arn:aws:elasticfilesystem:eu-central-1:705628343073:access-point/fsap-084e957fd5a982a27",
      },
      events: [],
    },
  },
};