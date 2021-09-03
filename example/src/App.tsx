import React, { useEffect } from 'react'
import RNBlotOutSDKModule, { Counter } from 'react-native-blotout-sdk'

const App = () => {
  useEffect(() => {
    console.log(RNBlotOutSDKModule)
    RNBlotOutSDKModule.initializeAnalyticsEngine(
      'Y4BFUDCNNZQZAUE',
      'https://sandbox.blotout.io/sdk/'
    )
    const withInformation = new Map<'Platform', 'ReactNative'>()
    RNBlotOutSDKModule.capture('App Start', withInformation)
  })

  return <Counter />
}

export default App
