import React, { useEffect } from 'react'
import RNBlotOutSDKModule, { Counter } from 'react-native-blotout-sdk'

const App = () => {
  useEffect(() => {
    console.log(RNBlotOutSDKModule)
  })

  return <Counter />
}

export default App
