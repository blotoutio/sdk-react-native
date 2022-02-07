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
import BlotoutSDK from '@blotoutio/sdk-react-native';

const externalID = '92j2jr230r-232j9j2342j3-jiji'
const provider = 'sass'
BlotoutSDK.mapID(externalID, provider, null)
```
## transaction

The `transaction` method allows you to record transactions in your system, like purchase in ecommerce.

#### Input

|                  |          |          |                                                                                                                                 |
| ---------------- | -------- | -------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `transactionData`      | `TransactionData` | Required | See data table.                                                                                                                 |
| `additionalData` | `Object` | Optional | You can provide some additional data to this event. There is no limitation as this is just a key-value pair send to the server. |
                                                                                         |

#### Data

|              |          |          |                                                            |
| ------------ | -------- | -------- | ---------------------------------------------------------- |
| `transaction_id` | `String` | Required | Transaction ID.           |
| `transaction_currency`   | `String` | Optional | Currency used for the transaction. Example: `EUR` |
| `transaction_payment`   | `String` | Optional | Payment type used in the transaction. Example: `credit-card` |
| `transaction_total`   | `Double` | Optional | Total amount for the transaction. Example `10.50` |
| `transaction_discount`   | `Double` | Optional | Discount that was applied in the transaction. Example: `2.1` |
| `transaction_shipping`   | `Double` | Optional | Shipping that was charged in the transaction. Example: `5.0` |
| `transaction_tax`   | `Double` | Optional | How much tax was applied in the transaction. Example: `1.21` |

#### Example

```js
const transactionData = {
  transaction_id: '12345',
  transaction_currency: 'INR',
  transaction_payment: '123',
  transaction_total: 12345.65,
}
BlotoutSDK.transaction(transactionData, null)
```


## item

The `item` method allows you to record item in your system, like add to cart in ecommerce.

#### Input

|                  |          |          |                                                                                                                                 |
| ---------------- | -------- | -------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `data`      | `Item` | Required | See data table.                                                                                                                 |
| `additionalData` | `Object` | Optional | You can provide some additional data to this event. There is no limitation as this is just a key-value pair send to the server. |

#### Data

|              |          |          |                                                            |
| ------------ | -------- | -------- | ---------------------------------------------------------- |
| `item_id` | `String` | Required | Item ID.           |
| `item_name`   | `String` | Optional | Example: `Phone 4` |
| `item_sku`   | `String` | Optional | Example: `SHOP-01` |
| `item_category`   | `Array` | Optional | Example `['mobile', 'free-time]` |
| `item_currency`   | `String` | Optional | Currency of item price. Example: `EUR` |
| `item_price`   | `Double` | Optional | Example: `2.1` |
| `quantity`   | `Double` | Optional | Example: `3` |

#### Example



```js
const itemData = {
  item_id: '12345',
  item_name: 'Toy',
  item_sku: '12',
  item_currency: 'INR',
  item_price: '345.54',
}
BlotoutSDK.item(itemData, null)
```


## persona

The `persona` method allows you to record persona in your system, like when user signs up or saves user profile.

#### Input

|                  |          |          |                                                                                                                                 |
| ---------------- | -------- | -------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `data`      | `Object` | Required | See data table.                                                                                                                 |
| `additionalData` | `Object` | Optional | You can provide some additional data to this event. There is no limitation as this is just a key-value pair send to the server. |

#### Data

|              |          |          |                                                            |
| ------------ | -------- | -------- | ---------------------------------------------------------- |
| `persona_id` | `String` | Required | Persona ID.           |
| `persona_firstname`   | `String` | Optional | Example: `John` |
| `persona_lastname`   | `String` | Optional | Example: `Smith` |
| `persona_middlename`   | `String` | Optional | Example `Jack` |
| `persona_username`   | `String` | Optional | Example: `jsmith` |
| `persona_dob`   | `String` | Optional | Date of birth. Example: `04/30/2000` |
| `persona_email`   | `String` | Optional | Example: `john@domain.com` |
| `persona_number`   | `String` | Optional | Example: `+386 31 777 444` |
| `persona_address`   | `String` | Optional | Example: `Street 1` |
| `persona_city`   | `String` | Optional | Example: `San Francisco` |
| `persona_state`   | `String` | Optional | Example: `CA` |
| `persona_zip`   | `Double` | Optional | Example: `10000` |
| `persona_country`   | `String` | Optional | Example: `US` |
| `persona_gender`   | `String` | Optional | Example: `Female` |
| `persona_age`   | `Double` | Optional | Example: `22` |

#### Example

```js
const personaData = { persona_id: '12345', persona_firstname: 'XYZ CHG' }
BlotoutSDK.persona(personaData, null)
```
