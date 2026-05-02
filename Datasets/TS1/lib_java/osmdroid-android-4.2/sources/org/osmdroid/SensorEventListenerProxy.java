package org.osmdroid;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/SensorEventListenerProxy.class */
public class SensorEventListenerProxy implements SensorEventListener {
    private final SensorManager mSensorManager;
    private SensorEventListener mListener = null;

    public SensorEventListenerProxy(SensorManager pSensorManager) {
        this.mSensorManager = pSensorManager;
    }

    public boolean startListening(SensorEventListener pListener, int pSensorType, int pRate) {
        Sensor sensor = this.mSensorManager.getDefaultSensor(pSensorType);
        if (sensor == null) {
            return false;
        }
        this.mListener = pListener;
        return this.mSensorManager.registerListener(this, sensor, pRate);
    }

    public void stopListening() {
        this.mListener = null;
        this.mSensorManager.unregisterListener(this);
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor pSensor, int pAccuracy) {
        if (this.mListener != null) {
            this.mListener.onAccuracyChanged(pSensor, pAccuracy);
        }
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent pEvent) {
        if (this.mListener != null) {
            this.mListener.onSensorChanged(pEvent);
        }
    }
}
