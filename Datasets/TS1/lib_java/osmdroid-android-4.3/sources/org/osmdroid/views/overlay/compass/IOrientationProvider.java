package org.osmdroid.views.overlay.compass;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/compass/IOrientationProvider.class */
public interface IOrientationProvider {
    boolean startOrientationProvider(IOrientationConsumer iOrientationConsumer);

    void stopOrientationProvider();

    float getLastKnownOrientation();
}
