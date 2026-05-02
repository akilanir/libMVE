package com.google.android.exoplayer.hls;

import android.os.Handler;
import android.os.SystemClock;
import com.google.android.exoplayer.C;
import com.google.android.exoplayer.LoadControl;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.chunk.BaseChunkSampleSourceEventListener;
import com.google.android.exoplayer.chunk.Chunk;
import com.google.android.exoplayer.chunk.ChunkOperationHolder;
import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.upstream.Loader;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.MimeTypes;
import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/hls/HlsSampleSource.class */
public final class HlsSampleSource implements SampleSource, SampleSource.SampleSourceReader, Loader.Callback {
    public static final int DEFAULT_MIN_LOADABLE_RETRY_COUNT = 3;
    private static final long NO_RESET_PENDING = Long.MIN_VALUE;
    private static final int PRIMARY_TYPE_NONE = 0;
    private static final int PRIMARY_TYPE_TEXT = 1;
    private static final int PRIMARY_TYPE_AUDIO = 2;
    private static final int PRIMARY_TYPE_VIDEO = 3;
    private final HlsChunkSource chunkSource;
    private final LinkedList<HlsExtractorWrapper> extractors;
    private final int minLoadableRetryCount;
    private final int bufferSizeContribution;
    private final ChunkOperationHolder chunkOperationHolder;
    private final int eventSourceId;
    private final LoadControl loadControl;
    private final Handler eventHandler;
    private final EventListener eventListener;
    private int remainingReleaseCount;
    private boolean prepared;
    private boolean loadControlRegistered;
    private int trackCount;
    private int enabledTrackCount;
    private Format downstreamFormat;
    private MediaFormat[] trackFormats;
    private boolean[] trackEnabledStates;
    private boolean[] pendingDiscontinuities;
    private MediaFormat[] downstreamMediaFormats;
    private int[] chunkSourceTrackIndices;
    private int[] extractorTrackIndices;
    private boolean[] extractorTrackEnabledStates;
    private long downstreamPositionUs;
    private long lastSeekPositionUs;
    private long pendingResetPositionUs;
    private boolean loadingFinished;
    private Chunk currentLoadable;
    private TsChunk currentTsLoadable;
    private TsChunk previousTsLoadable;
    private Loader loader;
    private IOException currentLoadableException;
    private int currentLoadableExceptionCount;
    private long currentLoadableExceptionTimestamp;
    private long currentLoadStartTimeMs;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/hls/HlsSampleSource$EventListener.class */
    public interface EventListener extends BaseChunkSampleSourceEventListener {
    }

    public HlsSampleSource(HlsChunkSource chunkSource, LoadControl loadControl, int bufferSizeContribution) {
        this(chunkSource, loadControl, bufferSizeContribution, null, null, 0);
    }

    public HlsSampleSource(HlsChunkSource chunkSource, LoadControl loadControl, int bufferSizeContribution, Handler eventHandler, EventListener eventListener, int eventSourceId) {
        this(chunkSource, loadControl, bufferSizeContribution, eventHandler, eventListener, eventSourceId, 3);
    }

    public HlsSampleSource(HlsChunkSource chunkSource, LoadControl loadControl, int bufferSizeContribution, Handler eventHandler, EventListener eventListener, int eventSourceId, int minLoadableRetryCount) {
        this.chunkSource = chunkSource;
        this.loadControl = loadControl;
        this.bufferSizeContribution = bufferSizeContribution;
        this.minLoadableRetryCount = minLoadableRetryCount;
        this.eventHandler = eventHandler;
        this.eventListener = eventListener;
        this.eventSourceId = eventSourceId;
        this.pendingResetPositionUs = Long.MIN_VALUE;
        this.extractors = new LinkedList<>();
        this.chunkOperationHolder = new ChunkOperationHolder();
    }

