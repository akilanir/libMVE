package com.google.android.exoplayer.dash;

import android.os.Handler;
import android.util.Log;
import android.util.SparseArray;
import com.google.android.exoplayer.BehindLiveWindowException;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.TimeRange;
import com.google.android.exoplayer.chunk.Chunk;
import com.google.android.exoplayer.chunk.ChunkExtractorWrapper;
import com.google.android.exoplayer.chunk.ChunkOperationHolder;
import com.google.android.exoplayer.chunk.ChunkSource;
import com.google.android.exoplayer.chunk.ContainerMediaChunk;
import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.chunk.FormatEvaluator;
import com.google.android.exoplayer.chunk.InitializationChunk;
import com.google.android.exoplayer.chunk.MediaChunk;
import com.google.android.exoplayer.chunk.SingleSampleMediaChunk;
import com.google.android.exoplayer.dash.DashTrackSelector;
import com.google.android.exoplayer.dash.mpd.AdaptationSet;
import com.google.android.exoplayer.dash.mpd.ContentProtection;
import com.google.android.exoplayer.dash.mpd.MediaPresentationDescription;
import com.google.android.exoplayer.dash.mpd.Period;
import com.google.android.exoplayer.dash.mpd.RangedUri;
import com.google.android.exoplayer.dash.mpd.Representation;
import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.extractor.ChunkIndex;
import com.google.android.exoplayer.extractor.mp4.FragmentedMp4Extractor;
import com.google.android.exoplayer.extractor.webm.WebmExtractor;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.util.Clock;
import com.google.android.exoplayer.util.ManifestFetcher;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.SystemClock;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashChunkSource.class */
public class DashChunkSource implements ChunkSource, DashTrackSelector.Output {
    private static final String TAG = "DashChunkSource";
    private final Handler eventHandler;
    private final EventListener eventListener;
    private final DataSource dataSource;
    private final FormatEvaluator adaptiveFormatEvaluator;
    private final FormatEvaluator.Evaluation evaluation;
    private final ManifestFetcher<MediaPresentationDescription> manifestFetcher;
    private final DashTrackSelector trackSelector;
    private final ArrayList<ExposedTrack> tracks;
    private final SparseArray<PeriodHolder> periodHolders;
    private final Clock systemClock;
    private final long liveEdgeLatencyUs;
    private final long elapsedRealtimeOffsetUs;
    private final long[] availableRangeValues;
    private final boolean live;
    private final int eventSourceId;
    private MediaPresentationDescription currentManifest;
    private MediaPresentationDescription processedManifest;
    private ExposedTrack enabledTrack;
    private int nextPeriodHolderIndex;
    private TimeRange availableRange;
    private boolean prepareCalled;
    private boolean startAtLiveEdge;
    private boolean lastChunkWasInitialization;
    private IOException fatalError;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashChunkSource$EventListener.class */
    public interface EventListener {
        void onAvailableRangeChanged(int i, TimeRange timeRange);
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashChunkSource$NoAdaptationSetException.class */
    public static class NoAdaptationSetException extends IOException {
        public NoAdaptationSetException(String message) {
            super(message);
        }
    }

    public DashChunkSource(DashTrackSelector trackSelector, DataSource dataSource, FormatEvaluator adaptiveFormatEvaluator, long durationMs, int adaptationSetType, Representation... representations) {
        this(trackSelector, dataSource, adaptiveFormatEvaluator, durationMs, adaptationSetType, (List<Representation>) Arrays.asList(representations));
    }

    public DashChunkSource(DashTrackSelector trackSelector, DataSource dataSource, FormatEvaluator adaptiveFormatEvaluator, long durationMs, int adaptationSetType, List<Representation> representations) {
        this(buildManifest(durationMs, adaptationSetType, representations), trackSelector, dataSource, adaptiveFormatEvaluator);
    }

    public DashChunkSource(MediaPresentationDescription manifest, DashTrackSelector trackSelector, DataSource dataSource, FormatEvaluator adaptiveFormatEvaluator) {
        this(null, manifest, trackSelector, dataSource, adaptiveFormatEvaluator, new SystemClock(), 0L, 0L, false, null, null, 0);
    }

    public DashChunkSource(ManifestFetcher<MediaPresentationDescription> manifestFetcher, DashTrackSelector trackSelector, DataSource dataSource, FormatEvaluator adaptiveFormatEvaluator, long liveEdgeLatencyMs, long elapsedRealtimeOffsetMs, Handler eventHandler, EventListener eventListener, int eventSourceId) {
        this(manifestFetcher, manifestFetcher.getManifest(), trackSelector, dataSource, adaptiveFormatEvaluator, new SystemClock(), liveEdgeLatencyMs * 1000, elapsedRealtimeOffsetMs * 1000, true, eventHandler, eventListener, eventSourceId);
    }

