package com.google.android.exoplayer.chunk;

import android.os.Handler;
import android.os.SystemClock;
import com.google.android.exoplayer.C;
import com.google.android.exoplayer.LoadControl;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.extractor.DefaultTrackOutput;
import com.google.android.exoplayer.hls.HlsChunkSource;
import com.google.android.exoplayer.upstream.Loader;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/chunk/ChunkSampleSource.class */
public class ChunkSampleSource implements SampleSource, SampleSource.SampleSourceReader, Loader.Callback {
    public static final int DEFAULT_MIN_LOADABLE_RETRY_COUNT = 3;
    private static final int STATE_IDLE = 0;
    private static final int STATE_INITIALIZED = 1;
    private static final int STATE_PREPARED = 2;
    private static final int STATE_ENABLED = 3;
    private static final long NO_RESET_PENDING = Long.MIN_VALUE;
    private final int eventSourceId;
    private final LoadControl loadControl;
    private final ChunkSource chunkSource;
    private final ChunkOperationHolder currentLoadableHolder;
    private final LinkedList<BaseMediaChunk> mediaChunks;
    private final List<BaseMediaChunk> readOnlyMediaChunks;
    private final DefaultTrackOutput sampleQueue;
    private final int bufferSizeContribution;
    private final Handler eventHandler;
    private final EventListener eventListener;
    private final int minLoadableRetryCount;
    private int state;
    private long downstreamPositionUs;
    private long lastSeekPositionUs;
    private long pendingResetPositionUs;
    private long lastPerformedBufferOperation;
    private boolean pendingDiscontinuity;
    private Loader loader;
    private boolean loadingFinished;
    private IOException currentLoadableException;
    private int enabledTrackCount;
    private int currentLoadableExceptionCount;
    private long currentLoadableExceptionTimestamp;
    private long currentLoadStartTimeMs;
    private MediaFormat downstreamMediaFormat;
    private Format downstreamFormat;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/chunk/ChunkSampleSource$EventListener.class */
    public interface EventListener extends BaseChunkSampleSourceEventListener {
    }

    public ChunkSampleSource(ChunkSource chunkSource, LoadControl loadControl, int bufferSizeContribution) {
        this(chunkSource, loadControl, bufferSizeContribution, null, null, 0);
    }

    public ChunkSampleSource(ChunkSource chunkSource, LoadControl loadControl, int bufferSizeContribution, Handler eventHandler, EventListener eventListener, int eventSourceId) {
        this(chunkSource, loadControl, bufferSizeContribution, eventHandler, eventListener, eventSourceId, 3);
    }

    public ChunkSampleSource(ChunkSource chunkSource, LoadControl loadControl, int bufferSizeContribution, Handler eventHandler, EventListener eventListener, int eventSourceId, int minLoadableRetryCount) {
        this.chunkSource = chunkSource;
        this.loadControl = loadControl;
        this.bufferSizeContribution = bufferSizeContribution;
        this.eventHandler = eventHandler;
        this.eventListener = eventListener;
        this.eventSourceId = eventSourceId;
        this.minLoadableRetryCount = minLoadableRetryCount;
        this.currentLoadableHolder = new ChunkOperationHolder();
        this.mediaChunks = new LinkedList<>();
        this.readOnlyMediaChunks = Collections.unmodifiableList(this.mediaChunks);
        this.sampleQueue = new DefaultTrackOutput(loadControl.getAllocator());
        this.state = 0;
        this.pendingResetPositionUs = Long.MIN_VALUE;
    }

