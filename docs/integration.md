# Integration

## Add Blotout Analytics SDK into your project

To add the SDK to the React native project, Please add `@blotoutio/sdk-react-native` as devDependencies in your project's package.json .

`npm i --save-dev @blotoutio/sdk-react-native`


## Initialization
 Please initialize the BlotoutAnalytics in Application class.

```js
import BlotoutSDK from '@blotoutio/sdk-react-native';

BlotoutSDK.init(
      'Y4BFUDCNNZQZAUE',
      'https://sandbox.blotout.io/sdk/',
      (errorCode: string) => {
        if (errorCode && errorCode.length)
          console.log(`Failed with Error Code ${errorCode}`)
      }
    )
```
