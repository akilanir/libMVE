package android.support.v4.media;

import android.media.VolumeProvider;

/* loaded from: internal_impl-22.2.1.jar:android/support/v4/media/VolumeProviderCompatApi21.class */
class VolumeProviderCompatApi21 {

    /* loaded from: internal_impl-22.2.1.jar:android/support/v4/media/VolumeProviderCompatApi21$Delegate.class */
    public interface Delegate {
        void onSetVolumeTo(int i);

        void onAdjustVolume(int i);
    }

    VolumeProviderCompatApi21() {
    }

    public static Object createVolumeProvider(int volumeControl, int maxVolume, int currentVolume, final Delegate delegate) {
        return new VolumeProvider(volumeControl, maxVolume, currentVolume) { // from class: android.support.v4.media.VolumeProviderCompatApi21.1
            @Override // android.media.VolumeProvider
            public void onSetVolumeTo(int volume) {
                delegate.onSetVolumeTo(volume);
            }

            @Override // android.media.VolumeProvider
            public void onAdjustVolume(int direction) {
                delegate.onAdjustVolume(direction);
            }
        };
    }

    public static void setCurrentVolume(Object volumeProviderObj, int currentVolume) {
        ((VolumeProvider) volumeProviderObj).setCurrentVolume(currentVolume);
    }
}
