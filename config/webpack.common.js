var path = require("path");
var ManifestRevisionPlugin = require("manifest-revision-webpack-plugin");

var rootAssetPAth = "./app/static";

module.exports = {

    module: {
    
        loaders: [
            {
                test: /\.(jpe?g|png|gif|svg)$/i,
                loaders: [
                    "file?context=" + rootAssetPAth + "&name=[path][name].[hash].[ext]"
                ]
            }
        ]

    },

    plugins: [
        new ManifestRevisionPlugin(path.join("build", "manifest.json"), {
            rootAssetPath: rootAssetPath,
            ignorePaths: ["stylesheets", "/javascript"]
        })
    ]

};
