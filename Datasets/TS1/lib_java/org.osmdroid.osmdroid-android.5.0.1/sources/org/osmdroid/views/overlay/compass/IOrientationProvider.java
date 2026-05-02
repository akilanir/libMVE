package org.osmdroid.views.overlay.compass;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/overlay/compass/IOrientationProvider.class */
public interface IOrientationProvider {
    boolean startOrientationProvider(IOrientationConsumer iOrientationConsumer);

    void stopOrientationProvider();

    float getLastKnownOrientation();
}
