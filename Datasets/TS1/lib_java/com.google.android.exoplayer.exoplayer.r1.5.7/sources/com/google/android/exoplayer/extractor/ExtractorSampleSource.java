package com.google.android.exoplayer.extractor;

import android.net.Uri;
import android.os.Handler;
import android.os.SystemClock;
import android.util.SparseArray;
import com.google.android.exoplayer.C;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.hls.HlsChunkSource;
import com.google.android.exoplayer.upstream.Allocator;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.upstream.Loader;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ExtractorSampleSource.class */
public final class ExtractorSampleSource implements SampleSource, SampleSource.SampleSourceReader, ExtractorOutput, Loader.Callback {
    public static final int DEFAULT_MIN_LOADABLE_RETRY_COUNT_ON_DEMAND = 3;
    public static final int DEFAULT_MIN_LOADABLE_RETRY_COUNT_LIVE = 6;
    private static final int MIN_RETRY_COUNT_DEFAULT_FOR_MEDIA = -1;
    private static final long NO_RESET_PENDING = Long.MIN_VALUE;
    private static final List<Class<? extends Extractor>> DEFAULT_EXTRACTOR_CLASSES = new ArrayList();
    private final ExtractorHolder extractorHolder;
    private final Allocator allocator;
    private final int requestedBufferSize;
    private final SparseArray<InternalTrackOutput> sampleQueues;
    private final int minLoadableRetryCount;
    private final Uri uri;
    private final DataSource dataSource;
    private final Handler eventHandler;
    private final EventListener eventListener;
    private final int eventSourceId;
    private volatile boolean tracksBuilt;
    private volatile SeekMap seekMap;
    private volatile DrmInitData drmInitData;
    private boolean prepared;
    private int enabledTrackCount;
    private MediaFormat[] mediaFormats;
    private long maxTrackDurationUs;
    private boolean[] pendingMediaFormat;
    private boolean[] pendingDiscontinuities;
    private boolean[] trackEnabledStates;
    private int remainingReleaseCount;
    private long downstreamPositionUs;
    private long lastSeekPositionUs;
    private long pendingResetPositionUs;
    private boolean havePendingNextSampleUs;
    private long pendingNextSampleUs;
    private long sampleTimeOffsetUs;
    private Loader loader;
    private ExtractingLoadable loadable;
    private IOException currentLoadableException;
    private int currentLoadableExceptionCount;
    private long currentLoadableExceptionTimestamp;
    private boolean loadingFinished;
    private int extractedSampleCount;
    private int extractedSampleCountAtStartOfLoad;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ExtractorSampleSource$EventListener.class */
    public interface EventListener {
        void onLoadError(int i, IOException iOException);
    }

