# Defined Events

## mapID
The `mapID` method allows you to map external services to Blotout ID.

#### Input
`fun mapId( externalID,   provider, {})`

#### Input parameter

|              |          |          |                                                            |
| ------------ | -------- | -------- | ---------------------------------------------------------- |
| `externalID` | `String` | Required | External ID that you want to link to Blotout ID.           |
| `provider`   | `String` | Required | Provider that generated external ID, for example `hubspot` |


#### Example
```React Native
    var externalID = '92j2jr230r-232j9j2342j3-jiji'
    var provider = 'sass'
    RNBlotOutSDKModule.mapID(externalID, provider, null)
```
