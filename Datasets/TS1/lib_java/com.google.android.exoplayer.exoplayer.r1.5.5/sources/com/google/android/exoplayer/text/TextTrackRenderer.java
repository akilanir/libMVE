package com.google.android.exoplayer.text;

import android.annotation.TargetApi;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.google.android.exoplayer.ExoPlaybackException;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.SampleSourceTrackRenderer;
import com.google.android.exoplayer.extractor.mp4.Atom;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@TargetApi(Atom.LONG_HEADER_SIZE)
/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/text/TextTrackRenderer.class */
public final class TextTrackRenderer extends SampleSourceTrackRenderer implements Handler.Callback {
    private static final int MSG_UPDATE_OVERLAY = 0;
    private static final List<Class<? extends SubtitleParser>> DEFAULT_PARSER_CLASSES = new ArrayList();
    private final Handler textRendererHandler;
    private final TextRenderer textRenderer;
    private final MediaFormatHolder formatHolder;
    private final SubtitleParser[] subtitleParsers;
    private int parserIndex;
    private boolean inputStreamEnded;
    private PlayableSubtitle subtitle;
    private PlayableSubtitle nextSubtitle;
    private SubtitleParserHelper parserHelper;
    private HandlerThread parserThread;
    private int nextSubtitleEventIndex;

    static {
        try {
            DEFAULT_PARSER_CLASSES.add(Class.forName("com.google.android.exoplayer.text.webvtt.WebvttParser").asSubclass(SubtitleParser.class));
        } catch (ClassNotFoundException e) {
        }
        try {
            DEFAULT_PARSER_CLASSES.add(Class.forName("com.google.android.exoplayer.text.ttml.TtmlParser").asSubclass(SubtitleParser.class));
        } catch (ClassNotFoundException e2) {
        }
        try {
            DEFAULT_PARSER_CLASSES.add(Class.forName("com.google.android.exoplayer.text.webvtt.Mp4WebvttParser").asSubclass(SubtitleParser.class));
        } catch (ClassNotFoundException e3) {
        }
        try {
            DEFAULT_PARSER_CLASSES.add(Class.forName("com.google.android.exoplayer.text.subrip.SubripParser").asSubclass(SubtitleParser.class));
        } catch (ClassNotFoundException e4) {
        }
        try {
            DEFAULT_PARSER_CLASSES.add(Class.forName("com.google.android.exoplayer.text.tx3g.Tx3gParser").asSubclass(SubtitleParser.class));
        } catch (ClassNotFoundException e5) {
        }
    }

    public TextTrackRenderer(SampleSource source, TextRenderer textRenderer, Looper textRendererLooper, SubtitleParser... subtitleParsers) {
        this(new SampleSource[]{source}, textRenderer, textRendererLooper, subtitleParsers);
    }

