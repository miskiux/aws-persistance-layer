export const baseServerlessConfig = {
    useDotenv: true,
    provider: {
        name: "aws",
        runtime: "nodejs20.x",
        region: "${env:AWS_REGION}",
        memorySize: 512,
        timeout: 10,
    },
    plugins: ["serverless-offline"],
}