    @Override // com.google.android.exoplayer.SampleSource
    public SampleSource.SampleSourceReader register() {
        Assertions.checkState(this.state == 0);
        this.state = 1;
        return this;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public boolean prepare(long positionUs) {
        Assertions.checkState(this.state == 1 || this.state == 2);
        if (this.state == 2) {
            return true;
        }
        if (!this.chunkSource.prepare()) {
            return false;
        }
        if (this.chunkSource.getTrackCount() > 0) {
            this.loader = new Loader("Loader:" + this.chunkSource.getFormat(0).mimeType);
        }
        this.state = 2;
        return true;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public int getTrackCount() {
        Assertions.checkState(this.state == 2 || this.state == 3);
        return this.chunkSource.getTrackCount();
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public MediaFormat getFormat(int track) {
        Assertions.checkState(this.state == 2 || this.state == 3);
        return this.chunkSource.getFormat(track);
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void enable(int track, long positionUs) {
        Assertions.checkState(this.state == 2);
        int i = this.enabledTrackCount;
        this.enabledTrackCount = i + 1;
        Assertions.checkState(i == 0);
        this.state = 3;
        this.chunkSource.enable(track);
        this.loadControl.register(this, this.bufferSizeContribution);
        this.downstreamFormat = null;
        this.downstreamMediaFormat = null;
        this.downstreamPositionUs = positionUs;
        this.lastSeekPositionUs = positionUs;
        this.pendingDiscontinuity = false;
        restartFrom(positionUs);
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void disable(int track) {
        Assertions.checkState(this.state == 3);
        int i = this.enabledTrackCount - 1;
        this.enabledTrackCount = i;
        Assertions.checkState(i == 0);
        this.state = 2;
        try {
            this.chunkSource.disable(this.mediaChunks);
            this.loadControl.unregister(this);
            if (this.loader.isLoading()) {
                this.loader.cancelLoading();
                return;
            }
            this.sampleQueue.clear();
            this.mediaChunks.clear();
            clearCurrentLoadable();
            this.loadControl.trimAllocator();
        } catch (Throwable th) {
            this.loadControl.unregister(this);
            if (this.loader.isLoading()) {
                this.loader.cancelLoading();
            } else {
                this.sampleQueue.clear();
                this.mediaChunks.clear();
                clearCurrentLoadable();
                this.loadControl.trimAllocator();
            }
            throw th;
        }
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public boolean continueBuffering(int track, long positionUs) {
        Assertions.checkState(this.state == 3);
        this.downstreamPositionUs = positionUs;
        this.chunkSource.continueBuffering(positionUs);
        updateLoadControl();
        return this.loadingFinished || !this.sampleQueue.isEmpty();
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public long readDiscontinuity(int track) {
        if (this.pendingDiscontinuity) {
            this.pendingDiscontinuity = false;
            return this.lastSeekPositionUs;
        }
        return Long.MIN_VALUE;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public int readData(int track, long positionUs, MediaFormatHolder formatHolder, SampleHolder sampleHolder) {
        BaseMediaChunk currentChunk;
        Assertions.checkState(this.state == 3);
        this.downstreamPositionUs = positionUs;
        if (this.pendingDiscontinuity || isPendingReset()) {
            return -2;
        }
        boolean haveSamples = !this.sampleQueue.isEmpty();
        BaseMediaChunk first = this.mediaChunks.getFirst();
        while (true) {
            currentChunk = first;
            if (!haveSamples || this.mediaChunks.size() <= 1 || this.mediaChunks.get(1).getFirstSampleIndex() > this.sampleQueue.getReadIndex()) {
                break;
            }
            this.mediaChunks.removeFirst();
            first = this.mediaChunks.getFirst();
        }
        if (this.downstreamFormat == null || !this.downstreamFormat.equals(currentChunk.format)) {
            notifyDownstreamFormatChanged(currentChunk.format, currentChunk.trigger, currentChunk.startTimeUs);
            this.downstreamFormat = currentChunk.format;
        }
        if (haveSamples || currentChunk.isMediaFormatFinal) {
            MediaFormat mediaFormat = currentChunk.getMediaFormat();
            if (!mediaFormat.equals(this.downstreamMediaFormat)) {
                formatHolder.format = mediaFormat;
                formatHolder.drmInitData = currentChunk.getDrmInitData();
                this.downstreamMediaFormat = mediaFormat;
                return -4;
            }
        }
        if (!haveSamples) {
            if (this.loadingFinished) {
                return -1;
            }
            return -2;
        }
        if (this.sampleQueue.getSample(sampleHolder)) {
            boolean decodeOnly = sampleHolder.timeUs < this.lastSeekPositionUs;
            sampleHolder.flags |= decodeOnly ? C.SAMPLE_FLAG_DECODE_ONLY : 0;
            onSampleRead(currentChunk, sampleHolder);
            return -3;
        }
        return -2;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void seekToUs(long positionUs) {
        Assertions.checkState(this.state == 3);
        long currentPositionUs = isPendingReset() ? this.pendingResetPositionUs : this.downstreamPositionUs;
        this.downstreamPositionUs = positionUs;
        this.lastSeekPositionUs = positionUs;
        if (currentPositionUs == positionUs) {
            return;
        }
        boolean seekInsideBuffer = !isPendingReset() && this.sampleQueue.skipToKeyframeBefore(positionUs);
        if (seekInsideBuffer) {
            boolean haveSamples = !this.sampleQueue.isEmpty();
            while (haveSamples && this.mediaChunks.size() > 1 && this.mediaChunks.get(1).getFirstSampleIndex() <= this.sampleQueue.getReadIndex()) {
                this.mediaChunks.removeFirst();
            }
        } else {
            restartFrom(positionUs);
        }
        this.pendingDiscontinuity = true;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void maybeThrowError() throws IOException {
        if (this.currentLoadableException != null && this.currentLoadableExceptionCount > this.minLoadableRetryCount) {
            throw this.currentLoadableException;
        }
        if (this.currentLoadableHolder.chunk == null) {
            this.chunkSource.maybeThrowError();
        }
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public long getBufferedPositionUs() {
        Assertions.checkState(this.state == 3);
        if (isPendingReset()) {
            return this.pendingResetPositionUs;
        }
        if (this.loadingFinished) {
            return -3L;
        }
        long largestParsedTimestampUs = this.sampleQueue.getLargestParsedTimestampUs();
        return largestParsedTimestampUs == Long.MIN_VALUE ? this.downstreamPositionUs : largestParsedTimestampUs;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void release() {
        Assertions.checkState(this.state != 3);
        if (this.loader != null) {
            this.loader.release();
            this.loader = null;
        }
        this.state = 0;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCompleted(Loader.Loadable loadable) {
        long now = SystemClock.elapsedRealtime();
        long loadDurationMs = now - this.currentLoadStartTimeMs;
        Chunk currentLoadable = this.currentLoadableHolder.chunk;
        this.chunkSource.onChunkLoadCompleted(currentLoadable);
        if (isMediaChunk(currentLoadable)) {
            BaseMediaChunk mediaChunk = (BaseMediaChunk) currentLoadable;
            notifyLoadCompleted(currentLoadable.bytesLoaded(), mediaChunk.type, mediaChunk.trigger, mediaChunk.format, mediaChunk.startTimeUs, mediaChunk.endTimeUs, now, loadDurationMs);
        } else {
            notifyLoadCompleted(currentLoadable.bytesLoaded(), currentLoadable.type, currentLoadable.trigger, currentLoadable.format, -1L, -1L, now, loadDurationMs);
        }
        clearCurrentLoadable();
        updateLoadControl();
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCanceled(Loader.Loadable loadable) {
        Chunk currentLoadable = this.currentLoadableHolder.chunk;
        notifyLoadCanceled(currentLoadable.bytesLoaded());
        clearCurrentLoadable();
        if (this.state == 3) {
            restartFrom(this.pendingResetPositionUs);
            return;
        }
        this.sampleQueue.clear();
        this.mediaChunks.clear();
        clearCurrentLoadable();
        this.loadControl.trimAllocator();
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadError(Loader.Loadable loadable, IOException e) {
        this.currentLoadableException = e;
        this.currentLoadableExceptionCount++;
        this.currentLoadableExceptionTimestamp = SystemClock.elapsedRealtime();
        notifyLoadError(e);
        this.chunkSource.onChunkLoadError(this.currentLoadableHolder.chunk, e);
        updateLoadControl();
    }

    protected void onSampleRead(MediaChunk mediaChunk, SampleHolder sampleHolder) {
    }

    private void restartFrom(long positionUs) {
        this.pendingResetPositionUs = positionUs;
        this.loadingFinished = false;
        if (this.loader.isLoading()) {
            this.loader.cancelLoading();
            return;
        }
        this.sampleQueue.clear();
        this.mediaChunks.clear();
        clearCurrentLoadable();
        updateLoadControl();
    }

    private void clearCurrentLoadable() {
        this.currentLoadableHolder.chunk = null;
        clearCurrentLoadableException();
    }

    private void clearCurrentLoadableException() {
        this.currentLoadableException = null;
        this.currentLoadableExceptionCount = 0;
    }

    private void updateLoadControl() {
        long now = SystemClock.elapsedRealtime();
        long nextLoadPositionUs = getNextLoadPositionUs();
        boolean isBackedOff = this.currentLoadableException != null;
        boolean loadingOrBackedOff = this.loader.isLoading() || isBackedOff;
        if (!loadingOrBackedOff && ((this.currentLoadableHolder.chunk == null && nextLoadPositionUs != -1) || now - this.lastPerformedBufferOperation > 2000)) {
            this.lastPerformedBufferOperation = now;
            doChunkOperation();
            boolean chunksDiscarded = discardUpstreamMediaChunks(this.currentLoadableHolder.queueSize);
            if (this.currentLoadableHolder.chunk == null) {
                nextLoadPositionUs = -1;
            } else if (chunksDiscarded) {
                nextLoadPositionUs = getNextLoadPositionUs();
            }
        }
        boolean nextLoader = this.loadControl.update(this, this.downstreamPositionUs, nextLoadPositionUs, loadingOrBackedOff);
        if (isBackedOff) {
            long elapsedMillis = now - this.currentLoadableExceptionTimestamp;
            if (elapsedMillis >= getRetryDelayMillis(this.currentLoadableExceptionCount)) {
                resumeFromBackOff();
                return;
            }
            return;
        }
        if (!this.loader.isLoading() && nextLoader) {
            maybeStartLoading();
        }
    }

    private long getNextLoadPositionUs() {
        if (isPendingReset()) {
            return this.pendingResetPositionUs;
        }
        if (this.loadingFinished) {
            return -1L;
        }
        return this.mediaChunks.getLast().endTimeUs;
    }

    private void resumeFromBackOff() {
        this.currentLoadableException = null;
        Chunk backedOffChunk = this.currentLoadableHolder.chunk;
        if (!isMediaChunk(backedOffChunk)) {
            doChunkOperation();
            discardUpstreamMediaChunks(this.currentLoadableHolder.queueSize);
            if (this.currentLoadableHolder.chunk == backedOffChunk) {
                this.loader.startLoading(backedOffChunk, this);
                return;
            } else {
                notifyLoadCanceled(backedOffChunk.bytesLoaded());
                maybeStartLoading();
                return;
            }
        }
        if (backedOffChunk == this.mediaChunks.getFirst()) {
            this.loader.startLoading(backedOffChunk, this);
            return;
        }
        BaseMediaChunk removedChunk = this.mediaChunks.removeLast();
        Assertions.checkState(backedOffChunk == removedChunk);
        doChunkOperation();
        this.mediaChunks.add(removedChunk);
        if (this.currentLoadableHolder.chunk == backedOffChunk) {
            this.loader.startLoading(backedOffChunk, this);
            return;
        }
        notifyLoadCanceled(backedOffChunk.bytesLoaded());
        discardUpstreamMediaChunks(this.currentLoadableHolder.queueSize);
        clearCurrentLoadableException();
        maybeStartLoading();
    }

    private void maybeStartLoading() {
        Chunk currentLoadable = this.currentLoadableHolder.chunk;
        if (currentLoadable == null) {
            return;
        }
        this.currentLoadStartTimeMs = SystemClock.elapsedRealtime();
        if (isMediaChunk(currentLoadable)) {
            BaseMediaChunk mediaChunk = (BaseMediaChunk) currentLoadable;
            mediaChunk.init(this.sampleQueue);
            this.mediaChunks.add(mediaChunk);
            if (isPendingReset()) {
                this.pendingResetPositionUs = Long.MIN_VALUE;
            }
            notifyLoadStarted(mediaChunk.dataSpec.length, mediaChunk.type, mediaChunk.trigger, mediaChunk.format, mediaChunk.startTimeUs, mediaChunk.endTimeUs);
        } else {
            notifyLoadStarted(currentLoadable.dataSpec.length, currentLoadable.type, currentLoadable.trigger, currentLoadable.format, -1L, -1L);
        }
        this.loader.startLoading(currentLoadable, this);
    }

    private void doChunkOperation() {
        this.currentLoadableHolder.endOfStream = false;
        this.currentLoadableHolder.queueSize = this.readOnlyMediaChunks.size();
        this.chunkSource.getChunkOperation(this.readOnlyMediaChunks, this.pendingResetPositionUs != Long.MIN_VALUE ? this.pendingResetPositionUs : this.downstreamPositionUs, this.currentLoadableHolder);
        this.loadingFinished = this.currentLoadableHolder.endOfStream;
    }

    private boolean discardUpstreamMediaChunks(int queueLength) {
        if (this.mediaChunks.size() <= queueLength) {
            return false;
        }
        long startTimeUs = 0;
        long endTimeUs = this.mediaChunks.getLast().endTimeUs;
        BaseMediaChunk removed = null;
        while (this.mediaChunks.size() > queueLength) {
            removed = this.mediaChunks.removeLast();
            startTimeUs = removed.startTimeUs;
        }
        this.sampleQueue.discardUpstreamSamples(removed.getFirstSampleIndex());
        notifyUpstreamDiscarded(startTimeUs, endTimeUs);
        return true;
    }

    private boolean isMediaChunk(Chunk chunk) {
        return chunk instanceof BaseMediaChunk;
    }

    private boolean isPendingReset() {
        return this.pendingResetPositionUs != Long.MIN_VALUE;
    }

    private long getRetryDelayMillis(long errorCount) {
        return Math.min((errorCount - 1) * 1000, HlsChunkSource.DEFAULT_MIN_BUFFER_TO_SWITCH_UP_MS);
    }

    protected final long usToMs(long timeUs) {
        return timeUs / 1000;
    }

    private void notifyLoadStarted(final long length, final int type, final int trigger, final Format format, final long mediaStartTimeUs, final long mediaEndTimeUs) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.chunk.ChunkSampleSource.1
                @Override // java.lang.Runnable
                public void run() {
                    ChunkSampleSource.this.eventListener.onLoadStarted(ChunkSampleSource.this.eventSourceId, length, type, trigger, format, ChunkSampleSource.this.usToMs(mediaStartTimeUs), ChunkSampleSource.this.usToMs(mediaEndTimeUs));
                }
            });
        }
    }

    private void notifyLoadCompleted(final long bytesLoaded, final int type, final int trigger, final Format format, final long mediaStartTimeUs, final long mediaEndTimeUs, final long elapsedRealtimeMs, final long loadDurationMs) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.chunk.ChunkSampleSource.2
                @Override // java.lang.Runnable
                public void run() {
                    ChunkSampleSource.this.eventListener.onLoadCompleted(ChunkSampleSource.this.eventSourceId, bytesLoaded, type, trigger, format, ChunkSampleSource.this.usToMs(mediaStartTimeUs), ChunkSampleSource.this.usToMs(mediaEndTimeUs), elapsedRealtimeMs, loadDurationMs);
                }
            });
        }
    }

    private void notifyLoadCanceled(final long bytesLoaded) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.chunk.ChunkSampleSource.3
                @Override // java.lang.Runnable
                public void run() {
                    ChunkSampleSource.this.eventListener.onLoadCanceled(ChunkSampleSource.this.eventSourceId, bytesLoaded);
                }
            });
        }
    }

    private void notifyLoadError(final IOException e) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.chunk.ChunkSampleSource.4
                @Override // java.lang.Runnable
                public void run() {
                    ChunkSampleSource.this.eventListener.onLoadError(ChunkSampleSource.this.eventSourceId, e);
                }
            });
        }
    }

    private void notifyUpstreamDiscarded(final long mediaStartTimeUs, final long mediaEndTimeUs) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.chunk.ChunkSampleSource.5
                @Override // java.lang.Runnable
                public void run() {
                    ChunkSampleSource.this.eventListener.onUpstreamDiscarded(ChunkSampleSource.this.eventSourceId, ChunkSampleSource.this.usToMs(mediaStartTimeUs), ChunkSampleSource.this.usToMs(mediaEndTimeUs));
                }
            });
        }
    }

    private void notifyDownstreamFormatChanged(final Format format, final int trigger, final long positionUs) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.chunk.ChunkSampleSource.6
                @Override // java.lang.Runnable
                public void run() {
                    ChunkSampleSource.this.eventListener.onDownstreamFormatChanged(ChunkSampleSource.this.eventSourceId, format, trigger, ChunkSampleSource.this.usToMs(positionUs));
                }
            });
        }
    }
}
