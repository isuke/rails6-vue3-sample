path = require('path')
webpack = require('webpack')
{ merge } = require('webpack-merge')

AssetsWebpackPlugin = require('assets-webpack-plugin')
VueLoaderPlugin = require('vue-loader/lib/plugin')
MiniCssExtractPlugin = require('mini-css-extract-plugin')
{ CleanWebpackPlugin } = require('clean-webpack-plugin')

module.exports = (env, argv) =>
  baseConfig =
    entry: './app/frontend/main.coffee'
    output:
      path: path.resolve(__dirname, 'public', 'dist')
    resolve:
      alias:
        'vue$': 'vue/dist/vue.esm.js'
    module:
      rules: [
        {
          test: /\.vue$/,
          loader: 'vue-loader'
        }
        {
          test: /\.pug$/
          use: ['pug-plain-loader']
        }
        {
          test: /\.coffee$/
          use: ['coffee-loader']
        }
        {
          test: /\.css$/
          use: [
            { loader: MiniCssExtractPlugin.loader }
            { loader: 'css-loader', options: { sourceMap: true } }
          ]
        }
        {
          test: /\.scss$/
          use: [
            { loader: MiniCssExtractPlugin.loader }
            { loader: 'css-loader', options: { sourceMap: true } }
            { loader: 'sass-loader', options: { sourceMap: true } }
          ]
        }
        {
          test: /\.(png|jpg|gif|svg)$/
          use: [
            {
              loader: 'file-loader'
              options:
                name: '[name]-[hash].[ext]'
                publicPath: '/dist'
                esModule: false
            }
          ]
        }
      ]
    plugins: [
      new AssetsWebpackPlugin()
      new webpack.HotModuleReplacementPlugin()
      new VueLoaderPlugin()
      new webpack.EnvironmentPlugin(
        BACKEND_URL: process.env.BACKEND_URL
      )
    ]

  if argv.mode == 'development'
    merge baseConfig,
      output:
        filename: '[name].js'
      devServer:
        hot: true
        inline: true
        port: 3100
        contentBase: path.resolve(__dirname, 'public', 'dist')
      plugins: [
        new MiniCssExtractPlugin
          filename: '[name].css'
      ]
  else if argv.mode == 'production'
    merge baseConfig,
      output:
        filename: '[name]-[hash].js'
      plugins: [
        new CleanWebpackPlugin()
        new MiniCssExtractPlugin
          filename: '[name]-[hash].css'
      ]
