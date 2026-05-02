package com.google.android.exoplayer.audio;

import android.annotation.TargetApi;
import android.media.AudioTimestamp;
import android.media.MediaFormat;
import android.media.PlaybackParams;
import android.os.ConditionVariable;
import android.os.SystemClock;
import android.util.Log;
import com.google.android.exoplayer.C;
import com.google.android.exoplayer.extractor.mp4.Atom;
import com.google.android.exoplayer.text.eia608.ClosedCaptionCtrl;
import com.google.android.exoplayer.util.Ac3Util;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.DtsUtil;
import com.google.android.exoplayer.util.Util;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;

@TargetApi(Atom.LONG_HEADER_SIZE)
/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioTrack.class */
public final class AudioTrack {
    public static final int RESULT_POSITION_DISCONTINUITY = 1;
    public static final int RESULT_BUFFER_CONSUMED = 2;
    public static final int SESSION_ID_NOT_SET = 0;
    public static final long CURRENT_POSITION_NOT_SET = Long.MIN_VALUE;
    private static final long MIN_BUFFER_DURATION_US = 250000;
    private static final long MAX_BUFFER_DURATION_US = 750000;
    private static final long PASSTHROUGH_BUFFER_DURATION_US = 250000;
    private static final int BUFFER_MULTIPLICATION_FACTOR = 4;
    private static final String TAG = "AudioTrack";
    private static final long MAX_AUDIO_TIMESTAMP_OFFSET_US = 5000000;
    private static final long MAX_LATENCY_US = 5000000;
    private static final int START_NOT_SET = 0;
    private static final int START_IN_SYNC = 1;
    private static final int START_NEED_SYNC = 2;
    private static final int MAX_PLAYHEAD_OFFSET_COUNT = 10;
    private static final int MIN_PLAYHEAD_OFFSET_SAMPLE_INTERVAL_US = 30000;
    private static final int MIN_TIMESTAMP_SAMPLE_INTERVAL_US = 500000;
    public static boolean enablePreV21AudioSessionWorkaround = false;
    public static boolean failOnSpuriousAudioTimestamp = false;
    private final AudioCapabilities audioCapabilities;
    private final int streamType;
    private final ConditionVariable releasingConditionVariable;
    private final long[] playheadOffsets;
    private final AudioTrackUtil audioTrackUtil;
    private android.media.AudioTrack keepSessionIdAudioTrack;
    private android.media.AudioTrack audioTrack;
    private int sampleRate;
    private int channelConfig;
    private int encoding;
    private boolean passthrough;
    private int pcmFrameSize;
    private int bufferSize;
    private long bufferSizeUs;
    private int nextPlayheadOffsetIndex;
    private int playheadOffsetCount;
    private long smoothedPlayheadOffsetUs;
    private long lastPlayheadSampleTimeUs;
    private boolean audioTimestampSet;
    private long lastTimestampSampleTimeUs;
    private Method getLatencyMethod;
    private long submittedPcmBytes;
    private long submittedEncodedFrames;
    private int framesPerEncodedSample;
    private int startMediaTimeState;
    private long startMediaTimeUs;
    private long resumeSystemTimeUs;
    private long latencyUs;
    private float volume;
    private byte[] temporaryBuffer;
    private int temporaryBufferOffset;
    private int bufferBytesRemaining;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioTrack$InitializationException.class */
    public static final class InitializationException extends Exception {
        public final int audioTrackState;