    public DashChunkSource(ManifestFetcher<MediaPresentationDescription> manifestFetcher, DashTrackSelector trackSelector, DataSource dataSource, FormatEvaluator adaptiveFormatEvaluator, long liveEdgeLatencyMs, long elapsedRealtimeOffsetMs, boolean startAtLiveEdge, Handler eventHandler, EventListener eventListener, int eventSourceId) {
        this(manifestFetcher, manifestFetcher.getManifest(), trackSelector, dataSource, adaptiveFormatEvaluator, new SystemClock(), liveEdgeLatencyMs * 1000, elapsedRealtimeOffsetMs * 1000, startAtLiveEdge, eventHandler, eventListener, eventSourceId);
    }

    DashChunkSource(ManifestFetcher<MediaPresentationDescription> manifestFetcher, MediaPresentationDescription initialManifest, DashTrackSelector trackSelector, DataSource dataSource, FormatEvaluator adaptiveFormatEvaluator, Clock systemClock, long liveEdgeLatencyUs, long elapsedRealtimeOffsetUs, boolean startAtLiveEdge, Handler eventHandler, EventListener eventListener, int eventSourceId) {
        this.manifestFetcher = manifestFetcher;
        this.currentManifest = initialManifest;
        this.trackSelector = trackSelector;
        this.dataSource = dataSource;
        this.adaptiveFormatEvaluator = adaptiveFormatEvaluator;
        this.systemClock = systemClock;
        this.liveEdgeLatencyUs = liveEdgeLatencyUs;
        this.elapsedRealtimeOffsetUs = elapsedRealtimeOffsetUs;
        this.startAtLiveEdge = startAtLiveEdge;
        this.eventHandler = eventHandler;
        this.eventListener = eventListener;
        this.eventSourceId = eventSourceId;
        this.evaluation = new FormatEvaluator.Evaluation();
        this.availableRangeValues = new long[2];
        this.periodHolders = new SparseArray<>();
        this.tracks = new ArrayList<>();
        this.live = initialManifest.dynamic;
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public void maybeThrowError() throws IOException {
        if (this.fatalError != null) {
            throw this.fatalError;
        }
        if (this.manifestFetcher != null) {
            this.manifestFetcher.maybeThrowError();
        }
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public boolean prepare() {
        if (!this.prepareCalled) {
            this.prepareCalled = true;
            try {
                this.trackSelector.selectTracks(this.currentManifest, 0, this);
            } catch (IOException e) {
                this.fatalError = e;
            }
        }
        return this.fatalError == null;
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public int getTrackCount() {
        return this.tracks.size();
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public final MediaFormat getFormat(int track) {
        return this.tracks.get(track).trackFormat;
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public void enable(int track) {
        this.enabledTrack = this.tracks.get(track);
        if (this.enabledTrack.isAdaptive()) {
            this.adaptiveFormatEvaluator.enable();
        }
        if (this.manifestFetcher != null) {
            this.manifestFetcher.enable();
            processManifest(this.manifestFetcher.getManifest());
        } else {
            processManifest(this.currentManifest);
        }
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public void continueBuffering(long playbackPositionUs) {
        if (this.manifestFetcher == null || !this.currentManifest.dynamic || this.fatalError != null) {
            return;
        }
        MediaPresentationDescription newManifest = this.manifestFetcher.getManifest();
        if (newManifest != null && newManifest != this.processedManifest) {
            processManifest(newManifest);
            this.processedManifest = newManifest;
        }
        long minUpdatePeriod = this.currentManifest.minUpdatePeriod;
        if (minUpdatePeriod == 0) {
            minUpdatePeriod = 5000;
        }
        if (android.os.SystemClock.elapsedRealtime() > this.manifestFetcher.getManifestLoadStartTimestamp() + minUpdatePeriod) {
            this.manifestFetcher.requestRefresh();
        }
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public final void getChunkOperation(List<? extends MediaChunk> queue, long playbackPositionUs, ChunkOperationHolder out) {
        boolean startingNewPeriod;
        PeriodHolder periodHolder;
        if (this.fatalError != null) {
            out.chunk = null;
            return;
        }
        this.evaluation.queueSize = queue.size();
        if (this.evaluation.format == null || !this.lastChunkWasInitialization) {
            if (this.enabledTrack.isAdaptive()) {
                this.adaptiveFormatEvaluator.evaluate(queue, playbackPositionUs, this.enabledTrack.adaptiveFormats, this.evaluation);
            } else {
                this.evaluation.format = this.enabledTrack.fixedFormat;
                this.evaluation.trigger = 2;
            }
        }
        Format selectedFormat = this.evaluation.format;
        out.queueSize = this.evaluation.queueSize;
        if (selectedFormat == null) {
            out.chunk = null;
            return;
        }
        if (out.queueSize == queue.size() && out.chunk != null && out.chunk.format.equals(selectedFormat)) {
            return;
        }
        out.chunk = null;
        this.availableRange.getCurrentBoundsUs(this.availableRangeValues);
        if (queue.isEmpty()) {
            if (this.live) {
                if (this.startAtLiveEdge) {
                    playbackPositionUs = Math.max(this.availableRangeValues[0], this.availableRangeValues[1] - this.liveEdgeLatencyUs);
                } else {
                    playbackPositionUs = Math.max(Math.min(playbackPositionUs, this.availableRangeValues[1] - 1), this.availableRangeValues[0]);
                }
            }
            periodHolder = findPeriodHolder(playbackPositionUs);
            startingNewPeriod = true;
        } else {
            if (this.startAtLiveEdge) {
                this.startAtLiveEdge = false;
            }
            MediaChunk previous = queue.get(out.queueSize - 1);
            long nextSegmentStartTimeUs = previous.endTimeUs;
            if (this.live && nextSegmentStartTimeUs < this.availableRangeValues[0]) {
                this.fatalError = new BehindLiveWindowException();
                return;
            }
            if (this.currentManifest.dynamic && nextSegmentStartTimeUs >= this.availableRangeValues[1]) {
                return;
            }
            PeriodHolder lastPeriodHolder = this.periodHolders.valueAt(this.periodHolders.size() - 1);
            if (previous.parentId == lastPeriodHolder.localIndex) {
                RepresentationHolder representationHolder = lastPeriodHolder.representationHolders.get(previous.format.id);
                if (representationHolder.isBeyondLastSegment(previous.getNextChunkIndex())) {
                    if (!this.currentManifest.dynamic) {
                        out.endOfStream = true;
                        return;
                    }
                    return;
                }
            }
            startingNewPeriod = false;
            periodHolder = this.periodHolders.get(previous.parentId);
            if (periodHolder == null) {
                periodHolder = this.periodHolders.valueAt(0);
                startingNewPeriod = true;
            } else if (!periodHolder.isIndexUnbounded()) {
                RepresentationHolder representationHolder2 = periodHolder.representationHolders.get(previous.format.id);
                if (representationHolder2.isBeyondLastSegment(previous.getNextChunkIndex())) {
                    periodHolder = this.periodHolders.get(previous.parentId + 1);
                    startingNewPeriod = true;
                }
            }
        }
        RepresentationHolder representationHolder3 = periodHolder.representationHolders.get(selectedFormat.id);
        Representation selectedRepresentation = representationHolder3.representation;
        RangedUri pendingInitializationUri = null;
        RangedUri pendingIndexUri = null;
        MediaFormat mediaFormat = representationHolder3.mediaFormat;
        if (mediaFormat == null) {
            pendingInitializationUri = selectedRepresentation.getInitializationUri();
        }
        if (representationHolder3.segmentIndex == null) {
            pendingIndexUri = selectedRepresentation.getIndexUri();
        }
        if (pendingInitializationUri != null || pendingIndexUri != null) {
            Chunk initializationChunk = newInitializationChunk(pendingInitializationUri, pendingIndexUri, selectedRepresentation, representationHolder3.extractorWrapper, this.dataSource, periodHolder.localIndex, this.evaluation.trigger);
            this.lastChunkWasInitialization = true;
            out.chunk = initializationChunk;
        } else {
            int segmentNum = queue.isEmpty() ? representationHolder3.getSegmentNum(playbackPositionUs) : startingNewPeriod ? representationHolder3.getFirstAvailableSegmentNum() : queue.get(out.queueSize - 1).getNextChunkIndex();
            Chunk nextMediaChunk = newMediaChunk(periodHolder, representationHolder3, this.dataSource, mediaFormat, this.enabledTrack, segmentNum, this.evaluation.trigger);
            this.lastChunkWasInitialization = false;
            out.chunk = nextMediaChunk;
        }
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public void onChunkLoadCompleted(Chunk chunk) {
        if (chunk instanceof InitializationChunk) {
            InitializationChunk initializationChunk = (InitializationChunk) chunk;
            String formatId = initializationChunk.format.id;
            PeriodHolder periodHolder = this.periodHolders.get(initializationChunk.parentId);
            if (periodHolder == null) {
                return;
            }
            RepresentationHolder representationHolder = periodHolder.representationHolders.get(formatId);
            if (initializationChunk.hasFormat()) {
                representationHolder.mediaFormat = initializationChunk.getFormat();
            }
            if (representationHolder.segmentIndex == null && initializationChunk.hasSeekMap()) {
                representationHolder.segmentIndex = new DashWrappingSegmentIndex((ChunkIndex) initializationChunk.getSeekMap(), initializationChunk.dataSpec.uri.toString());
            }
            if (periodHolder.drmInitData != null || !initializationChunk.hasDrmInitData()) {
                return;
            }
            periodHolder.drmInitData = initializationChunk.getDrmInitData();
        }
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public void onChunkLoadError(Chunk chunk, Exception e) {
    }

    @Override // com.google.android.exoplayer.chunk.ChunkSource
    public void disable(List<? extends MediaChunk> queue) {
        if (this.enabledTrack.isAdaptive()) {
            this.adaptiveFormatEvaluator.disable();
        }
        if (this.manifestFetcher != null) {
            this.manifestFetcher.disable();
        }
        this.periodHolders.clear();
        this.evaluation.format = null;
        this.availableRange = null;
        this.fatalError = null;
        this.enabledTrack = null;
    }

    @Override // com.google.android.exoplayer.dash.DashTrackSelector.Output
    public void adaptiveTrack(MediaPresentationDescription manifest, int periodIndex, int adaptationSetIndex, int[] representationIndices) {
        if (this.adaptiveFormatEvaluator == null) {
            Log.w(TAG, "Skipping adaptive track (missing format evaluator)");
            return;
        }
        AdaptationSet adaptationSet = manifest.getPeriod(periodIndex).adaptationSets.get(adaptationSetIndex);
        int maxWidth = 0;
        int maxHeight = 0;
        Format maxHeightRepresentationFormat = null;
        Format[] representationFormats = new Format[representationIndices.length];
        for (int i = 0; i < representationFormats.length; i++) {
            Format format = adaptationSet.representations.get(representationIndices[i]).format;
            if (maxHeightRepresentationFormat == null || format.height > maxHeight) {
                maxHeightRepresentationFormat = format;
            }
            maxWidth = Math.max(maxWidth, format.width);
            maxHeight = Math.max(maxHeight, format.height);
            representationFormats[i] = format;
        }
        Arrays.sort(representationFormats, new Format.DecreasingBandwidthComparator());
        long trackDurationUs = this.live ? -1L : manifest.duration * 1000;
        String mediaMimeType = getMediaMimeType(maxHeightRepresentationFormat);
        if (mediaMimeType == null) {
            Log.w(TAG, "Skipped adaptive track (unknown media mime type)");
            return;
        }
        MediaFormat trackFormat = getTrackFormat(adaptationSet.type, maxHeightRepresentationFormat, mediaMimeType, trackDurationUs);
        if (trackFormat == null) {
            Log.w(TAG, "Skipped adaptive track (unknown media format)");
        } else {
            this.tracks.add(new ExposedTrack(trackFormat.copyAsAdaptive(null), adaptationSetIndex, representationFormats, maxWidth, maxHeight));
        }
    }

    @Override // com.google.android.exoplayer.dash.DashTrackSelector.Output
    public void fixedTrack(MediaPresentationDescription manifest, int periodIndex, int adaptationSetIndex, int representationIndex) {
        List<AdaptationSet> adaptationSets = manifest.getPeriod(periodIndex).adaptationSets;
        AdaptationSet adaptationSet = adaptationSets.get(adaptationSetIndex);
        Format representationFormat = adaptationSet.representations.get(representationIndex).format;
        String mediaMimeType = getMediaMimeType(representationFormat);
        if (mediaMimeType == null) {
            Log.w(TAG, "Skipped track " + representationFormat.id + " (unknown media mime type)");
            return;
        }
        MediaFormat trackFormat = getTrackFormat(adaptationSet.type, representationFormat, mediaMimeType, manifest.dynamic ? -1L : manifest.duration * 1000);
        if (trackFormat == null) {
            Log.w(TAG, "Skipped track " + representationFormat.id + " (unknown media format)");
        } else {
            this.tracks.add(new ExposedTrack(trackFormat, adaptationSetIndex, representationFormat));
        }
    }

    TimeRange getAvailableRange() {
        return this.availableRange;
    }

    private static MediaPresentationDescription buildManifest(long durationMs, int adaptationSetType, List<Representation> representations) {
        AdaptationSet adaptationSet = new AdaptationSet(0, adaptationSetType, representations);
        Period period = new Period(null, 0L, Collections.singletonList(adaptationSet));
        return new MediaPresentationDescription(-1L, durationMs, -1L, false, -1L, -1L, null, null, Collections.singletonList(period));
    }

    private static MediaFormat getTrackFormat(int adaptationSetType, Format format, String mediaMimeType, long durationUs) {
        switch (adaptationSetType) {
            case 0:
                return MediaFormat.createVideoFormat(format.id, mediaMimeType, format.bitrate, -1, durationUs, format.width, format.height, null);
            case 1:
                return MediaFormat.createAudioFormat(format.id, mediaMimeType, format.bitrate, -1, durationUs, format.audioChannels, format.audioSamplingRate, null, format.language);
            case 2:
                return MediaFormat.createTextFormat(format.id, mediaMimeType, format.bitrate, durationUs, format.language);
            default:
                return null;
        }
    }

    private static String getMediaMimeType(Format format) {
        String formatMimeType = format.mimeType;
        if (MimeTypes.isAudio(formatMimeType)) {
            return MimeTypes.getAudioMediaMimeType(format.codecs);
        }
        if (MimeTypes.isVideo(formatMimeType)) {
            return MimeTypes.getVideoMediaMimeType(format.codecs);
        }
        if (mimeTypeIsRawText(formatMimeType)) {
            return formatMimeType;
        }
        if (MimeTypes.APPLICATION_MP4.equals(formatMimeType)) {
            if ("stpp".equals(format.codecs)) {
                return MimeTypes.APPLICATION_TTML;
            }
            if ("wvtt".equals(format.codecs)) {
                return MimeTypes.APPLICATION_MP4VTT;
            }
            return null;
        }
        return null;
    }

    static boolean mimeTypeIsWebm(String mimeType) {
        return mimeType.startsWith(MimeTypes.VIDEO_WEBM) || mimeType.startsWith(MimeTypes.AUDIO_WEBM) || mimeType.startsWith(MimeTypes.APPLICATION_WEBM);
    }

    static boolean mimeTypeIsRawText(String mimeType) {
        return MimeTypes.TEXT_VTT.equals(mimeType) || MimeTypes.APPLICATION_TTML.equals(mimeType);
    }

    private Chunk newInitializationChunk(RangedUri initializationUri, RangedUri indexUri, Representation representation, ChunkExtractorWrapper extractor, DataSource dataSource, int manifestIndex, int trigger) {
        RangedUri requestUri;
        if (initializationUri != null) {
            requestUri = initializationUri.attemptMerge(indexUri);
            if (requestUri == null) {
                requestUri = initializationUri;
            }
        } else {
            requestUri = indexUri;
        }
        DataSpec dataSpec = new DataSpec(requestUri.getUri(), requestUri.start, requestUri.length, representation.getCacheKey());
        return new InitializationChunk(dataSource, dataSpec, trigger, representation.format, extractor, manifestIndex);
    }

    protected Chunk newMediaChunk(PeriodHolder periodHolder, RepresentationHolder representationHolder, DataSource dataSource, MediaFormat mediaFormat, ExposedTrack enabledTrack, int segmentNum, int trigger) {
        Representation representation = representationHolder.representation;
        Format format = representation.format;
        long startTimeUs = representationHolder.getSegmentStartTimeUs(segmentNum);
        long endTimeUs = representationHolder.getSegmentEndTimeUs(segmentNum);
        RangedUri segmentUri = representationHolder.getSegmentUrl(segmentNum);
        DataSpec dataSpec = new DataSpec(segmentUri.getUri(), segmentUri.start, segmentUri.length, representation.getCacheKey());
        long sampleOffsetUs = periodHolder.startTimeUs - representation.presentationTimeOffsetUs;
        if (mimeTypeIsRawText(format.mimeType)) {
            return new SingleSampleMediaChunk(dataSource, dataSpec, 1, format, startTimeUs, endTimeUs, segmentNum, enabledTrack.trackFormat, null, periodHolder.localIndex);
        }
        boolean isMediaFormatFinal = mediaFormat != null;
        return new ContainerMediaChunk(dataSource, dataSpec, trigger, format, startTimeUs, endTimeUs, segmentNum, sampleOffsetUs, representationHolder.extractorWrapper, mediaFormat, enabledTrack.adaptiveMaxWidth, enabledTrack.adaptiveMaxHeight, periodHolder.drmInitData, isMediaFormatFinal, periodHolder.localIndex);
    }

    private long getNowUnixTimeUs() {
        if (this.elapsedRealtimeOffsetUs != 0) {
            return (this.systemClock.elapsedRealtime() * 1000) + this.elapsedRealtimeOffsetUs;
        }
        return System.currentTimeMillis() * 1000;
    }

    private PeriodHolder findPeriodHolder(long positionUs) {
        if (positionUs < this.periodHolders.valueAt(0).getAvailableStartTimeUs()) {
            return this.periodHolders.valueAt(0);
        }
        for (int i = 0; i < this.periodHolders.size() - 1; i++) {
            PeriodHolder periodHolder = this.periodHolders.valueAt(i);
            if (positionUs < periodHolder.getAvailableEndTimeUs()) {
                return periodHolder;
            }
        }
        return this.periodHolders.valueAt(this.periodHolders.size() - 1);
    }

    private void processManifest(MediaPresentationDescription manifest) {
        Period firstPeriod = manifest.getPeriod(0);
        while (this.periodHolders.size() > 0 && this.periodHolders.valueAt(0).startTimeUs < firstPeriod.startMs * 1000) {
            PeriodHolder periodHolder = this.periodHolders.valueAt(0);
            this.periodHolders.remove(periodHolder.localIndex);
        }
        if (this.periodHolders.size() > manifest.getPeriodCount()) {
            return;
        }
        try {
            int periodHolderCount = this.periodHolders.size();
            if (periodHolderCount > 0) {
                this.periodHolders.valueAt(0).updatePeriod(manifest, 0, this.enabledTrack);
                if (periodHolderCount > 1) {
                    int lastIndex = periodHolderCount - 1;
                    this.periodHolders.valueAt(lastIndex).updatePeriod(manifest, lastIndex, this.enabledTrack);
                }
            }
            for (int i = this.periodHolders.size(); i < manifest.getPeriodCount(); i++) {
                PeriodHolder holder = new PeriodHolder(this.nextPeriodHolderIndex, manifest, i, this.enabledTrack);
                this.periodHolders.put(this.nextPeriodHolderIndex, holder);
                this.nextPeriodHolderIndex++;
            }
            TimeRange newAvailableRange = getAvailableRange(getNowUnixTimeUs());
            if (this.availableRange == null || !this.availableRange.equals(newAvailableRange)) {
                this.availableRange = newAvailableRange;
                notifyAvailableRangeChanged(this.availableRange);
            }
            this.currentManifest = manifest;
        } catch (BehindLiveWindowException e) {
            this.fatalError = e;
        }
    }

    private TimeRange getAvailableRange(long nowUnixTimeUs) {
        PeriodHolder firstPeriod = this.periodHolders.valueAt(0);
        PeriodHolder lastPeriod = this.periodHolders.valueAt(this.periodHolders.size() - 1);
        if (!this.currentManifest.dynamic || lastPeriod.isIndexExplicit()) {
            return new TimeRange.StaticTimeRange(firstPeriod.getAvailableStartTimeUs(), lastPeriod.getAvailableEndTimeUs());
        }
        long minStartPositionUs = firstPeriod.getAvailableStartTimeUs();
        long maxEndPositionUs = lastPeriod.isIndexUnbounded() ? Long.MAX_VALUE : lastPeriod.getAvailableEndTimeUs();
        long elapsedRealtimeAtZeroUs = (this.systemClock.elapsedRealtime() * 1000) - (nowUnixTimeUs - (this.currentManifest.availabilityStartTime * 1000));
        long timeShiftBufferDepthUs = this.currentManifest.timeShiftBufferDepth == -1 ? -1L : this.currentManifest.timeShiftBufferDepth * 1000;
        return new TimeRange.DynamicTimeRange(minStartPositionUs, maxEndPositionUs, elapsedRealtimeAtZeroUs, timeShiftBufferDepthUs, this.systemClock);
    }

    private void notifyAvailableRangeChanged(final TimeRange seekRange) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.dash.DashChunkSource.1
                @Override // java.lang.Runnable
                public void run() {
                    DashChunkSource.this.eventListener.onAvailableRangeChanged(DashChunkSource.this.eventSourceId, seekRange);
                }
            });
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashChunkSource$ExposedTrack.class */
    protected static final class ExposedTrack {
        public final MediaFormat trackFormat;
        public final int adaptiveMaxWidth;
        public final int adaptiveMaxHeight;
        private final int adaptationSetIndex;
        private final Format fixedFormat;
        private final Format[] adaptiveFormats;

        public ExposedTrack(MediaFormat trackFormat, int adaptationSetIndex, Format fixedFormat) {
            this.trackFormat = trackFormat;
            this.adaptationSetIndex = adaptationSetIndex;
            this.fixedFormat = fixedFormat;
            this.adaptiveFormats = null;
            this.adaptiveMaxWidth = -1;
            this.adaptiveMaxHeight = -1;
        }

        public ExposedTrack(MediaFormat trackFormat, int adaptationSetIndex, Format[] adaptiveFormats, int maxWidth, int maxHeight) {
            this.trackFormat = trackFormat;
            this.adaptationSetIndex = adaptationSetIndex;
            this.adaptiveFormats = adaptiveFormats;
            this.adaptiveMaxWidth = maxWidth;
            this.adaptiveMaxHeight = maxHeight;
            this.fixedFormat = null;
        }

        public boolean isAdaptive() {
            return this.adaptiveFormats != null;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder.class */
    protected static final class RepresentationHolder {
        public final boolean mimeTypeIsRawText;
        public final ChunkExtractorWrapper extractorWrapper;
        public Representation representation;
        public DashSegmentIndex segmentIndex;
        public MediaFormat mediaFormat;
        private final long periodStartTimeUs;
        private long periodDurationUs;
        private int segmentNumShift;

        public RepresentationHolder(long periodStartTimeUs, long periodDurationUs, Representation representation) {
            ChunkExtractorWrapper chunkExtractorWrapper;
            this.periodStartTimeUs = periodStartTimeUs;
            this.periodDurationUs = periodDurationUs;
            this.representation = representation;
            String mimeType = representation.format.mimeType;
            this.mimeTypeIsRawText = DashChunkSource.mimeTypeIsRawText(mimeType);
            if (this.mimeTypeIsRawText) {
                chunkExtractorWrapper = null;
            } else {
                chunkExtractorWrapper = new ChunkExtractorWrapper(DashChunkSource.mimeTypeIsWebm(mimeType) ? new WebmExtractor() : new FragmentedMp4Extractor());
            }
            this.extractorWrapper = chunkExtractorWrapper;
            this.segmentIndex = representation.getIndex();
        }

        public void updateRepresentation(long newPeriodDurationUs, Representation newRepresentation) throws BehindLiveWindowException {
            DashSegmentIndex oldIndex = this.representation.getIndex();
            DashSegmentIndex newIndex = newRepresentation.getIndex();
            this.periodDurationUs = newPeriodDurationUs;
            this.representation = newRepresentation;
            if (oldIndex == null) {
                return;
            }
            this.segmentIndex = newIndex;
            if (!oldIndex.isExplicit()) {
                return;
            }
            int oldIndexLastSegmentNum = oldIndex.getLastSegmentNum(this.periodDurationUs);
            long oldIndexEndTimeUs = oldIndex.getTimeUs(oldIndexLastSegmentNum) + oldIndex.getDurationUs(oldIndexLastSegmentNum, this.periodDurationUs);
            int newIndexFirstSegmentNum = newIndex.getFirstSegmentNum();
            long newIndexStartTimeUs = newIndex.getTimeUs(newIndexFirstSegmentNum);
            if (oldIndexEndTimeUs == newIndexStartTimeUs) {
                this.segmentNumShift += (oldIndex.getLastSegmentNum(this.periodDurationUs) + 1) - newIndexFirstSegmentNum;
            } else {
                if (oldIndexEndTimeUs < newIndexStartTimeUs) {
                    throw new BehindLiveWindowException();
                }
                this.segmentNumShift += oldIndex.getSegmentNum(newIndexStartTimeUs, this.periodDurationUs) - newIndexFirstSegmentNum;
            }
        }

        public int getSegmentNum(long positionUs) {
            return this.segmentIndex.getSegmentNum(positionUs - this.periodStartTimeUs, this.periodDurationUs) + this.segmentNumShift;
        }

        public long getSegmentStartTimeUs(int segmentNum) {
            return this.segmentIndex.getTimeUs(segmentNum - this.segmentNumShift) + this.periodStartTimeUs;
        }

        public long getSegmentEndTimeUs(int segmentNum) {
            return getSegmentStartTimeUs(segmentNum) + this.segmentIndex.getDurationUs(segmentNum - this.segmentNumShift, this.periodDurationUs);
        }

        public int getLastSegmentNum() {
            return this.segmentIndex.getLastSegmentNum(this.periodDurationUs);
        }

        public boolean isBeyondLastSegment(int segmentNum) {
            int lastSegmentNum = getLastSegmentNum();
            return lastSegmentNum != -1 && segmentNum > lastSegmentNum + this.segmentNumShift;
        }

        public int getFirstAvailableSegmentNum() {
            return this.segmentIndex.getFirstSegmentNum() + this.segmentNumShift;
        }

        public RangedUri getSegmentUrl(int segmentNum) {
            return this.segmentIndex.getSegmentUrl(segmentNum - this.segmentNumShift);
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashChunkSource$PeriodHolder.class */
    protected static final class PeriodHolder {
        public final int localIndex;
        public final long startTimeUs;
        public final HashMap<String, RepresentationHolder> representationHolders;
        private final int[] representationIndices;
        private DrmInitData drmInitData;
        private boolean indexIsUnbounded;
        private boolean indexIsExplicit;
        private long availableStartTimeUs;
        private long availableEndTimeUs;

        public PeriodHolder(int localIndex, MediaPresentationDescription manifest, int manifestIndex, ExposedTrack selectedTrack) {
            this.localIndex = localIndex;
            Period period = manifest.getPeriod(manifestIndex);
            long periodDurationUs = getPeriodDurationUs(manifest, manifestIndex);
            AdaptationSet adaptationSet = period.adaptationSets.get(selectedTrack.adaptationSetIndex);
            List<Representation> representations = adaptationSet.representations;
            this.startTimeUs = period.startMs * 1000;
            this.drmInitData = getDrmInitData(adaptationSet);
            if (!selectedTrack.isAdaptive()) {
                this.representationIndices = new int[]{getRepresentationIndex(representations, selectedTrack.fixedFormat.id)};
            } else {
                this.representationIndices = new int[selectedTrack.adaptiveFormats.length];
                for (int j = 0; j < selectedTrack.adaptiveFormats.length; j++) {
                    this.representationIndices[j] = getRepresentationIndex(representations, selectedTrack.adaptiveFormats[j].id);
                }
            }
            this.representationHolders = new HashMap<>();
            for (int i = 0; i < this.representationIndices.length; i++) {
                Representation representation = representations.get(this.representationIndices[i]);
                RepresentationHolder representationHolder = new RepresentationHolder(this.startTimeUs, periodDurationUs, representation);
                this.representationHolders.put(representation.format.id, representationHolder);
            }
            updateRepresentationIndependentProperties(periodDurationUs, representations.get(this.representationIndices[0]));
        }

        public void updatePeriod(MediaPresentationDescription manifest, int manifestIndex, ExposedTrack selectedTrack) throws BehindLiveWindowException {
            Period period = manifest.getPeriod(manifestIndex);
            long periodDurationUs = getPeriodDurationUs(manifest, manifestIndex);
            List<Representation> representations = period.adaptationSets.get(selectedTrack.adaptationSetIndex).representations;
            for (int j = 0; j < this.representationIndices.length; j++) {
                Representation representation = representations.get(this.representationIndices[j]);
                this.representationHolders.get(representation.format.id).updateRepresentation(periodDurationUs, representation);
            }
            updateRepresentationIndependentProperties(periodDurationUs, representations.get(this.representationIndices[0]));
        }

        public long getAvailableStartTimeUs() {
            return this.availableStartTimeUs;
        }

        public long getAvailableEndTimeUs() {
            if (isIndexUnbounded()) {
                throw new IllegalStateException("Period has unbounded index");
            }
            return this.availableEndTimeUs;
        }

        public boolean isIndexUnbounded() {
            return this.indexIsUnbounded;
        }

        public boolean isIndexExplicit() {
            return this.indexIsExplicit;
        }

        public DrmInitData getDrmInitData() {
            return this.drmInitData;
        }

        private void updateRepresentationIndependentProperties(long periodDurationUs, Representation arbitaryRepresentation) {
            DashSegmentIndex segmentIndex = arbitaryRepresentation.getIndex();
            if (segmentIndex != null) {
                int firstSegmentNum = segmentIndex.getFirstSegmentNum();
                int lastSegmentNum = segmentIndex.getLastSegmentNum(periodDurationUs);
                this.indexIsUnbounded = lastSegmentNum == -1;
                this.indexIsExplicit = segmentIndex.isExplicit();
                this.availableStartTimeUs = this.startTimeUs + segmentIndex.getTimeUs(firstSegmentNum);
                if (!this.indexIsUnbounded) {
                    this.availableEndTimeUs = this.startTimeUs + segmentIndex.getTimeUs(lastSegmentNum) + segmentIndex.getDurationUs(lastSegmentNum, periodDurationUs);
                    return;
                }
                return;
            }
            this.indexIsUnbounded = false;
            this.indexIsExplicit = true;
            this.availableStartTimeUs = this.startTimeUs;
            this.availableEndTimeUs = this.startTimeUs + periodDurationUs;
        }

        private static int getRepresentationIndex(List<Representation> representations, String formatId) {
            for (int i = 0; i < representations.size(); i++) {
                Representation representation = representations.get(i);
                if (formatId.equals(representation.format.id)) {
                    return i;
                }
            }
            throw new IllegalStateException("Missing format id: " + formatId);
        }

        private static DrmInitData getDrmInitData(AdaptationSet adaptationSet) {
            if (adaptationSet.contentProtections.isEmpty()) {
                return null;
            }
            DrmInitData.Mapped drmInitData = null;
            for (int i = 0; i < adaptationSet.contentProtections.size(); i++) {
                ContentProtection contentProtection = adaptationSet.contentProtections.get(i);
                if (contentProtection.uuid != null && contentProtection.data != null) {
                    if (drmInitData == null) {
                        drmInitData = new DrmInitData.Mapped();
                    }
                    drmInitData.put(contentProtection.uuid, contentProtection.data);
                }
            }
            return drmInitData;
        }

        private static long getPeriodDurationUs(MediaPresentationDescription manifest, int index) {
            long durationMs = manifest.getPeriodDuration(index);
            if (durationMs == -1) {
                return -1L;
            }
            return durationMs * 1000;
        }
    }
}
