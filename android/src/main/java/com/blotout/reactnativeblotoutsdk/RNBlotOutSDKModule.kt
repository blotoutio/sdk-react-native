package com.blotout.reactnativeblotoutsdk

import android.app.Application
import android.widget.Toast
import com.analytics.blotout.BlotoutAnalytics
import com.analytics.blotout.BlotoutAnalyticsConfiguration
import com.analytics.blotout.model.MapIDData
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
    fun initializeAnalyticsEngine(blotoutSDKKey: String, endPointUrl: String) {
        ///Initialize SDK here
        val blotoutAnalyticsConfiguration = BlotoutAnalyticsConfiguration()
        blotoutAnalyticsConfiguration.blotoutSDKKey = blotoutSDKKey
        blotoutAnalyticsConfiguration.endPointUrl = endPointUrl
        BlotoutAnalytics.init(reactContext.applicationContext as Application, blotoutAnalyticsConfiguration)
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

}
