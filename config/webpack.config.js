const path = require('path');

module.exports = (env) => {

    return {
        entry: `./apps/${env.application_name}/src/main.ts`,
        mode: 'production',
        target: "node",
        module: {
            rules: [
                {
                    test: /\.ts?$/,
                    use: [
                        {
                            loader: 'ts-loader',
                            options: {
                                transpileOnly: true
                            }
                        }
                    ],
                    exclude: /node_modules/,
                }
            ]
        },
        resolve: {
            extensions: [".ts", ".js", ".json"],
        },
        externals: [],
        output: {
            filename: "[name].js",
            path: path.resolve(__dirname, `../apps/${env.application_name}/dist`),
            libraryTarget: "commonjs2",
        },
    };
};