    @Override // com.google.android.exoplayer.SampleSource
    public SampleSource.SampleSourceReader register() {
        this.remainingReleaseCount++;
        return this;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public boolean prepare(long positionUs) {
        if (this.prepared) {
            return true;
        }
        if (!this.chunkSource.prepare()) {
            return false;
        }
        if (!this.extractors.isEmpty()) {
            while (true) {
                HlsExtractorWrapper extractor = this.extractors.getFirst();
                if (extractor.isPrepared()) {
                    buildTracks(extractor);
                    this.prepared = true;
                    maybeStartLoading();
                    return true;
                }
                if (this.extractors.size() <= 1) {
                    break;
                }
                this.extractors.removeFirst().clear();
            }
        }
        if (this.loader == null) {
            this.loader = new Loader("Loader:HLS");
            this.loadControl.register(this, this.bufferSizeContribution);
            this.loadControlRegistered = true;
        }
        if (!this.loader.isLoading()) {
            this.pendingResetPositionUs = positionUs;
            this.downstreamPositionUs = positionUs;
        }
        maybeStartLoading();
        return false;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public int getTrackCount() {
        Assertions.checkState(this.prepared);
        return this.trackCount;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public MediaFormat getFormat(int track) {
        Assertions.checkState(this.prepared);
        return this.trackFormats[track];
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void enable(int track, long positionUs) {
        Assertions.checkState(this.prepared);
        setTrackEnabledState(track, true);
        this.downstreamMediaFormats[track] = null;
        this.pendingDiscontinuities[track] = false;
        this.downstreamFormat = null;
        boolean wasLoadControlRegistered = this.loadControlRegistered;
        if (!this.loadControlRegistered) {
            this.loadControl.register(this, this.bufferSizeContribution);
            this.loadControlRegistered = true;
        }
        long positionUs2 = this.chunkSource.isLive() ? 0L : positionUs;
        int chunkSourceTrack = this.chunkSourceTrackIndices[track];
        if (chunkSourceTrack != -1 && chunkSourceTrack != this.chunkSource.getSelectedTrackIndex()) {
            this.chunkSource.selectTrack(chunkSourceTrack);
            seekToInternal(positionUs2);
        } else if (this.enabledTrackCount == 1) {
            this.lastSeekPositionUs = positionUs2;
            if (wasLoadControlRegistered && this.downstreamPositionUs == positionUs2) {
                maybeStartLoading();
            } else {
                this.downstreamPositionUs = positionUs2;
                restartFrom(positionUs2);
            }
        }
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void disable(int track) {
        Assertions.checkState(this.prepared);
        setTrackEnabledState(track, false);
        if (this.enabledTrackCount == 0) {
            this.chunkSource.reset();
            this.downstreamPositionUs = Long.MIN_VALUE;
            if (this.loadControlRegistered) {
                this.loadControl.unregister(this);
                this.loadControlRegistered = false;
            }
            if (this.loader.isLoading()) {
                this.loader.cancelLoading();
            } else {
                clearState();
                this.loadControl.trimAllocator();
            }
        }
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public boolean continueBuffering(int track, long playbackPositionUs) {
        Assertions.checkState(this.prepared);
        Assertions.checkState(this.trackEnabledStates[track]);
        this.downstreamPositionUs = playbackPositionUs;
        if (!this.extractors.isEmpty()) {
            discardSamplesForDisabledTracks(getCurrentExtractor(), this.downstreamPositionUs);
        }
        maybeStartLoading();
        if (this.loadingFinished) {
            return true;
        }
        if (isPendingReset() || this.extractors.isEmpty()) {
            return false;
        }
        for (int extractorIndex = 0; extractorIndex < this.extractors.size(); extractorIndex++) {
            HlsExtractorWrapper extractor = this.extractors.get(extractorIndex);
            if (extractor.isPrepared()) {
                int extractorTrack = this.extractorTrackIndices[track];
                if (extractor.hasSamples(extractorTrack)) {
                    return true;
                }
            } else {
                return false;
            }
        }
        return false;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public long readDiscontinuity(int track) {
        if (this.pendingDiscontinuities[track]) {
            this.pendingDiscontinuities[track] = false;
            return this.lastSeekPositionUs;
        }
        return Long.MIN_VALUE;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public int readData(int track, long playbackPositionUs, MediaFormatHolder formatHolder, SampleHolder sampleHolder) {
        Assertions.checkState(this.prepared);
        this.downstreamPositionUs = playbackPositionUs;
        if (this.pendingDiscontinuities[track] || isPendingReset()) {
            return -2;
        }
        HlsExtractorWrapper extractor = getCurrentExtractor();
        if (!extractor.isPrepared()) {
            return -2;
        }
        if (this.downstreamFormat == null || !this.downstreamFormat.equals(extractor.format)) {
            notifyDownstreamFormatChanged(extractor.format, extractor.trigger, extractor.startTimeUs);
            this.downstreamFormat = extractor.format;
        }
        if (this.extractors.size() > 1) {
            extractor.configureSpliceTo(this.extractors.get(1));
        }
        int extractorTrack = this.extractorTrackIndices[track];
        int extractorIndex = 0;
        while (this.extractors.size() > extractorIndex + 1 && !extractor.hasSamples(extractorTrack)) {
            extractorIndex++;
            extractor = this.extractors.get(extractorIndex);
            if (!extractor.isPrepared()) {
                return -2;
            }
        }
        MediaFormat mediaFormat = extractor.getMediaFormat(extractorTrack);
        if (mediaFormat != null && !mediaFormat.equals(this.downstreamMediaFormats[track])) {
            formatHolder.format = mediaFormat;
            this.downstreamMediaFormats[track] = mediaFormat;
            return -4;
        }
        if (extractor.getSample(extractorTrack, sampleHolder)) {
            boolean decodeOnly = sampleHolder.timeUs < this.lastSeekPositionUs;
            sampleHolder.flags |= decodeOnly ? C.SAMPLE_FLAG_DECODE_ONLY : 0;
            return -3;
        }
        if (this.loadingFinished) {
            return -1;
        }
        return -2;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void maybeThrowError() throws IOException {
        if (this.currentLoadableException != null && this.currentLoadableExceptionCount > this.minLoadableRetryCount) {
            throw this.currentLoadableException;
        }
        if (this.currentLoadable == null) {
            this.chunkSource.maybeThrowError();
        }
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void seekToUs(long positionUs) {
        Assertions.checkState(this.prepared);
        Assertions.checkState(this.enabledTrackCount > 0);
        long positionUs2 = this.chunkSource.isLive() ? 0L : positionUs;
        long currentPositionUs = isPendingReset() ? this.pendingResetPositionUs : this.downstreamPositionUs;
        this.downstreamPositionUs = positionUs2;
        this.lastSeekPositionUs = positionUs2;
        if (currentPositionUs == positionUs2) {
            return;
        }
        seekToInternal(positionUs2);
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public long getBufferedPositionUs() {
        Assertions.checkState(this.prepared);
        Assertions.checkState(this.enabledTrackCount > 0);
        if (isPendingReset()) {
            return this.pendingResetPositionUs;
        }
        if (this.loadingFinished) {
            return -3L;
        }
        long largestParsedTimestampUs = this.extractors.getLast().getLargestParsedTimestampUs();
        if (this.extractors.size() > 1) {
            largestParsedTimestampUs = Math.max(largestParsedTimestampUs, this.extractors.get(this.extractors.size() - 2).getLargestParsedTimestampUs());
        }
        return largestParsedTimestampUs == Long.MIN_VALUE ? this.downstreamPositionUs : largestParsedTimestampUs;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void release() {
        Assertions.checkState(this.remainingReleaseCount > 0);
        int i = this.remainingReleaseCount - 1;
        this.remainingReleaseCount = i;
        if (i == 0 && this.loader != null) {
            if (this.loadControlRegistered) {
                this.loadControl.unregister(this);
                this.loadControlRegistered = false;
            }
            this.loader.release();
            this.loader = null;
        }
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCompleted(Loader.Loadable loadable) {
        Assertions.checkState(loadable == this.currentLoadable);
        long now = SystemClock.elapsedRealtime();
        long loadDurationMs = now - this.currentLoadStartTimeMs;
        this.chunkSource.onChunkLoadCompleted(this.currentLoadable);
        if (isTsChunk(this.currentLoadable)) {
            Assertions.checkState(this.currentLoadable == this.currentTsLoadable);
            this.previousTsLoadable = this.currentTsLoadable;
            notifyLoadCompleted(this.currentLoadable.bytesLoaded(), this.currentTsLoadable.type, this.currentTsLoadable.trigger, this.currentTsLoadable.format, this.currentTsLoadable.startTimeUs, this.currentTsLoadable.endTimeUs, now, loadDurationMs);
        } else {
            notifyLoadCompleted(this.currentLoadable.bytesLoaded(), this.currentLoadable.type, this.currentLoadable.trigger, this.currentLoadable.format, -1L, -1L, now, loadDurationMs);
        }
        clearCurrentLoadable();
        maybeStartLoading();
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCanceled(Loader.Loadable loadable) {
        notifyLoadCanceled(this.currentLoadable.bytesLoaded());
        if (this.enabledTrackCount > 0) {
            restartFrom(this.pendingResetPositionUs);
        } else {
            clearState();
            this.loadControl.trimAllocator();
        }
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadError(Loader.Loadable loadable, IOException e) {
        if (this.chunkSource.onChunkLoadError(this.currentLoadable, e)) {
            if (this.previousTsLoadable == null && !isPendingReset()) {
                this.pendingResetPositionUs = this.lastSeekPositionUs;
            }
            clearCurrentLoadable();
        } else {
            this.currentLoadableException = e;
            this.currentLoadableExceptionCount++;
            this.currentLoadableExceptionTimestamp = SystemClock.elapsedRealtime();
        }
        notifyLoadError(e);
        maybeStartLoading();
    }

    private void buildTracks(HlsExtractorWrapper extractor) {
        int trackType;
        int primaryExtractorTrackType = 0;
        int primaryExtractorTrackIndex = -1;
        int extractorTrackCount = extractor.getTrackCount();
        for (int i = 0; i < extractorTrackCount; i++) {
            String mimeType = extractor.getMediaFormat(i).mimeType;
            if (MimeTypes.isVideo(mimeType)) {
                trackType = 3;
            } else if (MimeTypes.isAudio(mimeType)) {
                trackType = 2;
            } else if (MimeTypes.isText(mimeType)) {
                trackType = 1;
            } else {
                trackType = 0;
            }
            if (trackType > primaryExtractorTrackType) {
                primaryExtractorTrackType = trackType;
                primaryExtractorTrackIndex = i;
            } else if (trackType == primaryExtractorTrackType && primaryExtractorTrackIndex != -1) {
                primaryExtractorTrackIndex = -1;
            }
        }
        int chunkSourceTrackCount = this.chunkSource.getTrackCount();
        boolean expandPrimaryExtractorTrack = primaryExtractorTrackIndex != -1;
        this.trackCount = extractorTrackCount;
        if (expandPrimaryExtractorTrack) {
            this.trackCount += chunkSourceTrackCount - 1;
        }
        this.trackFormats = new MediaFormat[this.trackCount];
        this.trackEnabledStates = new boolean[this.trackCount];
        this.pendingDiscontinuities = new boolean[this.trackCount];
        this.downstreamMediaFormats = new MediaFormat[this.trackCount];
        this.chunkSourceTrackIndices = new int[this.trackCount];
        this.extractorTrackIndices = new int[this.trackCount];
        this.extractorTrackEnabledStates = new boolean[extractorTrackCount];
        long durationUs = this.chunkSource.getDurationUs();
        int trackIndex = 0;
        for (int i2 = 0; i2 < extractorTrackCount; i2++) {
            MediaFormat format = extractor.getMediaFormat(i2).copyWithDurationUs(durationUs);
            if (i2 == primaryExtractorTrackIndex) {
                for (int j = 0; j < chunkSourceTrackCount; j++) {
                    this.extractorTrackIndices[trackIndex] = i2;
                    this.chunkSourceTrackIndices[trackIndex] = j;
                    Variant fixedTrackVariant = this.chunkSource.getFixedTrackVariant(j);
                    int i3 = trackIndex;
                    trackIndex++;
                    this.trackFormats[i3] = fixedTrackVariant == null ? format.copyAsAdaptive(null) : copyWithFixedTrackInfo(format, fixedTrackVariant.format);
                }
            } else {
                this.extractorTrackIndices[trackIndex] = i2;
                this.chunkSourceTrackIndices[trackIndex] = -1;
                int i4 = trackIndex;
                trackIndex++;
                this.trackFormats[i4] = format;
            }
        }
    }

    private void setTrackEnabledState(int track, boolean enabledState) {
        Assertions.checkState(this.trackEnabledStates[track] != enabledState);
        int extractorTrack = this.extractorTrackIndices[track];
        Assertions.checkState(this.extractorTrackEnabledStates[extractorTrack] != enabledState);
        this.trackEnabledStates[track] = enabledState;
        this.extractorTrackEnabledStates[extractorTrack] = enabledState;
        this.enabledTrackCount += enabledState ? 1 : -1;
    }

    private static MediaFormat copyWithFixedTrackInfo(MediaFormat format, Format fixedTrackFormat) {
        int width = fixedTrackFormat.width == -1 ? -1 : fixedTrackFormat.width;
        int height = fixedTrackFormat.height == -1 ? -1 : fixedTrackFormat.height;
        return format.copyWithFixedTrackInfo(fixedTrackFormat.id, fixedTrackFormat.bitrate, width, height, fixedTrackFormat.language);
    }

    private void seekToInternal(long positionUs) {
        this.lastSeekPositionUs = positionUs;
        this.downstreamPositionUs = positionUs;
        Arrays.fill(this.pendingDiscontinuities, true);
        this.chunkSource.seek();
        restartFrom(positionUs);
    }

    private HlsExtractorWrapper getCurrentExtractor() {
        HlsExtractorWrapper extractor;
        HlsExtractorWrapper first = this.extractors.getFirst();
        while (true) {
            extractor = first;
            if (this.extractors.size() <= 1 || haveSamplesForEnabledTracks(extractor)) {
                break;
            }
            this.extractors.removeFirst().clear();
            first = this.extractors.getFirst();
        }
        return extractor;
    }

    private void discardSamplesForDisabledTracks(HlsExtractorWrapper extractor, long timeUs) {
        if (!extractor.isPrepared()) {
            return;
        }
        for (int i = 0; i < this.extractorTrackEnabledStates.length; i++) {
            if (!this.extractorTrackEnabledStates[i]) {
                extractor.discardUntil(i, timeUs);
            }
        }
    }

    private boolean haveSamplesForEnabledTracks(HlsExtractorWrapper extractor) {
        if (!extractor.isPrepared()) {
            return false;
        }
        for (int i = 0; i < this.extractorTrackEnabledStates.length; i++) {
            if (this.extractorTrackEnabledStates[i] && extractor.hasSamples(i)) {
                return true;
            }
        }
        return false;
    }

    private void restartFrom(long positionUs) {
        this.pendingResetPositionUs = positionUs;
        this.loadingFinished = false;
        if (this.loader.isLoading()) {
            this.loader.cancelLoading();
        } else {
            clearState();
            maybeStartLoading();
        }
    }

    private void clearState() {
        for (int i = 0; i < this.extractors.size(); i++) {
            this.extractors.get(i).clear();
        }
        this.extractors.clear();
        clearCurrentLoadable();
        this.previousTsLoadable = null;
    }

    private void clearCurrentLoadable() {
        this.currentTsLoadable = null;
        this.currentLoadable = null;
        this.currentLoadableException = null;
        this.currentLoadableExceptionCount = 0;
    }

    private void maybeStartLoading() {
        long now = SystemClock.elapsedRealtime();
        long nextLoadPositionUs = getNextLoadPositionUs();
        boolean isBackedOff = this.currentLoadableException != null;
        boolean loadingOrBackedOff = this.loader.isLoading() || isBackedOff;
        boolean nextLoader = this.loadControl.update(this, this.downstreamPositionUs, nextLoadPositionUs, loadingOrBackedOff);
        if (isBackedOff) {
            long elapsedMillis = now - this.currentLoadableExceptionTimestamp;
            if (elapsedMillis >= getRetryDelayMillis(this.currentLoadableExceptionCount)) {
                this.currentLoadableException = null;
                this.loader.startLoading(this.currentLoadable, this);
                return;
            }
            return;
        }
        if (this.loader.isLoading() || !nextLoader) {
            return;
        }
        if (this.prepared && this.enabledTrackCount == 0) {
            return;
        }
        this.chunkSource.getChunkOperation(this.previousTsLoadable, this.pendingResetPositionUs != Long.MIN_VALUE ? this.pendingResetPositionUs : this.downstreamPositionUs, this.chunkOperationHolder);
        boolean endOfStream = this.chunkOperationHolder.endOfStream;
        Chunk nextLoadable = this.chunkOperationHolder.chunk;
        this.chunkOperationHolder.clear();
        if (endOfStream) {
            this.loadingFinished = true;
            this.loadControl.update(this, this.downstreamPositionUs, -1L, false);
            return;
        }
        if (nextLoadable == null) {
            return;
        }
        this.currentLoadStartTimeMs = now;
        this.currentLoadable = nextLoadable;
        if (isTsChunk(this.currentLoadable)) {
            TsChunk tsChunk = (TsChunk) this.currentLoadable;
            if (isPendingReset()) {
                this.pendingResetPositionUs = Long.MIN_VALUE;
            }
            HlsExtractorWrapper extractorWrapper = tsChunk.extractorWrapper;
            if (this.extractors.isEmpty() || this.extractors.getLast() != extractorWrapper) {
                extractorWrapper.init(this.loadControl.getAllocator());
                this.extractors.addLast(extractorWrapper);
            }
            notifyLoadStarted(tsChunk.dataSpec.length, tsChunk.type, tsChunk.trigger, tsChunk.format, tsChunk.startTimeUs, tsChunk.endTimeUs);
            this.currentTsLoadable = tsChunk;
        } else {
            notifyLoadStarted(this.currentLoadable.dataSpec.length, this.currentLoadable.type, this.currentLoadable.trigger, this.currentLoadable.format, -1L, -1L);
        }
        this.loader.startLoading(this.currentLoadable, this);
    }

    private long getNextLoadPositionUs() {
        if (isPendingReset()) {
            return this.pendingResetPositionUs;
        }
        if (this.loadingFinished || (this.prepared && this.enabledTrackCount == 0)) {
            return -1L;
        }
        return this.currentTsLoadable != null ? this.currentTsLoadable.endTimeUs : this.previousTsLoadable.endTimeUs;
    }

    private boolean isTsChunk(Chunk chunk) {
        return chunk instanceof TsChunk;
    }

    private boolean isPendingReset() {
        return this.pendingResetPositionUs != Long.MIN_VALUE;
    }

    private long getRetryDelayMillis(long errorCount) {
        return Math.min((errorCount - 1) * 1000, HlsChunkSource.DEFAULT_MIN_BUFFER_TO_SWITCH_UP_MS);
    }

    long usToMs(long timeUs) {
        return timeUs / 1000;
    }

    private void notifyLoadStarted(final long length, final int type, final int trigger, final Format format, final long mediaStartTimeUs, final long mediaEndTimeUs) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.hls.HlsSampleSource.1
                @Override // java.lang.Runnable
                public void run() {
                    HlsSampleSource.this.eventListener.onLoadStarted(HlsSampleSource.this.eventSourceId, length, type, trigger, format, HlsSampleSource.this.usToMs(mediaStartTimeUs), HlsSampleSource.this.usToMs(mediaEndTimeUs));
                }
            });
        }
    }

    private void notifyLoadCompleted(final long bytesLoaded, final int type, final int trigger, final Format format, final long mediaStartTimeUs, final long mediaEndTimeUs, final long elapsedRealtimeMs, final long loadDurationMs) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.hls.HlsSampleSource.2
                @Override // java.lang.Runnable
                public void run() {
                    HlsSampleSource.this.eventListener.onLoadCompleted(HlsSampleSource.this.eventSourceId, bytesLoaded, type, trigger, format, HlsSampleSource.this.usToMs(mediaStartTimeUs), HlsSampleSource.this.usToMs(mediaEndTimeUs), elapsedRealtimeMs, loadDurationMs);
                }
            });
        }
    }

    private void notifyLoadCanceled(final long bytesLoaded) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.hls.HlsSampleSource.3
                @Override // java.lang.Runnable
                public void run() {
                    HlsSampleSource.this.eventListener.onLoadCanceled(HlsSampleSource.this.eventSourceId, bytesLoaded);
                }
            });
        }
    }

    private void notifyLoadError(final IOException e) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.hls.HlsSampleSource.4
                @Override // java.lang.Runnable
                public void run() {
                    HlsSampleSource.this.eventListener.onLoadError(HlsSampleSource.this.eventSourceId, e);
                }
            });
        }
    }

    private void notifyDownstreamFormatChanged(final Format format, final int trigger, final long positionUs) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.hls.HlsSampleSource.5
                @Override // java.lang.Runnable
                public void run() {
                    HlsSampleSource.this.eventListener.onDownstreamFormatChanged(HlsSampleSource.this.eventSourceId, format, trigger, HlsSampleSource.this.usToMs(positionUs));
                }
            });
        }
    }
}
