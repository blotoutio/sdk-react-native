import RNBlotOutSDKModule from '@blotoutio/sdk-react-native'
import { useEffect } from 'react'

const App = () => {
  useEffect(() => {
    console.log(RNBlotOutSDKModule)
    RNBlotOutSDKModule.init(
      'Y4BFUDCNNZQZAUE',
      'https://sandbox.blotout.io/sdk/',
      (errorCode: any) => {
        console.log(`Created a new event with id ${errorCode}`)
      }
    )
    const withInformation = new Map()
    withInformation.set('Platform', 'ReactNative')
    RNBlotOutSDKModule.capture('App Start', withInformation)

    RNBlotOutSDKModule.capturePersonal(
      'custom phi event',
      { emailId: 'developers@blotout.io', bloodType: 'A+' },
      true
    )
    ////---------Get User ID---------
    RNBlotOutSDKModule.getUserId((userid: any) => console.log(userid))
    ////---------MAP ID API---------
    var externalID = '92j2jr230r-232j9j2342j3-jiji'
    var provider = 'sass'
    RNBlotOutSDKModule.mapID(externalID, provider, withInformation)
    //---------Transaction API---------
    const transactionData = new Map()
    transactionData.set('transaction_id', '12345')
    transactionData.set('transaction_currency', 'INR')
    transactionData.set('transaction_payment', '123')
    transactionData.set('transaction_total', 12345.65)
    RNBlotOutSDKModule.transaction(transactionData, null)
    //---------Item API---------
    const itemData = new Map()
    itemData.set('item_id', '12345')
    itemData.set('item_name', 'Toy')
    itemData.set('item_sku', '12')
    itemData.set('item_currency', 'INR')
    RNBlotOutSDKModule.item(itemData, null)
    ////---------Persona API---------
    const personaData = new Map()
    personaData.set('persona_id', '12345')
    personaData.set('persona_firstname', 'XYZ CHG')
    RNBlotOutSDKModule.persona(personaData, null)
  })

  return null
}

export default App