    static /* synthetic */ int access$308(ExtractorSampleSource x0) {
        int i = x0.extractedSampleCount;
        x0.extractedSampleCount = i + 1;
        return i;
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ExtractorSampleSource$UnrecognizedInputFormatException.class */
    public static final class UnrecognizedInputFormatException extends ParserException {
        public UnrecognizedInputFormatException(Extractor[] extractors) {
            super("None of the available extractors (" + Util.getCommaDelimitedSimpleClassNames(extractors) + ") could read the stream.");
        }
    }

    static {
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.webm.WebmExtractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.mp4.FragmentedMp4Extractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e2) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.mp4.Mp4Extractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e3) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.mp3.Mp3Extractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e4) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.ts.AdtsExtractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e5) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.ts.TsExtractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e6) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.flv.FlvExtractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e7) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.ogg.OggVorbisExtractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e8) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.ts.PsExtractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e9) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.extractor.wav.WavExtractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e10) {
        }
        try {
            DEFAULT_EXTRACTOR_CLASSES.add(Class.forName("com.google.android.exoplayer.ext.flac.FlacExtractor").asSubclass(Extractor.class));
        } catch (ClassNotFoundException e11) {
        }
    }

    public ExtractorSampleSource(Uri uri, DataSource dataSource, Allocator allocator, int requestedBufferSize, Extractor... extractors) {
        this(uri, dataSource, allocator, requestedBufferSize, -1, extractors);
    }

    public ExtractorSampleSource(Uri uri, DataSource dataSource, Allocator allocator, int requestedBufferSize, Handler eventHandler, EventListener eventListener, int eventSourceId, Extractor... extractors) {
        this(uri, dataSource, allocator, requestedBufferSize, -1, eventHandler, eventListener, eventSourceId, extractors);
    }

    public ExtractorSampleSource(Uri uri, DataSource dataSource, Allocator allocator, int requestedBufferSize, int minLoadableRetryCount, Extractor... extractors) {
        this(uri, dataSource, allocator, requestedBufferSize, minLoadableRetryCount, null, null, 0, extractors);
    }

    public ExtractorSampleSource(Uri uri, DataSource dataSource, Allocator allocator, int requestedBufferSize, int minLoadableRetryCount, Handler eventHandler, EventListener eventListener, int eventSourceId, Extractor... extractors) {
        this.uri = uri;
        this.dataSource = dataSource;
        this.eventListener = eventListener;
        this.eventHandler = eventHandler;
        this.eventSourceId = eventSourceId;
        this.allocator = allocator;
        this.requestedBufferSize = requestedBufferSize;
        this.minLoadableRetryCount = minLoadableRetryCount;
        if (extractors == null || extractors.length == 0) {
            extractors = new Extractor[DEFAULT_EXTRACTOR_CLASSES.size()];
            for (int i = 0; i < extractors.length; i++) {
                try {
                    extractors[i] = DEFAULT_EXTRACTOR_CLASSES.get(i).newInstance();
                } catch (IllegalAccessException e) {
                    throw new IllegalStateException("Unexpected error creating default extractor", e);
                } catch (InstantiationException e2) {
                    throw new IllegalStateException("Unexpected error creating default extractor", e2);
                }
            }
        }
        this.extractorHolder = new ExtractorHolder(extractors, this);
        this.sampleQueues = new SparseArray<>();
        this.pendingResetPositionUs = Long.MIN_VALUE;
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
        if (this.loader == null) {
            this.loader = new Loader("Loader:ExtractorSampleSource");
        }
        maybeStartLoading();
        if (this.seekMap != null && this.tracksBuilt && haveFormatsForAllTracks()) {
            int trackCount = this.sampleQueues.size();
            this.trackEnabledStates = new boolean[trackCount];
            this.pendingDiscontinuities = new boolean[trackCount];
            this.pendingMediaFormat = new boolean[trackCount];
            this.mediaFormats = new MediaFormat[trackCount];
            this.maxTrackDurationUs = -1L;
            for (int i = 0; i < trackCount; i++) {
                MediaFormat format = this.sampleQueues.valueAt(i).getFormat();
                this.mediaFormats[i] = format;
                if (format.durationUs != -1 && format.durationUs > this.maxTrackDurationUs) {
                    this.maxTrackDurationUs = format.durationUs;
                }
            }
            this.prepared = true;
            return true;
        }
        return false;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public int getTrackCount() {
        return this.sampleQueues.size();
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public MediaFormat getFormat(int track) {
        Assertions.checkState(this.prepared);
        return this.mediaFormats[track];
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void enable(int track, long positionUs) {
        Assertions.checkState(this.prepared);
        Assertions.checkState(!this.trackEnabledStates[track]);
        this.enabledTrackCount++;
        this.trackEnabledStates[track] = true;
        this.pendingMediaFormat[track] = true;
        this.pendingDiscontinuities[track] = false;
        if (this.enabledTrackCount == 1) {
            long positionUs2 = !this.seekMap.isSeekable() ? 0L : positionUs;
            this.downstreamPositionUs = positionUs2;
            this.lastSeekPositionUs = positionUs2;
            restartFrom(positionUs2);
        }
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void disable(int track) {
        Assertions.checkState(this.prepared);
        Assertions.checkState(this.trackEnabledStates[track]);
        this.enabledTrackCount--;
        this.trackEnabledStates[track] = false;
        if (this.enabledTrackCount == 0) {
            this.downstreamPositionUs = Long.MIN_VALUE;
            if (this.loader.isLoading()) {
                this.loader.cancelLoading();
            } else {
                clearState();
                this.allocator.trim(0);
            }
        }
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public boolean continueBuffering(int track, long playbackPositionUs) {
        Assertions.checkState(this.prepared);
        Assertions.checkState(this.trackEnabledStates[track]);
        this.downstreamPositionUs = playbackPositionUs;
        discardSamplesForDisabledTracks(this.downstreamPositionUs);
        if (this.loadingFinished) {
            return true;
        }
        maybeStartLoading();
        return (isPendingReset() || this.sampleQueues.valueAt(track).isEmpty()) ? false : true;
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
        this.downstreamPositionUs = playbackPositionUs;
        if (this.pendingDiscontinuities[track] || isPendingReset()) {
            return -2;
        }
        InternalTrackOutput sampleQueue = this.sampleQueues.valueAt(track);
        if (this.pendingMediaFormat[track]) {
            formatHolder.format = sampleQueue.getFormat();
            formatHolder.drmInitData = this.drmInitData;
            this.pendingMediaFormat[track] = false;
            return -4;
        }
        if (sampleQueue.getSample(sampleHolder)) {
            boolean decodeOnly = sampleHolder.timeUs < this.lastSeekPositionUs;
            sampleHolder.flags |= decodeOnly ? C.SAMPLE_FLAG_DECODE_ONLY : 0;
            if (this.havePendingNextSampleUs) {
                this.sampleTimeOffsetUs = this.pendingNextSampleUs - sampleHolder.timeUs;
                this.havePendingNextSampleUs = false;
            }
            sampleHolder.timeUs += this.sampleTimeOffsetUs;
            return -3;
        }
        if (this.loadingFinished) {
            return -1;
        }
        return -2;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void maybeThrowError() throws IOException {
        int minLoadableRetryCountForMedia;
        if (this.currentLoadableException == null) {
            return;
        }
        if (isCurrentLoadableExceptionFatal()) {
            throw this.currentLoadableException;
        }
        if (this.minLoadableRetryCount != -1) {
            minLoadableRetryCountForMedia = this.minLoadableRetryCount;
        } else {
            minLoadableRetryCountForMedia = (this.seekMap == null || this.seekMap.isSeekable()) ? 3 : 6;
        }
        if (this.currentLoadableExceptionCount > minLoadableRetryCountForMedia) {
            throw this.currentLoadableException;
        }
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void seekToUs(long positionUs) {
        Assertions.checkState(this.prepared);
        Assertions.checkState(this.enabledTrackCount > 0);
        long positionUs2 = !this.seekMap.isSeekable() ? 0L : positionUs;
        long currentPositionUs = isPendingReset() ? this.pendingResetPositionUs : this.downstreamPositionUs;
        this.downstreamPositionUs = positionUs2;
        this.lastSeekPositionUs = positionUs2;
        if (currentPositionUs == positionUs2) {
            return;
        }
        boolean seekInsideBuffer = !isPendingReset();
        for (int i = 0; seekInsideBuffer && i < this.sampleQueues.size(); i++) {
            seekInsideBuffer &= this.sampleQueues.valueAt(i).skipToKeyframeBefore(positionUs2);
        }
        if (!seekInsideBuffer) {
            restartFrom(positionUs2);
        }
        for (int i2 = 0; i2 < this.pendingDiscontinuities.length; i2++) {
            this.pendingDiscontinuities[i2] = true;
        }
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public long getBufferedPositionUs() {
        if (this.loadingFinished) {
            return -3L;
        }
        if (isPendingReset()) {
            return this.pendingResetPositionUs;
        }
        long largestParsedTimestampUs = Long.MIN_VALUE;
        for (int i = 0; i < this.sampleQueues.size(); i++) {
            largestParsedTimestampUs = Math.max(largestParsedTimestampUs, this.sampleQueues.valueAt(i).getLargestParsedTimestampUs());
        }
        return largestParsedTimestampUs == Long.MIN_VALUE ? this.downstreamPositionUs : largestParsedTimestampUs;
    }

    @Override // com.google.android.exoplayer.SampleSource.SampleSourceReader
    public void release() {
        Assertions.checkState(this.remainingReleaseCount > 0);
        int i = this.remainingReleaseCount - 1;
        this.remainingReleaseCount = i;
        if (i == 0) {
            if (this.loader != null) {
                this.loader.release();
                this.loader = null;
            }
            if (this.extractorHolder.extractor == null) {
                return;
            }
            this.extractorHolder.extractor.release();
            this.extractorHolder.extractor = null;
        }
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCompleted(Loader.Loadable loadable) {
        this.loadingFinished = true;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCanceled(Loader.Loadable loadable) {
        if (this.enabledTrackCount > 0) {
            restartFrom(this.pendingResetPositionUs);
        } else {
            clearState();
            this.allocator.trim(0);
        }
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadError(Loader.Loadable ignored, IOException e) {
        this.currentLoadableException = e;
        this.currentLoadableExceptionCount = this.extractedSampleCount > this.extractedSampleCountAtStartOfLoad ? 1 : this.currentLoadableExceptionCount + 1;
        this.currentLoadableExceptionTimestamp = SystemClock.elapsedRealtime();
        notifyLoadError(e);
        maybeStartLoading();
    }

    @Override // com.google.android.exoplayer.extractor.ExtractorOutput
    public TrackOutput track(int id) {
        InternalTrackOutput sampleQueue = this.sampleQueues.get(id);
        if (sampleQueue == null) {
            sampleQueue = new InternalTrackOutput(this.allocator);
            this.sampleQueues.put(id, sampleQueue);
        }
        return sampleQueue;
    }

    @Override // com.google.android.exoplayer.extractor.ExtractorOutput
    public void endTracks() {
        this.tracksBuilt = true;
    }

    @Override // com.google.android.exoplayer.extractor.ExtractorOutput
    public void seekMap(SeekMap seekMap) {
        this.seekMap = seekMap;
    }

    @Override // com.google.android.exoplayer.extractor.ExtractorOutput
    public void drmInitData(DrmInitData drmInitData) {
        this.drmInitData = drmInitData;
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

    private void maybeStartLoading() {
        if (this.loadingFinished || this.loader.isLoading()) {
            return;
        }
        if (this.currentLoadableException != null) {
            if (isCurrentLoadableExceptionFatal()) {
                return;
            }
            Assertions.checkState(this.loadable != null);
            long elapsedMillis = SystemClock.elapsedRealtime() - this.currentLoadableExceptionTimestamp;
            if (elapsedMillis >= getRetryDelayMillis(this.currentLoadableExceptionCount)) {
                this.currentLoadableException = null;
                if (!this.prepared) {
                    for (int i = 0; i < this.sampleQueues.size(); i++) {
                        this.sampleQueues.valueAt(i).clear();
                    }
                    this.loadable = createLoadableFromStart();
                } else if (!this.seekMap.isSeekable() && this.maxTrackDurationUs == -1) {
                    for (int i2 = 0; i2 < this.sampleQueues.size(); i2++) {
                        this.sampleQueues.valueAt(i2).clear();
                    }
                    this.loadable = createLoadableFromStart();
                    this.pendingNextSampleUs = this.downstreamPositionUs;
                    this.havePendingNextSampleUs = true;
                }
                this.extractedSampleCountAtStartOfLoad = this.extractedSampleCount;
                this.loader.startLoading(this.loadable, this);
                return;
            }
            return;
        }
        this.sampleTimeOffsetUs = 0L;
        this.havePendingNextSampleUs = false;
        if (!this.prepared) {
            this.loadable = createLoadableFromStart();
        } else {
            Assertions.checkState(isPendingReset());
            if (this.maxTrackDurationUs != -1 && this.pendingResetPositionUs >= this.maxTrackDurationUs) {
                this.loadingFinished = true;
                this.pendingResetPositionUs = Long.MIN_VALUE;
                return;
            } else {
                this.loadable = createLoadableFromPositionUs(this.pendingResetPositionUs);
                this.pendingResetPositionUs = Long.MIN_VALUE;
            }
        }
        this.extractedSampleCountAtStartOfLoad = this.extractedSampleCount;
        this.loader.startLoading(this.loadable, this);
    }

    private ExtractingLoadable createLoadableFromStart() {
        return new ExtractingLoadable(this.uri, this.dataSource, this.extractorHolder, this.allocator, this.requestedBufferSize, 0L);
    }

    private ExtractingLoadable createLoadableFromPositionUs(long positionUs) {
        return new ExtractingLoadable(this.uri, this.dataSource, this.extractorHolder, this.allocator, this.requestedBufferSize, this.seekMap.getPosition(positionUs));
    }

    private boolean haveFormatsForAllTracks() {
        for (int i = 0; i < this.sampleQueues.size(); i++) {
            if (!this.sampleQueues.valueAt(i).hasFormat()) {
                return false;
            }
        }
        return true;
    }

    private void discardSamplesForDisabledTracks(long timeUs) {
        for (int i = 0; i < this.trackEnabledStates.length; i++) {
            if (!this.trackEnabledStates[i]) {
                this.sampleQueues.valueAt(i).discardUntil(timeUs);
            }
        }
    }

    private void clearState() {
        for (int i = 0; i < this.sampleQueues.size(); i++) {
            this.sampleQueues.valueAt(i).clear();
        }
        this.loadable = null;
        this.currentLoadableException = null;
        this.currentLoadableExceptionCount = 0;
    }

    private boolean isPendingReset() {
        return this.pendingResetPositionUs != Long.MIN_VALUE;
    }

    private boolean isCurrentLoadableExceptionFatal() {
        return this.currentLoadableException instanceof UnrecognizedInputFormatException;
    }

    private long getRetryDelayMillis(long errorCount) {
        return Math.min((errorCount - 1) * 1000, HlsChunkSource.DEFAULT_MIN_BUFFER_TO_SWITCH_UP_MS);
    }

    private void notifyLoadError(final IOException e) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.extractor.ExtractorSampleSource.1
                @Override // java.lang.Runnable
                public void run() {
                    ExtractorSampleSource.this.eventListener.onLoadError(ExtractorSampleSource.this.eventSourceId, e);
                }
            });
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ExtractorSampleSource$InternalTrackOutput.class */
    private class InternalTrackOutput extends DefaultTrackOutput {
        public InternalTrackOutput(Allocator allocator) {
            super(allocator);
        }

        @Override // com.google.android.exoplayer.extractor.DefaultTrackOutput, com.google.android.exoplayer.extractor.TrackOutput
        public void sampleMetadata(long timeUs, int flags, int size, int offset, byte[] encryptionKey) {
            super.sampleMetadata(timeUs, flags, size, offset, encryptionKey);
            ExtractorSampleSource.access$308(ExtractorSampleSource.this);
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable.class */
    private static class ExtractingLoadable implements Loader.Loadable {
        private final Uri uri;
        private final DataSource dataSource;
        private final ExtractorHolder extractorHolder;
        private final Allocator allocator;
        private final int requestedBufferSize;
        private final PositionHolder positionHolder = new PositionHolder();
        private volatile boolean loadCanceled;
        private boolean pendingExtractorSeek;

        public ExtractingLoadable(Uri uri, DataSource dataSource, ExtractorHolder extractorHolder, Allocator allocator, int requestedBufferSize, long position) {
            this.uri = (Uri) Assertions.checkNotNull(uri);
            this.dataSource = (DataSource) Assertions.checkNotNull(dataSource);
            this.extractorHolder = (ExtractorHolder) Assertions.checkNotNull(extractorHolder);
            this.allocator = (Allocator) Assertions.checkNotNull(allocator);
            this.requestedBufferSize = requestedBufferSize;
            this.positionHolder.position = position;
            this.pendingExtractorSeek = true;
        }

        @Override // com.google.android.exoplayer.upstream.Loader.Loadable
        public void cancelLoad() {
            this.loadCanceled = true;
        }

        @Override // com.google.android.exoplayer.upstream.Loader.Loadable
        public boolean isLoadCanceled() {
            return this.loadCanceled;
        }

        @Override // com.google.android.exoplayer.upstream.Loader.Loadable
        public void load() throws IOException, InterruptedException {
            int result = 0;
            while (result == 0 && !this.loadCanceled) {
                ExtractorInput input = null;
                try {
                    long position = this.positionHolder.position;
                    long length = this.dataSource.open(new DataSpec(this.uri, position, -1L, null));
                    if (length != -1) {
                        length += position;
                    }
                    ExtractorInput input2 = new DefaultExtractorInput(this.dataSource, position, length);
                    Extractor extractor = this.extractorHolder.selectExtractor(input2);
                    if (this.pendingExtractorSeek) {
                        extractor.seek();
                        this.pendingExtractorSeek = false;
                    }
                    while (result == 0 && !this.loadCanceled) {
                        this.allocator.blockWhileTotalBytesAllocatedExceeds(this.requestedBufferSize);
                        result = extractor.read(input2, this.positionHolder);
                    }
                    if (result == 1) {
                        result = 0;
                    } else if (input2 != null) {
                        this.positionHolder.position = input2.getPosition();
                    }
                    this.dataSource.close();
                } catch (Throwable th) {
                    if (result != 1 && 0 != 0) {
                        this.positionHolder.position = input.getPosition();
                    }
                    this.dataSource.close();
                    throw th;
                }
            }
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder.class */
    private static final class ExtractorHolder {
        private final Extractor[] extractors;
        private final ExtractorOutput extractorOutput;
        private Extractor extractor;

        public ExtractorHolder(Extractor[] extractors, ExtractorOutput extractorOutput) {
            this.extractors = extractors;
            this.extractorOutput = extractorOutput;
        }

        public Extractor selectExtractor(ExtractorInput input) throws UnrecognizedInputFormatException, IOException, InterruptedException {
            if (this.extractor != null) {
                return this.extractor;
            }
            Extractor[] arr$ = this.extractors;
            int len$ = arr$.length;
            int i$ = 0;
            while (true) {
                if (i$ >= len$) {
                    break;
                }
                Extractor extractor = arr$[i$];
                try {
                } catch (EOFException e) {
                    input.resetPeekPosition();
                } catch (Throwable th) {
                    input.resetPeekPosition();
                    throw th;
                }
                if (!extractor.sniff(input)) {
                    input.resetPeekPosition();
                    i$++;
                } else {
                    this.extractor = extractor;
                    input.resetPeekPosition();
                    break;
                }
            }
            if (this.extractor == null) {
                throw new UnrecognizedInputFormatException(this.extractors);
            }
            this.extractor.init(this.extractorOutput);
            return this.extractor;
        }
    }
}
