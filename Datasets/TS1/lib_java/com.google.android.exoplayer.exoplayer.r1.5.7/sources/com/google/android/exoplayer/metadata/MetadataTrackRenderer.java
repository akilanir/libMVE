package com.google.android.exoplayer.metadata;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.exoplayer.ExoPlaybackException;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.SampleSourceTrackRenderer;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/metadata/MetadataTrackRenderer.class */
public final class MetadataTrackRenderer<T> extends SampleSourceTrackRenderer implements Handler.Callback {
    private static final int MSG_INVOKE_RENDERER = 0;
    private final MetadataParser<T> metadataParser;
    private final MetadataRenderer<T> metadataRenderer;
    private final Handler metadataHandler;
    private final MediaFormatHolder formatHolder;
    private final SampleHolder sampleHolder;
    private boolean inputStreamEnded;
    private long pendingMetadataTimestamp;
    private T pendingMetadata;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/metadata/MetadataTrackRenderer$MetadataRenderer.class */
    public interface MetadataRenderer<T> {
        void onMetadata(T t);
    }

    public MetadataTrackRenderer(SampleSource source, MetadataParser<T> metadataParser, MetadataRenderer<T> metadataRenderer, Looper metadataRendererLooper) {
        super(source);
        this.metadataParser = (MetadataParser) Assertions.checkNotNull(metadataParser);
        this.metadataRenderer = (MetadataRenderer) Assertions.checkNotNull(metadataRenderer);
        this.metadataHandler = metadataRendererLooper == null ? null : new Handler(metadataRendererLooper, this);
        this.formatHolder = new MediaFormatHolder();
        this.sampleHolder = new SampleHolder(1);
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer
    protected boolean handlesTrack(MediaFormat mediaFormat) {
        return this.metadataParser.canParse(mediaFormat.mimeType);
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer
    protected void onDiscontinuity(long positionUs) {
        this.pendingMetadata = null;
        this.inputStreamEnded = false;
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer
    protected void doSomeWork(long positionUs, long elapsedRealtimeUs, boolean sourceIsReady) throws ExoPlaybackException {
        if (!this.inputStreamEnded && this.pendingMetadata == null) {
            this.sampleHolder.clearData();
            int result = readSource(positionUs, this.formatHolder, this.sampleHolder);
            if (result == -3) {
                this.pendingMetadataTimestamp = this.sampleHolder.timeUs;
                try {
                    this.pendingMetadata = this.metadataParser.parse(this.sampleHolder.data.array(), this.sampleHolder.size);
                } catch (IOException e) {
                    throw new ExoPlaybackException(e);
                }
            } else if (result == -1) {
                this.inputStreamEnded = true;
            }
        }
        if (this.pendingMetadata != null && this.pendingMetadataTimestamp <= positionUs) {
            invokeRenderer(this.pendingMetadata);
            this.pendingMetadata = null;
        }
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected void onDisabled() throws ExoPlaybackException {
        this.pendingMetadata = null;
        super.onDisabled();
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected long getBufferedPositionUs() {
        return -3L;
    }

    @Override // com.google.android.exoplayer.TrackRenderer
    protected boolean isEnded() {
        return this.inputStreamEnded;
    }

    @Override // com.google.android.exoplayer.TrackRenderer
    protected boolean isReady() {
        return true;
    }

    private void invokeRenderer(T metadata) {
        if (this.metadataHandler != null) {
            this.metadataHandler.obtainMessage(0, metadata).sendToTarget();
        } else {
            invokeRendererInternal(metadata);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message msg) {
        switch (msg.what) {
            case 0:
                invokeRendererInternal(msg.obj);
                return true;
            default:
                return false;
        }
    }

    private void invokeRendererInternal(T metadata) {
        this.metadataRenderer.onMetadata(metadata);
    }
}
