import BlotoutSDK from '@blotoutio/sdk-react-native'
import { useEffect } from 'react'

const App = () => {
  useEffect(() => {
    console.log('------------------')
    console.log(BlotoutSDK)
    console.log('------------------')

    ////---------Init---------
    BlotoutSDK.init('Y4BFUDCNNZQZAUE', 'https://sandbox.blotout.io/sdk/')

    ////---------Capture---------
    const withInformation = { Platform: 'ReactNative' }
    BlotoutSDK.capture('App Start', withInformation)

    ////---------Capture Personal---------
    BlotoutSDK.capturePersonal(
      'custom phi event',
      { emailId: 'developers@blotout.io', bloodType: 'A+' },
      true
    )

    ////---------Get User ID---------
    //BlotoutSDK.getUserId((userid: any) => console.log(userid))
    const userID = BlotoutSDK.getUserId()
    console.log(userID)

    ////---------MAP ID API---------
    var externalID = '92j2jr230r-232j9j2342j3-jiji'
    var provider = 'sass'
    BlotoutSDK.mapID(externalID, provider, withInformation)

    //---------Transaction API---------
    const transactionData = {
      transaction_id: '12345',
      transaction_currency: 'INR',
      transaction_payment: '123',
      transaction_total: 12345.65,
    }
    BlotoutSDK.transaction(transactionData, null)

    //---------Item API---------
    const itemData = {
      item_id: '12345',
      item_name: 'Toy',
      item_sku: '12',
      item_currency: 'INR',
      item_price: '345.54',
    }
    BlotoutSDK.item(itemData, null)

    ////---------Persona API---------
    const personaData = { persona_id: '12345', persona_firstname: 'XYZ CHG' }
    BlotoutSDK.persona(personaData, null)
  })

  return null
}

export default App
