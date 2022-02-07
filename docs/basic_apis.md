# API

## init
The `init` method is used for initializing SDK. This sets all required configurations and also sends system event `sdk_start` which allows it to record user.

### Input
|                  |                      |         |                                                        |
| ---------------- |----------------------|---------| -------------------------------------------------------|
| `token`          | `String`             | Required | Application token that you can get in your dashboard.  |
| `endpointUrl`    | `String`             | Required | Url where you will be sending data. |
| `comletionHandler` | `CompletionHandler` | Required | Return callback for sdk success and failure|                                              


#### Example
```js
import BlotoutSDK from '@blotoutio/sdk-react-native';

init(
  '3WBQ5E48ND3VTPC',
  'https://domain.com/sdk',
  (errorCode: string) => {
        if (errorCode && errorCode.length)
          console.log(`Failed with Error Code ${errorCode}`)
      }
);
```

## capture
The `capture` method is used to record developer events. This allows you to send custom events to the server when a user is interacting with the app. For example, one custom event would be when a user adds an item to a cart.

#### Input
|                  |          |          |    |
|------------------|----------|----------|-----|
| `eventName`      | `String` |          | Name of the event that you are sending                                                                                         |
| `additionalData` | `Object` | Optional | You can provide some additional data to this event. There is no limitation as this is just a key-value pair send to the server. |

#### Example
```js
import BlotoutSDK from '@blotoutio/sdk-react-native';

BlotoutSDK.capture('Add to Cart')
BlotoutSDK.capture('Add to Cart', { SKU: '12312321' })
```

## capturePersonal
PII (Personal Identifiable Information) events are like developer codified events that carry sensitive information related to the user.
PHI ( Protected Health Information) events are like PII, but carry user’s private health information.
In Blotout managed or deployed Infrastructure, PII and PHI events data is encrypted using asymmetric encryption algorithms and provides access to authenticated users only.

#### Input
|             |           |          |          |
|-------------|-----------|----------|---------|
| `eventName` | `String`  |          | Name of the event that you are sending                                                                                         |
| `eventInfo` | `Object`  |          | You can provide some additional data to this event. There is no limitation as this is just a key-value pair send to the server. |
| `isPHI`     | `Boolean` | Optional | You can specify specific event type to an event                                                                                |


#### Example
```js
import RNBlotOutSDKModule from '@blotoutio/sdk-react-native';

BlotoutSDK.capturePersonal(
  'custom phi event',
  { emailId: 'developers@blotout.io', bloodType: 'A+' },
  true
)
```

## getUserId
The `getUserId` method allows you to go get Blotout user id that is linked to all data that is sent to the server.

#### Output
Returns user ID as `string`.

#### Example
```js
import BlotoutSDK from '@blotoutio/sdk-react-native';

BlotoutSDK.getUserId((userid: any) => console.log(userid))
```


## enable
The `enable` method allows you to enable/disable the sending of analytics data. Enabled by default.

#### Example
```js
import BlotoutSDK from '@blotoutio/sdk-react-native';

BlotoutSDK.enable(true)
```
