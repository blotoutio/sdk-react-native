# API

## initializeAnalyticsEngine
The `initializeAnalyticsEngine` method is used for initializing SDK. This sets all required configurations and also sends system event `sdk_start` which allows it to record user.
#### Input
`init(
'XXXX',
'https://XXXX/',
);`

## capture
The `capture` method is used to record developer events. This allows you to send custom events to the server when a user is interacting with the app. For example, one custom event would be when a user adds an item to a cart.
#### Input
`capture(eventName: String, eventInfo: {})`

|||||
|---|---|---|---|
| `eventName` | `String` |  | Name of the event that you are sending |
| `eventInfo` | `Object` | Optional | You can provide some additional data to this event. There is no limitation as this is just a key-value pair send to the server. |

#### Example
```React Native
RNBlotOutSDKModule.capture('App Start', {})
```

## capturePersonal
PII (Personal Identifiable Information) events are like developer codified events that carry sensitive information related to the user.
PHI ( Protected Health Information) events are like PII, but carry user’s private health information.
In Blotout managed or deployed Infrastructure, PII and PHI events data is encrypted using asymmetric encryption algorithms and provides access to authenticated users only.

#### Input
`-capturePersonal(eventName: String, eventInfo: {}, isPHI: Boolean)`

|||||
|---|---|---|---|
| `eventName` | `String` |  | Name of the event that you are sending |
| `eventInfo` | `Object` | | You can provide some additional data to this event. There is no limitation as this is just a key-value pair send to the server. |
| `isPHI` | `Boolean` | Optional | You can specify specific event type to an event|


#### Example
```React Native
RNBlotOutSDKModule.capturePersonal(
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
```React Native
RNBlotOutSDKModule.getUserId((userid: any) => console.log(userid))
```


## enable
The `enable` method allows you to enable/disable the sending of analytics data. Enabled by default.

#### Example
```React Native
RNBlotOutSDKModule.enable(true)
```
