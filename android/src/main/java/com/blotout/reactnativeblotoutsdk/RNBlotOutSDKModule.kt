package com.blotout.reactnativeblotoutsdk

import android.app.Application
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
        toMap(eventInfo)?.let { BlotoutAnalytics.capture(eventName, it) }
    }

    /**
     *
     * @param eventName name of the event
     * @param eventInfo properties in key/value pair
     * @param isPHI
     */
    @ReactMethod
    fun capturePersonal(eventName: String, eventInfo: ReadableMap?, isPHI: Boolean) {
        toMap(eventInfo)?.let { BlotoutAnalytics.capturePersonal(eventName, it, isPHI) }
    }

    /**
     *
     * @param mapIDData
     * @param withInformation properties in key/value pair
     */
    @ReactMethod
    fun mapID(mapIDData: MapIDData?, withInformation: ReadableMap?) {
        BlotoutAnalytics.mapID(mapIDData!!, toMap(withInformation))
    }


    @ReactMethod
    fun getUserId(): String? {
        return BlotoutAnalytics.getUserId()
    }

    private fun toMap(readableMap: ReadableMap?): HashMap<String, Any> {

        val map = HashMap<String, Any>()
        val iterator = readableMap!!.keySetIterator()
        while (iterator.hasNextKey()) {
            val key = iterator.nextKey()
            val type = readableMap.getType(key)
            when (type) {
                //ReadableType.Null -> map[key] = null
                ReadableType.Boolean -> map[key] = readableMap.getBoolean(key)
                ReadableType.Number -> map[key] = readableMap.getDouble(key)
                ReadableType.String -> map[key] = readableMap.getString(key)!!
                ReadableType.Map -> map[key] = toMap(readableMap.getMap(key))
                ReadableType.Array -> map[key] = readableMap.getArray(key)!!
            }
        }
        return map
    }
}
