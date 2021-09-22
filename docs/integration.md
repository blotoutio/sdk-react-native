# Integration

## Add Blotout Analytics SDK into your project

To add the SDK to the React native project, Please add `@blotoutio/sdk-react-native` as devDependencies in your project's package.json .

`npm i --save-dev @blotoutio/sdk-react-native`


## Initialization
 Please initialize the BlotoutAnalytics in Application class.

```React Native
import RNBlotOutSDKModule from '@blotoutio/sdk-react-native';

RNBlotOutSDKModule.init(
  '[TOKEN]',
  '[SDK_ENDPOINT]',
);
```