        public InitializationException(int audioTrackState, int sampleRate, int channelConfig, int bufferSize) {
            super("AudioTrack init failed: " + audioTrackState + ", Config(" + sampleRate + ", " + channelConfig + ", " + bufferSize + ")");
            this.audioTrackState = audioTrackState;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioTrack$WriteException.class */
    public static final class WriteException extends Exception {
        public final int errorCode;

        public WriteException(int errorCode) {
            super("AudioTrack write failed: " + errorCode);
            this.errorCode = errorCode;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioTrack$InvalidAudioTrackTimestampException.class */
    public static final class InvalidAudioTrackTimestampException extends RuntimeException {
        public InvalidAudioTrackTimestampException(String message) {
            super(message);
        }
    }

    public AudioTrack() {
        this(null, 3);
    }

    public AudioTrack(AudioCapabilities audioCapabilities, int streamType) {
        this.audioCapabilities = audioCapabilities;
        this.streamType = streamType;
        this.releasingConditionVariable = new ConditionVariable(true);
        if (Util.SDK_INT >= 18) {
            try {
                this.getLatencyMethod = android.media.AudioTrack.class.getMethod("getLatency", (Class[]) null);
            } catch (NoSuchMethodException e) {
            }
        }
        if (Util.SDK_INT >= 23) {
            this.audioTrackUtil = new AudioTrackUtilV23();
        } else if (Util.SDK_INT >= 19) {
            this.audioTrackUtil = new AudioTrackUtilV19();
        } else {
            this.audioTrackUtil = new AudioTrackUtil();
        }
        this.playheadOffsets = new long[10];
        this.volume = 1.0f;
        this.startMediaTimeState = 0;
    }

    public boolean isPassthroughSupported(String mimeType) {
        return this.audioCapabilities != null && this.audioCapabilities.supportsEncoding(getEncodingForMimeType(mimeType));
    }

    public boolean isInitialized() {
        return this.audioTrack != null;
    }

    public long getCurrentPositionUs(boolean sourceEnded) {
        long currentPositionUs;
        if (!hasCurrentPositionUs()) {
            return Long.MIN_VALUE;
        }
        if (this.audioTrack.getPlayState() == 3) {
            maybeSampleSyncParams();
        }
        long systemClockUs = System.nanoTime() / 1000;
        if (this.audioTimestampSet) {
            long presentationDiff = systemClockUs - (this.audioTrackUtil.getTimestampNanoTime() / 1000);
            long actualSpeedPresentationDiff = (long) (presentationDiff * this.audioTrackUtil.getPlaybackSpeed());
            long framesDiff = durationUsToFrames(actualSpeedPresentationDiff);
            long currentFramePosition = this.audioTrackUtil.getTimestampFramePosition() + framesDiff;
            currentPositionUs = framesToDurationUs(currentFramePosition) + this.startMediaTimeUs;
        } else {
            if (this.playheadOffsetCount == 0) {
                currentPositionUs = this.audioTrackUtil.getPlaybackHeadPositionUs() + this.startMediaTimeUs;
            } else {
                currentPositionUs = systemClockUs + this.smoothedPlayheadOffsetUs + this.startMediaTimeUs;
            }
            if (!sourceEnded) {
                currentPositionUs -= this.latencyUs;
            }
        }
        return currentPositionUs;
    }

    public void configure(MediaFormat format, boolean passthrough) {
        configure(format, passthrough, 0);
    }

    public void configure(MediaFormat format, boolean passthrough, int specifiedBufferSize) {
        int channelConfig;
        int channelCount = format.getInteger("channel-count");
        switch (channelCount) {
            case 1:
                channelConfig = 4;
                break;
            case 2:
                channelConfig = 12;
                break;
            case 3:
                channelConfig = 28;
                break;
            case 4:
                channelConfig = 204;
                break;
            case 5:
                channelConfig = 220;
                break;
            case 6:
                channelConfig = 252;
                break;
            case C.ENCODING_DTS /* 7 */:
                channelConfig = 1276;
                break;
            case 8:
                channelConfig = C.CHANNEL_OUT_7POINT1_SURROUND;
                break;
            default:
                throw new IllegalArgumentException("Unsupported channel count: " + channelCount);
        }
        int sampleRate = format.getInteger("sample-rate");
        String mimeType = format.getString("mime");
        int encoding = passthrough ? getEncodingForMimeType(mimeType) : 2;
        if (isInitialized() && this.sampleRate == sampleRate && this.channelConfig == channelConfig && this.encoding == encoding) {
            return;
        }
        reset();
        this.encoding = encoding;
        this.passthrough = passthrough;
        this.sampleRate = sampleRate;
        this.channelConfig = channelConfig;
        this.pcmFrameSize = 2 * channelCount;
        if (specifiedBufferSize != 0) {
            this.bufferSize = specifiedBufferSize;
        } else if (passthrough) {
            if (encoding == 5 || encoding == 6) {
                this.bufferSize = 20480;
            } else {
                this.bufferSize = 49152;
            }
        } else {
            int minBufferSize = android.media.AudioTrack.getMinBufferSize(sampleRate, channelConfig, encoding);
            Assertions.checkState(minBufferSize != -2);
            int multipliedBufferSize = minBufferSize * 4;
            int minAppBufferSize = ((int) durationUsToFrames(250000L)) * this.pcmFrameSize;
            int maxAppBufferSize = (int) Math.max(minBufferSize, durationUsToFrames(MAX_BUFFER_DURATION_US) * this.pcmFrameSize);
            this.bufferSize = multipliedBufferSize < minAppBufferSize ? minAppBufferSize : multipliedBufferSize > maxAppBufferSize ? maxAppBufferSize : multipliedBufferSize;
        }
        this.bufferSizeUs = passthrough ? -1L : framesToDurationUs(pcmBytesToFrames(this.bufferSize));
    }

    public int initialize() throws InitializationException {
        return initialize(0);
    }

    public int initialize(int sessionId) throws InitializationException {
        this.releasingConditionVariable.block();
        if (sessionId == 0) {
            this.audioTrack = new android.media.AudioTrack(this.streamType, this.sampleRate, this.channelConfig, this.encoding, this.bufferSize, 1);
        } else {
            this.audioTrack = new android.media.AudioTrack(this.streamType, this.sampleRate, this.channelConfig, this.encoding, this.bufferSize, 1, sessionId);
        }
        checkAudioTrackInitialized();
        int sessionId2 = this.audioTrack.getAudioSessionId();
        if (enablePreV21AudioSessionWorkaround && Util.SDK_INT < 21) {
            if (this.keepSessionIdAudioTrack != null && sessionId2 != this.keepSessionIdAudioTrack.getAudioSessionId()) {
                releaseKeepSessionIdAudioTrack();
            }
            if (this.keepSessionIdAudioTrack == null) {
                this.keepSessionIdAudioTrack = new android.media.AudioTrack(this.streamType, 4000, 4, 2, 2, 0, sessionId2);
            }
        }
        this.audioTrackUtil.reconfigure(this.audioTrack, needsPassthroughWorkarounds());
        setAudioTrackVolume();
        return sessionId2;
    }

    public int getBufferSize() {
        return this.bufferSize;
    }

    public long getBufferSizeUs() {
        return this.bufferSizeUs;
    }

    public void play() {
        if (isInitialized()) {
            this.resumeSystemTimeUs = System.nanoTime() / 1000;
            this.audioTrack.play();
        }
    }

    public void handleDiscontinuity() {
        if (this.startMediaTimeState == 1) {
            this.startMediaTimeState = 2;
        }
    }

    public int handleBuffer(ByteBuffer buffer, int offset, int size, long presentationTimeUs) throws WriteException {
        if (size == 0) {
            return 2;
        }
        if (needsPassthroughWorkarounds()) {
            if (this.audioTrack.getPlayState() == 2) {
                return 0;
            }
            if (this.audioTrack.getPlayState() == 1 && this.audioTrackUtil.getPlaybackHeadPosition() != 0) {
                return 0;
            }
        }
        int result = 0;
        if (this.bufferBytesRemaining == 0) {
            this.bufferBytesRemaining = size;
            buffer.position(offset);
            if (this.passthrough && this.framesPerEncodedSample == 0) {
                this.framesPerEncodedSample = getFramesPerEncodedSample(this.encoding, buffer);
            }
            long frames = this.passthrough ? this.framesPerEncodedSample : pcmBytesToFrames(size);
            long bufferDurationUs = framesToDurationUs(frames);
            long bufferStartTime = presentationTimeUs - bufferDurationUs;
            if (this.startMediaTimeState == 0) {
                this.startMediaTimeUs = Math.max(0L, bufferStartTime);
                this.startMediaTimeState = 1;
            } else {
                long expectedBufferStartTime = this.startMediaTimeUs + framesToDurationUs(getSubmittedFrames());
                if (this.startMediaTimeState == 1 && Math.abs(expectedBufferStartTime - bufferStartTime) > 200000) {
                    Log.e(TAG, "Discontinuity detected [expected " + expectedBufferStartTime + ", got " + bufferStartTime + "]");
                    this.startMediaTimeState = 2;
                }
                if (this.startMediaTimeState == 2) {
                    this.startMediaTimeUs += bufferStartTime - expectedBufferStartTime;
                    this.startMediaTimeState = 1;
                    result = 0 | 1;
                }
            }
            if (Util.SDK_INT < 21) {
                if (this.temporaryBuffer == null || this.temporaryBuffer.length < size) {
                    this.temporaryBuffer = new byte[size];
                }
                buffer.get(this.temporaryBuffer, 0, size);
                this.temporaryBufferOffset = 0;
            }
        }
        int bytesWritten = 0;
        if (Util.SDK_INT < 21) {
            int bytesPending = (int) (this.submittedPcmBytes - (this.audioTrackUtil.getPlaybackHeadPosition() * this.pcmFrameSize));
            int bytesToWrite = this.bufferSize - bytesPending;
            if (bytesToWrite > 0) {
                bytesWritten = this.audioTrack.write(this.temporaryBuffer, this.temporaryBufferOffset, Math.min(this.bufferBytesRemaining, bytesToWrite));
                if (bytesWritten >= 0) {
                    this.temporaryBufferOffset += bytesWritten;
                }
            }
        } else {
            bytesWritten = writeNonBlockingV21(this.audioTrack, buffer, this.bufferBytesRemaining);
        }
        if (bytesWritten < 0) {
            throw new WriteException(bytesWritten);
        }
        this.bufferBytesRemaining -= bytesWritten;
        if (!this.passthrough) {
            this.submittedPcmBytes += bytesWritten;
        }
        if (this.bufferBytesRemaining == 0) {
            if (this.passthrough) {
                this.submittedEncodedFrames += this.framesPerEncodedSample;
            }
            result |= 2;
        }
        return result;
    }

    public void handleEndOfStream() {
        if (isInitialized()) {
            this.audioTrackUtil.handleEndOfStream(getSubmittedFrames());
        }
    }

    @TargetApi(21)
    private static int writeNonBlockingV21(android.media.AudioTrack audioTrack, ByteBuffer buffer, int size) {
        return audioTrack.write(buffer, size, 1);
    }

    public boolean hasPendingData() {
        return isInitialized() && (getSubmittedFrames() > this.audioTrackUtil.getPlaybackHeadPosition() || overrideHasPendingData());
    }

    public void setPlaybackParams(PlaybackParams playbackParams) {
        this.audioTrackUtil.setPlaybackParameters(playbackParams);
    }

    public void setVolume(float volume) {
        if (this.volume != volume) {
            this.volume = volume;
            setAudioTrackVolume();
        }
    }

    private void setAudioTrackVolume() {
        if (isInitialized()) {
            if (Util.SDK_INT >= 21) {
                setAudioTrackVolumeV21(this.audioTrack, this.volume);
            } else {
                setAudioTrackVolumeV3(this.audioTrack, this.volume);
            }
        }
    }

    @TargetApi(21)
    private static void setAudioTrackVolumeV21(android.media.AudioTrack audioTrack, float volume) {
        audioTrack.setVolume(volume);
    }

    private static void setAudioTrackVolumeV3(android.media.AudioTrack audioTrack, float volume) {
        audioTrack.setStereoVolume(volume, volume);
    }

    public void pause() {
        if (isInitialized()) {
            resetSyncParams();
            this.audioTrackUtil.pause();
        }
    }

    /* JADX WARN: Type inference failed for: r0v20, types: [com.google.android.exoplayer.audio.AudioTrack$1] */
    public void reset() {
        if (isInitialized()) {
            this.submittedPcmBytes = 0L;
            this.submittedEncodedFrames = 0L;
            this.framesPerEncodedSample = 0;
            this.bufferBytesRemaining = 0;
            this.startMediaTimeState = 0;
            this.latencyUs = 0L;
            resetSyncParams();
            int playState = this.audioTrack.getPlayState();
            if (playState == 3) {
                this.audioTrack.pause();
            }
            final android.media.AudioTrack toRelease = this.audioTrack;
            this.audioTrack = null;
            this.audioTrackUtil.reconfigure(null, false);
            this.releasingConditionVariable.close();
            new Thread() { // from class: com.google.android.exoplayer.audio.AudioTrack.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    try {
                        toRelease.flush();
                        toRelease.release();
                        AudioTrack.this.releasingConditionVariable.open();
                    } catch (Throwable th) {
                        AudioTrack.this.releasingConditionVariable.open();
                        throw th;
                    }
                }
            }.start();
        }
    }

    public void release() {
        reset();
        releaseKeepSessionIdAudioTrack();
    }

    /* JADX WARN: Type inference failed for: r0v5, types: [com.google.android.exoplayer.audio.AudioTrack$2] */
    private void releaseKeepSessionIdAudioTrack() {
        if (this.keepSessionIdAudioTrack == null) {
            return;
        }
        final android.media.AudioTrack toRelease = this.keepSessionIdAudioTrack;
        this.keepSessionIdAudioTrack = null;
        new Thread() { // from class: com.google.android.exoplayer.audio.AudioTrack.2
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                toRelease.release();
            }
        }.start();
    }

