# Defined Events

## mapID
The `mapID` method allows you to map external services to Blotout ID.

#### Input

|                  |          |          |                                                            |
| ---------------- | -------- | -------- | ---------------------------------------------------------- |
| `externalID`     | `String` | Required | External ID that you want to link to Blotout ID.           |
| `provider`       | `String` | Required | Provider that generated external ID, for example `hubspot` |
| `additionalData` | `Object` | Optional | You can provide some additional data to this event. There is no limitation as this is just a key-value pair send to the server. |


#### Example
```js
import RNBlotOutSDKModule from '@blotoutio/sdk-react-native';

const externalID = '92j2jr230r-232j9j2342j3-jiji'
const provider = 'sass'
RNBlotOutSDKModule.mapID(externalID, provider, null)
```
