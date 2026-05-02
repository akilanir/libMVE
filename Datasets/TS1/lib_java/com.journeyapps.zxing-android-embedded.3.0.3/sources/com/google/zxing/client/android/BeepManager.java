package com.google.zxing.client.android;

import android.app.Activity;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Vibrator;
import android.util.Log;
import java.io.Closeable;
import java.io.IOException;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.3.jar:com/google/zxing/client/android/BeepManager.class */
public final class BeepManager implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, Closeable {
    private static final String TAG = BeepManager.class.getSimpleName();
    private static final float BEEP_VOLUME = 0.1f;
    private static final long VIBRATE_DURATION = 200;
    private final Activity activity;
    private boolean playBeep;
    private boolean beepEnabled = true;
    private boolean vibrateEnabled = false;
    private MediaPlayer mediaPlayer = null;

    public BeepManager(Activity activity) {
        this.activity = activity;
        updatePrefs();
    }

    public boolean isBeepEnabled() {
        return this.beepEnabled;
    }

    public void setBeepEnabled(boolean beepEnabled) {
        this.beepEnabled = beepEnabled;
    }

    public boolean isVibrateEnabled() {
        return this.vibrateEnabled;
    }

    public void setVibrateEnabled(boolean vibrateEnabled) {
        this.vibrateEnabled = vibrateEnabled;
    }

    public synchronized void updatePrefs() {
        this.playBeep = shouldBeep(this.beepEnabled, this.activity);
        if (this.playBeep && this.mediaPlayer == null) {
            this.activity.setVolumeControlStream(3);
            this.mediaPlayer = buildMediaPlayer(this.activity);
        }
    }

    public synchronized void playBeepSoundAndVibrate() {
        if (this.playBeep && this.mediaPlayer != null) {
            this.mediaPlayer.start();
        }
        if (this.vibrateEnabled) {
            Vibrator vibrator = (Vibrator) this.activity.getSystemService("vibrator");
            vibrator.vibrate(VIBRATE_DURATION);
        }
    }

    private static boolean shouldBeep(boolean beep, Context activity) {
        boolean shouldPlayBeep = beep;
        if (shouldPlayBeep) {
            AudioManager audioService = (AudioManager) activity.getSystemService("audio");
            if (audioService.getRingerMode() != 2) {
                shouldPlayBeep = false;
            }
        }
        return shouldPlayBeep;
    }

    private MediaPlayer buildMediaPlayer(Context activity) {
        MediaPlayer mediaPlayer = new MediaPlayer();
        mediaPlayer.setAudioStreamType(3);
        mediaPlayer.setOnCompletionListener(this);
        mediaPlayer.setOnErrorListener(this);
        try {
            AssetFileDescriptor file = activity.getResources().openRawResourceFd(R.raw.zxing_beep);
            try {
                mediaPlayer.setDataSource(file.getFileDescriptor(), file.getStartOffset(), file.getLength());
                file.close();
                mediaPlayer.setVolume(BEEP_VOLUME, BEEP_VOLUME);
                mediaPlayer.prepare();
                return mediaPlayer;
            } catch (Throwable th) {
                file.close();
                throw th;
            }
        } catch (IOException ioe) {
            Log.w(TAG, ioe);
            mediaPlayer.release();
            return null;
        }
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    public void onCompletion(MediaPlayer mp) {
        mp.seekTo(0);
    }

    @Override // android.media.MediaPlayer.OnErrorListener
    public synchronized boolean onError(MediaPlayer mp, int what, int extra) {
        if (what == 100) {
            this.activity.finish();
            return true;
        }
        mp.release();
        this.mediaPlayer = null;
        updatePrefs();
        return true;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public synchronized void close() {
        if (this.mediaPlayer != null) {
            this.mediaPlayer.release();
            this.mediaPlayer = null;
        }
    }
}
