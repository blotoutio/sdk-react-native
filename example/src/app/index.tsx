import RNBlotOutSDKModule from '@blotoutio/sdk-react-native'
import React, { useEffect } from 'react'

const App = () => {
  useEffect(() => {
    console.log(RNBlotOutSDKModule)
    RNBlotOutSDKModule.initializeAnalyticsEngine(
      'Y4BFUDCNNZQZAUE',
      'https://sandbox.blotout.io/sdk/'
    )
    const withInformation = new Map()
    withInformation.set('Platform', 'ReactNative')
    RNBlotOutSDKModule.capture('App Start', withInformation)

    const PHIInfo = new Map()
    PHIInfo.set('emailId', 'developers@blotout.io')
    PHIInfo.set('bloodType', 'A+')
    RNBlotOutSDKModule.capturePersonal(
      'custom phi event',
      { emailId: 'developers@blotout.io', bloodType: 'A+' },
      true
    )

    RNBlotOutSDKModule.getUserId((userid: any) => console.log(userid))

    var externalID = '92j2jr230r-232j9j2342j3-jiji'
    var provider = 'sass'
    RNBlotOutSDKModule.mapID(externalID, provider, null)
  })

  return null
}

export default App