    private boolean hasCurrentPositionUs() {
        return isInitialized() && this.startMediaTimeState != 0;
    }

    private void maybeSampleSyncParams() {
        long playbackPositionUs = this.audioTrackUtil.getPlaybackHeadPositionUs();
        if (playbackPositionUs == 0) {
            return;
        }
        long systemClockUs = System.nanoTime() / 1000;
        if (systemClockUs - this.lastPlayheadSampleTimeUs >= 30000) {
            this.playheadOffsets[this.nextPlayheadOffsetIndex] = playbackPositionUs - systemClockUs;
            this.nextPlayheadOffsetIndex = (this.nextPlayheadOffsetIndex + 1) % 10;
            if (this.playheadOffsetCount < 10) {
                this.playheadOffsetCount++;
            }
            this.lastPlayheadSampleTimeUs = systemClockUs;
            this.smoothedPlayheadOffsetUs = 0L;
            for (int i = 0; i < this.playheadOffsetCount; i++) {
                this.smoothedPlayheadOffsetUs += this.playheadOffsets[i] / this.playheadOffsetCount;
            }
        }
        if (!needsPassthroughWorkarounds() && systemClockUs - this.lastTimestampSampleTimeUs >= 500000) {
            this.audioTimestampSet = this.audioTrackUtil.updateTimestamp();
            if (this.audioTimestampSet) {
                long audioTimestampUs = this.audioTrackUtil.getTimestampNanoTime() / 1000;
                long audioTimestampFramePosition = this.audioTrackUtil.getTimestampFramePosition();
                if (audioTimestampUs < this.resumeSystemTimeUs) {
                    this.audioTimestampSet = false;
                } else if (Math.abs(audioTimestampUs - systemClockUs) > 5000000) {
                    String message = "Spurious audio timestamp (system clock mismatch): " + audioTimestampFramePosition + ", " + audioTimestampUs + ", " + systemClockUs + ", " + playbackPositionUs;
                    if (failOnSpuriousAudioTimestamp) {
                        throw new InvalidAudioTrackTimestampException(message);
                    }
                    Log.w(TAG, message);
                    this.audioTimestampSet = false;
                } else if (Math.abs(framesToDurationUs(audioTimestampFramePosition) - playbackPositionUs) > 5000000) {
                    String message2 = "Spurious audio timestamp (frame position mismatch): " + audioTimestampFramePosition + ", " + audioTimestampUs + ", " + systemClockUs + ", " + playbackPositionUs;
                    if (failOnSpuriousAudioTimestamp) {
                        throw new InvalidAudioTrackTimestampException(message2);
                    }
                    Log.w(TAG, message2);
                    this.audioTimestampSet = false;
                }
            }
            if (this.getLatencyMethod != null && !this.passthrough) {
                try {
                    this.latencyUs = (((Integer) this.getLatencyMethod.invoke(this.audioTrack, (Object[]) null)).intValue() * 1000) - this.bufferSizeUs;
                    this.latencyUs = Math.max(this.latencyUs, 0L);
                    if (this.latencyUs > 5000000) {
                        Log.w(TAG, "Ignoring impossibly large audio latency: " + this.latencyUs);
                        this.latencyUs = 0L;
                    }
                } catch (Exception e) {
                    this.getLatencyMethod = null;
                }
            }
            this.lastTimestampSampleTimeUs = systemClockUs;
        }
    }

