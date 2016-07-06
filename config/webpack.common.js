var path = require("path");
var webpack = require("webpack");

// Third party plugins
var ExtractTextPlugin = require("extract-text-webpack-plugin");
var ManifestRevisionPlugin = require("manifest-revision-webpack-plugin");

// Development asset host, asset location and build output path.
var publicHost = "http://localhost:2992";
var rootAssetPath = "./app/static";
var buildOutputPath = "./build/public";

module.exports = {

    entry: {
        // Chunks that will get written oyt for JS and CSS files.
        app_js: [
            "webpack/hot/dev-server",
            rootAssetPath + "scripts/index"
        ],
        app_css: [
            rootAssetPath + "styles/main"
        ]
    },

    output: {
        path: buildOutputPath,
        publicPath: publicHost + "/assets/",
        filename: "[name].[chunkhash].js",
        chunkFilename: "[id].[chunkhash].js"
    },

    resolve: {
        // Avoid having to require files ith an extension if they are here.
        extensions: ["", ".js", ".jsx", ".css"]
    },

    module: {

        loaders: [
            {
                test: /\.jsx$/,
                loaders: ["react-hot-loader", "babel-loader"],
                exclude: /node_modules/
            },
            {
                test: /\.css$/,
                loader: ExtractTextPlugin.extract("style-loader", "css-loader")
            },
            {
                test: /\.(jpe?g|png|gif|svg)$/i,
                loaders: [
                    "file?context=" + rootAssetPAth + "&name=[path][name].[hash].[ext]",
                    "image?bypassOnDebug&optimizationLevel=7&interlaced=false"
                ]
            }
        ]

    },

    plugins: [
        new webpack.NoErrorsPlugin(),
        new ExtractTextPlugin("[name].[chunkhash].css"),
        new ManifestRevisionPlugin(path.join("build", "manifest.json"), {
            rootAssetPath: rootAssetPath,
            ignorePaths: ["stylesheets", "/javascript"]
        })
    ]

};
