/**
 * Metro configuration for React Native
 * https://github.com/facebook/react-native
 *
 * @format
 */

const path = require('path')
const exclusionList = require('metro-config/src/defaults/exclusionList')

const moduleRoot = path.resolve(__dirname, '..')

module.exports = {
  watchFolders: [moduleRoot],
  resolver: {
    providesModuleNodeModules: ['@blotoutio/sdk-react-native'],
    extraNodeModules: {
      react: path.resolve(__dirname, 'node_modules/react'),
      'react-native': path.resolve(__dirname, 'node_modules/react-native'),
      '@blotoutio/sdk-react-native': path.resolve(
        __dirname,
        'node_modules/@blotoutio/sdk-react-native'
      ),
    },
    blockList: exclusionList([
      new RegExp(`${moduleRoot}/node_modules/react/.*`),
      new RegExp(`${moduleRoot}/node_modules/react-native/.*`),
    ]),
  },
  transformer: {
    getTransformOptions: async () => ({
      transform: {
        experimentalImportSupport: false,
        inlineRequires: true,
      },
    }),
  },
}