    private void checkAudioTrackInitialized() throws InitializationException {
        int state = this.audioTrack.getState();
        if (state == 1) {
            return;
        }
        try {
            this.audioTrack.release();
            this.audioTrack = null;
        } catch (Exception e) {
            this.audioTrack = null;
        } catch (Throwable th) {
            this.audioTrack = null;
            throw th;
        }
        throw new InitializationException(state, this.sampleRate, this.channelConfig, this.bufferSize);
    }

    private long pcmBytesToFrames(long byteCount) {
        return byteCount / this.pcmFrameSize;
    }

    private long framesToDurationUs(long frameCount) {
        return (frameCount * C.MICROS_PER_SECOND) / this.sampleRate;
    }

    private long durationUsToFrames(long durationUs) {
        return (durationUs * this.sampleRate) / C.MICROS_PER_SECOND;
    }

    private long getSubmittedFrames() {
        return this.passthrough ? this.submittedEncodedFrames : pcmBytesToFrames(this.submittedPcmBytes);
    }

    private void resetSyncParams() {
        this.smoothedPlayheadOffsetUs = 0L;
        this.playheadOffsetCount = 0;
        this.nextPlayheadOffsetIndex = 0;
        this.lastPlayheadSampleTimeUs = 0L;
        this.audioTimestampSet = false;
        this.lastTimestampSampleTimeUs = 0L;
    }