    public TextTrackRenderer(SampleSource[] sources, TextRenderer textRenderer, Looper textRendererLooper, SubtitleParser... subtitleParsers) {
        super(sources);
        this.textRenderer = (TextRenderer) Assertions.checkNotNull(textRenderer);
        this.textRendererHandler = textRendererLooper == null ? null : new Handler(textRendererLooper, this);
        if (subtitleParsers == null || subtitleParsers.length == 0) {
            subtitleParsers = new SubtitleParser[DEFAULT_PARSER_CLASSES.size()];
            for (int i = 0; i < subtitleParsers.length; i++) {
                try {
                    subtitleParsers[i] = DEFAULT_PARSER_CLASSES.get(i).newInstance();
                } catch (IllegalAccessException e) {
                    throw new IllegalStateException("Unexpected error creating default parser", e);
                } catch (InstantiationException e2) {
                    throw new IllegalStateException("Unexpected error creating default parser", e2);
                }
            }
        }
        this.subtitleParsers = subtitleParsers;
        this.formatHolder = new MediaFormatHolder();
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer
    protected boolean handlesTrack(MediaFormat mediaFormat) {
        return getParserIndex(mediaFormat) != -1;
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected void onEnabled(int track, long positionUs, boolean joining) throws ExoPlaybackException {
        super.onEnabled(track, positionUs, joining);
        this.parserIndex = getParserIndex(getFormat(track));
        this.parserThread = new HandlerThread("textParser");
        this.parserThread.start();
        this.parserHelper = new SubtitleParserHelper(this.parserThread.getLooper(), this.subtitleParsers[this.parserIndex]);
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer
    protected void onDiscontinuity(long positionUs) {
        this.inputStreamEnded = false;
        this.subtitle = null;
        this.nextSubtitle = null;
        clearTextRenderer();
        if (this.parserHelper != null) {
            this.parserHelper.flush();
        }
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer
    protected void doSomeWork(long positionUs, long elapsedRealtimeUs, boolean sourceIsReady) throws ExoPlaybackException {
        if (this.nextSubtitle == null) {
            try {
                this.nextSubtitle = this.parserHelper.getAndClearResult();
            } catch (IOException e) {
                throw new ExoPlaybackException(e);
            }
        }
        if (getState() != 3) {
            return;
        }
        boolean textRendererNeedsUpdate = false;
        if (this.subtitle != null) {
            long subtitleNextEventTimeUs = getNextEventTime();
            while (subtitleNextEventTimeUs <= positionUs) {
                this.nextSubtitleEventIndex++;
                subtitleNextEventTimeUs = getNextEventTime();
                textRendererNeedsUpdate = true;
            }
        }
        if (this.nextSubtitle != null && this.nextSubtitle.startTimeUs <= positionUs) {
            this.subtitle = this.nextSubtitle;
            this.nextSubtitle = null;
            this.nextSubtitleEventIndex = this.subtitle.getNextEventTimeIndex(positionUs);
            textRendererNeedsUpdate = true;
        }
        if (textRendererNeedsUpdate) {
            updateTextRenderer(this.subtitle.getCues(positionUs));
        }
        if (!this.inputStreamEnded && this.nextSubtitle == null && !this.parserHelper.isParsing()) {
            SampleHolder sampleHolder = this.parserHelper.getSampleHolder();
            sampleHolder.clearData();
            int result = readSource(positionUs, this.formatHolder, sampleHolder);
            if (result == -4) {
                this.parserHelper.setFormat(this.formatHolder.format);
            } else if (result == -3) {
                this.parserHelper.startParseOperation();
            } else if (result == -1) {
                this.inputStreamEnded = true;
            }
        }
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected void onDisabled() throws ExoPlaybackException {
        this.subtitle = null;
        this.nextSubtitle = null;
        this.parserThread.quit();
        this.parserThread = null;
        this.parserHelper = null;
        clearTextRenderer();
        super.onDisabled();
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected long getBufferedPositionUs() {
        return -3L;
    }

    @Override // com.google.android.exoplayer.TrackRenderer
    protected boolean isEnded() {
        return this.inputStreamEnded && (this.subtitle == null || getNextEventTime() == Long.MAX_VALUE);
    }

    @Override // com.google.android.exoplayer.TrackRenderer
    protected boolean isReady() {
        return true;
    }

    private long getNextEventTime() {
        if (this.nextSubtitleEventIndex == -1 || this.nextSubtitleEventIndex >= this.subtitle.getEventTimeCount()) {
            return Long.MAX_VALUE;
        }
        return this.subtitle.getEventTime(this.nextSubtitleEventIndex);
    }

    private void updateTextRenderer(List<Cue> cues) {
        if (this.textRendererHandler != null) {
            this.textRendererHandler.obtainMessage(0, cues).sendToTarget();
        } else {
            invokeRendererInternalCues(cues);
        }
    }

    private void clearTextRenderer() {
        updateTextRenderer(Collections.emptyList());
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message msg) {
        switch (msg.what) {
            case 0:
                invokeRendererInternalCues((List) msg.obj);
                return true;
            default:
                return false;
        }
    }

    private void invokeRendererInternalCues(List<Cue> cues) {
        this.textRenderer.onCues(cues);
    }

    private int getParserIndex(MediaFormat mediaFormat) {
        for (int i = 0; i < this.subtitleParsers.length; i++) {
            if (this.subtitleParsers[i].canParse(mediaFormat.mimeType)) {
                return i;
            }
        }
        return -1;
    }
}
