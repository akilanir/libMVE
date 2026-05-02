package org.osmdroid.views.overlay.compass;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/views/overlay/compass/IOrientationProvider.class */
public interface IOrientationProvider {
    boolean startOrientationProvider(IOrientationConsumer iOrientationConsumer);

    void stopOrientationProvider();

    float getLastKnownOrientation();
}
