package com.blotout.reactnativeblotoutsdk

import android.app.Application
import android.widget.Toast
import com.analytics.blotout.BlotoutAnalytics
import com.analytics.blotout.BlotoutAnalyticsConfiguration
import com.analytics.blotout.model.MapIDData
import com.analytics.blotout.model.CompletionHandler
import com.analytics.blotout.model.TransactionData
import com.analytics.blotout.model.Item
import com.analytics.blotout.model.Persona
import com.facebook.react.bridge.*


class RNBlotOutSDKModule(private val reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName() = "RNBlotOutSDKModule"

    override fun getConstants(): MutableMap<String, Any> {
        return hashMapOf("count" to 1)
    }

    /**
     *
     * this initializes the BlotoutAnalytics tracking configuration, it has to be called only once when the
     * application starts, for example in the Application Class or the Main Activities onCreate.
     * @param blotoutSDKKey stage key as String
     * @param endPointUrl End point Url  as String
     */
    @ReactMethod
    fun init(blotoutSDKKey: String, endPointUrl: String, callBack: Callback ) {
        ///Initialize SDK here
        val blotoutAnalyticsConfiguration = BlotoutAnalyticsConfiguration()
        blotoutAnalyticsConfiguration.blotoutSDKKey = blotoutSDKKey
        blotoutAnalyticsConfiguration.endPointUrl = endPointUrl
        BlotoutAnalytics.init(reactContext.applicationContext as Application, blotoutAnalyticsConfiguration, object : CompletionHandler {
            override fun onError(code: Int, msg: String) {
                callBack.invoke(code,msg);
            }
            override fun onSuccess() {
                callBack.invoke();
            }
        })
    }

    /**
     *
     * @param enabled name of the event
     */
    @ReactMethod
    fun enable(enabled: Boolean) {
        BlotoutAnalytics.enable(enabled)
    }

    /**
     *
     * @param eventName name of the event
     * @param eventInfo properties in key/value pair
     */
    @ReactMethod
    fun capture(eventName: String, eventInfo: ReadableMap?) {
        eventInfo?.let {  BlotoutAnalytics.capture(eventName, it.toHashMap())}
    }

    /**
     *
     * @param eventName name of the event
     * @param eventInfo properties in key/value pair
     * @param isPHI
     */
    @ReactMethod
    fun capturePersonal(eventName: String, eventInfo: ReadableMap?, isPHI: Boolean) {
        eventInfo?.let {  BlotoutAnalytics.capturePersonal(eventName, it.toHashMap(),isPHI)}
    }

    /**
     *
     * @param externalID
     * @param providerID
     * @param withInformation properties in key/value pair
     */
    @ReactMethod
    fun mapID(externalID: String,providerID: String,withInformation: ReadableMap) {
        try {
        var mapIdData = MapIDData()
        mapIdData.externalID = externalID
        mapIdData.provider = providerID
        BlotoutAnalytics.mapID(mapIdData, withInformation.toHashMap())
        }catch (e:Exception){
            Toast.makeText(reactContext.applicationContext,e.message!!,Toast.LENGTH_LONG).show()
        }
    }


    @ReactMethod
    fun getUserId(userIDCallback : Callback) {
        try {
            userIDCallback.invoke(BlotoutAnalytics.getUserId())
        }catch (e:Exception){
            Toast.makeText(reactContext.applicationContext,e.message!!,Toast.LENGTH_LONG).show()
        }
    }

    @ReactMethod
    fun transaction(options: ReadableMap,withInformation: ReadableMap) {
        try {

            val transaction_id =  options.getString("transaction_id")
            val transaction_currency =  options.getString("transaction_currency")
            val transaction_payment =  options.getString("transaction_payment")
            val transaction_total =  options.getDouble("transaction_total")
            val transaction_discount =  options.getInt("transaction_discount")
            val transaction_shipping =  options.getInt("transaction_shipping")
            val transaction_tax =  options.getDouble("transaction_tax")

            var transactionData = TransactionData(transaction_id!!,transaction_currency,transaction_payment,
                                                   transaction_total,transaction_discount,transaction_shipping, transaction_tax)

            BlotoutAnalytics.transaction(transactionData, withInformation.toHashMap())
        }catch (e:Exception){
            Toast.makeText(reactContext.applicationContext,e.message!!,Toast.LENGTH_LONG).show()
        }
    }

    @ReactMethod
    fun item(options: ReadableMap,withInformation: ReadableMap) {
        try {
            val item_id =  options.getString("item_id")
            val item_name =  options.getString("item_name")
            val item_sku =  options.getString("item_sku")
            val item_category =  null//options.getArray("item_category")
            val item_price =  options.getInt("item_price")
            val item_currency =  options.getString("item_currency")
            val item_quantity =  options.getInt("item_quantity")
            var itemData = Item(item_id!!,item_name,item_sku,
                                item_category,item_price,item_currency, item_quantity)

            BlotoutAnalytics.item(itemData, withInformation.toHashMap())
        }catch (e:Exception){
            Toast.makeText(reactContext.applicationContext,e.message!!,Toast.LENGTH_LONG).show()
        }
    }

    @ReactMethod
    fun persona(options: ReadableMap,withInformation: ReadableMap) {
        try {

            val persona_id =  options.getString("persona_id")
            val persona_firstname =  options.getString("persona_firstname")
            val persona_lastname =  options.getString("persona_lastname")
            val persona_middlename =  options.getString("persona_middlename")
            val persona_username =  options.getString("persona_username")
            val persona_dob =  options.getString("persona_dob")
            val persona_email =  options.getString("persona_email")

            val persona_number =  options.getString("persona_number")
            val persona_address =  options.getString("persona_address")
            val persona_city =  options.getString("persona_city")
            val persona_state =  options.getString("persona_state")
            val persona_zip =  options.getInt("persona_zip")

            val persona_country =  options.getString("persona_country")
            val persona_gender =  options.getString("persona_gender")
            val persona_age =  options.getInt("persona_age")

            var personaData = Persona(persona_id!!,persona_firstname,persona_lastname,
                                persona_middlename,persona_username,persona_dob, persona_email,
                               persona_number,persona_address, persona_city,persona_state,
                               persona_zip,persona_country,persona_gender,persona_age)

            BlotoutAnalytics.persona(personaData, withInformation.toHashMap())
        }catch (e:Exception){
            Toast.makeText(reactContext.applicationContext,e.message!!,Toast.LENGTH_LONG).show()
        }
    }

}