    private boolean needsPassthroughWorkarounds() {
        return Util.SDK_INT < 23 && (this.encoding == 5 || this.encoding == 6);
    }

    private boolean overrideHasPendingData() {
        return needsPassthroughWorkarounds() && this.audioTrack.getPlayState() == 2 && this.audioTrack.getPlaybackHeadPosition() == 0;
    }

    private static int getEncodingForMimeType(String mimeType) {
        switch (mimeType) {
            case "audio/ac3":
                return 5;
            case "audio/eac3":
                return 6;
            case "audio/vnd.dts":
                return 7;
            case "audio/vnd.dts.hd":
                return 8;
            default:
                return 0;
        }
    }

    private static int getFramesPerEncodedSample(int encoding, ByteBuffer buffer) {
        if (encoding == 7 || encoding == 8) {
            return DtsUtil.parseDtsAudioSampleCount(buffer);
        }
        if (encoding == 5) {
            return Ac3Util.getAc3SyncframeAudioSampleCount();
        }
        if (encoding == 6) {
            return Ac3Util.parseEAc3SyncframeAudioSampleCount(buffer);
        }
        throw new IllegalStateException("Unexpected audio encoding: " + encoding);
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil.class */
    private static class AudioTrackUtil {
        protected android.media.AudioTrack audioTrack;
        private boolean needsPassthroughWorkaround;
        private int sampleRate;
        private long lastRawPlaybackHeadPosition;
        private long rawPlaybackHeadWrapCount;
        private long passthroughWorkaroundPauseOffset;
        private long stopTimestampUs;
        private long stopPlaybackHeadPosition;
        private long endPlaybackHeadPosition;

        private AudioTrackUtil() {
        }

        public void reconfigure(android.media.AudioTrack audioTrack, boolean needsPassthroughWorkaround) {
            this.audioTrack = audioTrack;
            this.needsPassthroughWorkaround = needsPassthroughWorkaround;
            this.stopTimestampUs = -1L;
            this.lastRawPlaybackHeadPosition = 0L;
            this.rawPlaybackHeadWrapCount = 0L;
            this.passthroughWorkaroundPauseOffset = 0L;
            if (audioTrack != null) {
                this.sampleRate = audioTrack.getSampleRate();
            }
        }

        public void handleEndOfStream(long submittedFrames) {
            this.stopPlaybackHeadPosition = getPlaybackHeadPosition();
            this.stopTimestampUs = SystemClock.elapsedRealtime() * 1000;
            this.endPlaybackHeadPosition = submittedFrames;
            this.audioTrack.stop();
        }

        public void pause() {
            if (this.stopTimestampUs != -1) {
                return;
            }
            this.audioTrack.pause();
        }

        public long getPlaybackHeadPosition() {
            if (this.stopTimestampUs != -1) {
                long elapsedTimeSinceStopUs = (SystemClock.elapsedRealtime() * 1000) - this.stopTimestampUs;
                long framesSinceStop = (elapsedTimeSinceStopUs * this.sampleRate) / C.MICROS_PER_SECOND;
                return Math.min(this.endPlaybackHeadPosition, this.stopPlaybackHeadPosition + framesSinceStop);
            }
            int state = this.audioTrack.getPlayState();
            if (state == 1) {
                return 0L;
            }
            long rawPlaybackHeadPosition = 4294967295L & this.audioTrack.getPlaybackHeadPosition();
            if (this.needsPassthroughWorkaround) {
                if (state == 2 && rawPlaybackHeadPosition == 0) {
                    this.passthroughWorkaroundPauseOffset = this.lastRawPlaybackHeadPosition;
                }
                rawPlaybackHeadPosition += this.passthroughWorkaroundPauseOffset;
            }
            if (this.lastRawPlaybackHeadPosition > rawPlaybackHeadPosition) {
                this.rawPlaybackHeadWrapCount++;
            }
            this.lastRawPlaybackHeadPosition = rawPlaybackHeadPosition;
            return rawPlaybackHeadPosition + (this.rawPlaybackHeadWrapCount << 32);
        }

        public long getPlaybackHeadPositionUs() {
            return (getPlaybackHeadPosition() * C.MICROS_PER_SECOND) / this.sampleRate;
        }

        public boolean updateTimestamp() {
            return false;
        }

        public long getTimestampNanoTime() {
            throw new UnsupportedOperationException();
        }

        public long getTimestampFramePosition() {
            throw new UnsupportedOperationException();
        }

        public void setPlaybackParameters(PlaybackParams playbackParams) {
            throw new UnsupportedOperationException();
        }

        public float getPlaybackSpeed() {
            return 1.0f;
        }
    }

    @TargetApi(19)
    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19.class */
    private static class AudioTrackUtilV19 extends AudioTrackUtil {
        private final AudioTimestamp audioTimestamp;
        private long rawTimestampFramePositionWrapCount;
        private long lastRawTimestampFramePosition;
        private long lastTimestampFramePosition;

        public AudioTrackUtilV19() {
            super();
            this.audioTimestamp = new AudioTimestamp();
        }

        @Override // com.google.android.exoplayer.audio.AudioTrack.AudioTrackUtil
        public void reconfigure(android.media.AudioTrack audioTrack, boolean needsPassthroughWorkaround) {
            super.reconfigure(audioTrack, needsPassthroughWorkaround);
            this.rawTimestampFramePositionWrapCount = 0L;
            this.lastRawTimestampFramePosition = 0L;
            this.lastTimestampFramePosition = 0L;
        }

        @Override // com.google.android.exoplayer.audio.AudioTrack.AudioTrackUtil
        public boolean updateTimestamp() {
            boolean updated = this.audioTrack.getTimestamp(this.audioTimestamp);
            if (updated) {
                long rawFramePosition = this.audioTimestamp.framePosition;
                if (this.lastRawTimestampFramePosition > rawFramePosition) {
                    this.rawTimestampFramePositionWrapCount++;
                }
                this.lastRawTimestampFramePosition = rawFramePosition;
                this.lastTimestampFramePosition = rawFramePosition + (this.rawTimestampFramePositionWrapCount << 32);
            }
            return updated;
        }

        @Override // com.google.android.exoplayer.audio.AudioTrack.AudioTrackUtil
        public long getTimestampNanoTime() {
            return this.audioTimestamp.nanoTime;
        }

        @Override // com.google.android.exoplayer.audio.AudioTrack.AudioTrackUtil
        public long getTimestampFramePosition() {
            return this.lastTimestampFramePosition;
        }
    }

    @TargetApi(ClosedCaptionCtrl.TAB_OFFSET_CHAN_1)
    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23.class */
    private static class AudioTrackUtilV23 extends AudioTrackUtilV19 {
        private PlaybackParams playbackParams;
        private float playbackSpeed = 1.0f;

        @Override // com.google.android.exoplayer.audio.AudioTrack.AudioTrackUtilV19, com.google.android.exoplayer.audio.AudioTrack.AudioTrackUtil
        public void reconfigure(android.media.AudioTrack audioTrack, boolean needsPassthroughWorkaround) {
            super.reconfigure(audioTrack, needsPassthroughWorkaround);
            maybeApplyPlaybackParams();
        }

        @Override // com.google.android.exoplayer.audio.AudioTrack.AudioTrackUtil
        public void setPlaybackParameters(PlaybackParams playbackParams) {
            PlaybackParams playbackParams2 = (playbackParams != null ? playbackParams : new PlaybackParams()).allowDefaults();
            this.playbackParams = playbackParams2;
            this.playbackSpeed = playbackParams2.getSpeed();
            maybeApplyPlaybackParams();
        }

        @Override // com.google.android.exoplayer.audio.AudioTrack.AudioTrackUtil
        public float getPlaybackSpeed() {
            return this.playbackSpeed;
        }

        private void maybeApplyPlaybackParams() {
            if (this.audioTrack != null && this.playbackParams != null) {
                this.audioTrack.setPlaybackParams(this.playbackParams);
            }
        }
    }
}
