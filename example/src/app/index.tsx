import BlotoutSDK from '@blotoutio/sdk-react-native'
import { useEffect } from 'react'

const App = () => {
  useEffect(() => {
    console.log('------------------')
    console.log(BlotoutSDK)
    console.log('------------------')

    ////---------Init---------
    BlotoutSDK.init(
      'Y4BFUDCNNZQZAUE',
      'https://sandbox.blotout.io/sdk/',
      (errorCode: string) => {
        if (errorCode && errorCode.length)
          console.log(`Failed with Error Code ${errorCode}`)
      }
    )
    console.log('Success - Init')

    ////---------Capture---------
    const withInformation = { Platform: 'ReactNative' }
    BlotoutSDK.capture('App Start', withInformation)
    console.log('Success - Capture')

    ////---------Capture Personal---------
    BlotoutSDK.capturePersonal(
      'custom phi event',
      { emailId: 'developers@blotout.io', bloodType: 'A+' },
      true
    )
    console.log('Success - Capture Personal')

    ////---------Get User ID---------
    // const userID = BlotoutSDK.getUserId()
    // console.log("Success - User ID")
    BlotoutSDK.getUserId((userid: string) => {
      console.log(`Success - Get User ID -> ${userid}`)
    })

    ////---------MAP ID API---------
    var externalID = '92j2jr230r-232j9j2342j3-jiji'
    var provider = 'sass'
    BlotoutSDK.mapID(externalID, provider, withInformation)
    console.log('Success - Map ID')

    //---------Transaction API---------
    const transactionData = {
      transaction_id: '12345',
      transaction_currency: 'INR',
      transaction_payment: '123',
      transaction_total: 12345.65,
    }
    BlotoutSDK.transaction(transactionData, null)
    console.log('Success - Transaction')

    //---------Item API---------
    const itemData = {
      item_id: '12345',
      item_name: 'Toy',
      item_sku: '12',
      item_currency: 'INR',
      item_price: '345.54',
    }
    BlotoutSDK.item(itemData, null)
    console.log('Success - Item')

    ////---------Persona API---------
    const personaData = { persona_id: '12345', persona_firstname: 'XYZ CHG' }
    BlotoutSDK.persona(personaData, null)
    console.log('Success - Persona')

    ////---------Enable---------
    BlotoutSDK.enable(true)
    console.log('Success - Enable')
  })

  return null
}

export default App
