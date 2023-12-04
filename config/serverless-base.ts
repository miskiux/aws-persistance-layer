export const baseServerlessConfig = {
    provider: {
        name: "aws",
        runtime: "nodejs20.x",
        region: "eu-central-1",
        memorySize: 512,
        timeout: 10,
    },
}
