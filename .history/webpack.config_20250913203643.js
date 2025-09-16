const path = require("path");
const webpack = require("webpack");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  mode: "production",           // Change to "development" for dev builds
  devtool: "source-map",        // Generates source maps for easier debugging
  entry: {
    application: "./app/javascript/application.js",
    // Uncomment/add more entrypoints if needed
    // admin: "./app/javascript/admin.js"
  },
  resolve: {
    modules: ["app/javascript", "node_modules"], // Like Webpacker, allows import 'channels'
  },
  output: {
    filename: "[name].js",
    sourceMapFilename: "[file].map",
    chunkFormat: "module",
    path: path.resolve(__dirname, "app/assets/builds"),
  },
  plugins: [
    new MiniCssExtractPlugin(), // Extracts CSS/SCSS into separate files
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1,             // Ensures a single JS bundle per entrypoint
    }),
  ],
  module: {
    rules: [
      {
        test: /\.(js)$/,        // Babel loader for JS
        exclude: /node_modules/,
        use: ["babel-loader"],
      },
      {
        test: /\.s[ac]ss$/i,    // Sass/SCSS loader
        use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"],
      },
    ],
  },
};
