package com.google.android.exoplayer.audio;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioCapabilitiesReceiver.class */
public final class AudioCapabilitiesReceiver {
    private final Context context;
    private final Listener listener;
    private final BroadcastReceiver receiver;
    AudioCapabilities audioCapabilities;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioCapabilitiesReceiver$Listener.class */
    public interface Listener {
        void onAudioCapabilitiesChanged(AudioCapabilities audioCapabilities);
    }

    public AudioCapabilitiesReceiver(Context context, Listener listener) {
        this.context = (Context) Assertions.checkNotNull(context);
        this.listener = (Listener) Assertions.checkNotNull(listener);
        this.receiver = Util.SDK_INT >= 21 ? new HdmiAudioPlugBroadcastReceiver() : null;
    }

    public AudioCapabilities register() {
        Intent stickyIntent = this.receiver == null ? null : this.context.registerReceiver(this.receiver, new IntentFilter("android.media.action.HDMI_AUDIO_PLUG"));
        this.audioCapabilities = AudioCapabilities.getCapabilities(stickyIntent);
        return this.audioCapabilities;
    }

    public void unregister() {
        if (this.receiver != null) {
            this.context.unregisterReceiver(this.receiver);
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioCapabilitiesReceiver$HdmiAudioPlugBroadcastReceiver.class */
    private final class HdmiAudioPlugBroadcastReceiver extends BroadcastReceiver {
        private HdmiAudioPlugBroadcastReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (!isInitialStickyBroadcast()) {
                AudioCapabilities newAudioCapabilities = AudioCapabilities.getCapabilities(intent);
                if (!newAudioCapabilities.equals(AudioCapabilitiesReceiver.this.audioCapabilities)) {
                    AudioCapabilitiesReceiver.this.audioCapabilities = newAudioCapabilities;
                    AudioCapabilitiesReceiver.this.listener.onAudioCapabilitiesChanged(newAudioCapabilities);
                }
            }
        }
    }
}
