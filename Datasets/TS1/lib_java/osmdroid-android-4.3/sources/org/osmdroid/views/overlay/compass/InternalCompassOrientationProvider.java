package org.osmdroid.views.overlay.compass;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/compass/InternalCompassOrientationProvider.class */
public class InternalCompassOrientationProvider implements SensorEventListener, IOrientationProvider {
    private IOrientationConsumer mOrientationConsumer;
    private final SensorManager mSensorManager;
    private float mAzimuth;

    public InternalCompassOrientationProvider(Context context) {
        this.mSensorManager = (SensorManager) context.getSystemService("sensor");
    }

    @Override // org.osmdroid.views.overlay.compass.IOrientationProvider
    public boolean startOrientationProvider(IOrientationConsumer orientationConsumer) {
        this.mOrientationConsumer = orientationConsumer;
        boolean result = false;
        Sensor sensor = this.mSensorManager.getDefaultSensor(3);
        if (sensor != null) {
            result = this.mSensorManager.registerListener(this, sensor, 2);
        }
        return result;
    }

    @Override // org.osmdroid.views.overlay.compass.IOrientationProvider
    public void stopOrientationProvider() {
        this.mOrientationConsumer = null;
        this.mSensorManager.unregisterListener(this);
    }

    @Override // org.osmdroid.views.overlay.compass.IOrientationProvider
    public float getLastKnownOrientation() {
        return this.mAzimuth;
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent event) {
        if (event.sensor.getType() == 3 && event.values != null) {
            this.mAzimuth = event.values[0];
            if (this.mOrientationConsumer != null) {
                this.mOrientationConsumer.onOrientationChanged(this.mAzimuth, this);
            }
        }
    }
}
