package com.google.android.exoplayer.text.eia608;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.exoplayer.ExoPlaybackException;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.SampleSourceTrackRenderer;
import com.google.android.exoplayer.text.Cue;
import com.google.android.exoplayer.text.TextRenderer;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.util.Collections;
import java.util.TreeSet;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/eia608/Eia608TrackRenderer.class */
public final class Eia608TrackRenderer extends SampleSourceTrackRenderer implements Handler.Callback {
    private static final int MSG_INVOKE_RENDERER = 0;
    private static final int CC_MODE_UNKNOWN = 0;
    private static final int CC_MODE_ROLL_UP = 1;
    private static final int CC_MODE_POP_ON = 2;
    private static final int CC_MODE_PAINT_ON = 3;
    private static final int DEFAULT_CAPTIONS_ROW_COUNT = 4;
    private static final int MAX_SAMPLE_READAHEAD_US = 5000000;
    private final Eia608Parser eia608Parser;
    private final TextRenderer textRenderer;
    private final Handler textRendererHandler;
    private final MediaFormatHolder formatHolder;
    private final SampleHolder sampleHolder;
    private final StringBuilder captionStringBuilder;
    private final TreeSet<ClosedCaptionList> pendingCaptionLists;
    private boolean inputStreamEnded;
    private int captionMode;
    private int captionRowCount;
    private String caption;
    private String lastRenderedCaption;
    private ClosedCaptionCtrl repeatableControl;

    public Eia608TrackRenderer(SampleSource source, TextRenderer textRenderer, Looper textRendererLooper) {
        super(source);
        this.textRenderer = (TextRenderer) Assertions.checkNotNull(textRenderer);
        this.textRendererHandler = textRendererLooper == null ? null : new Handler(textRendererLooper, this);
        this.eia608Parser = new Eia608Parser();
        this.formatHolder = new MediaFormatHolder();
        this.sampleHolder = new SampleHolder(1);
        this.captionStringBuilder = new StringBuilder();
        this.pendingCaptionLists = new TreeSet<>();
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer
    protected boolean handlesTrack(MediaFormat mediaFormat) {
        return this.eia608Parser.canParse(mediaFormat.mimeType);
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected void onEnabled(int track, long positionUs, boolean joining) throws ExoPlaybackException {
        super.onEnabled(track, positionUs, joining);
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer
    protected void onDiscontinuity(long positionUs) {
        this.inputStreamEnded = false;
        this.repeatableControl = null;
        this.pendingCaptionLists.clear();
        clearPendingSample();
        this.captionRowCount = 4;
        setCaptionMode(0);
        invokeRenderer(null);
    }

    @Override // com.google.android.exoplayer.SampleSourceTrackRenderer
    protected void doSomeWork(long positionUs, long elapsedRealtimeUs, boolean sourceIsReady) throws ExoPlaybackException {
        if (isSamplePending()) {
            maybeParsePendingSample(positionUs);
        }
        int result = this.inputStreamEnded ? -1 : -3;
        while (!isSamplePending() && result == -3) {
            result = readSource(positionUs, this.formatHolder, this.sampleHolder);
            if (result == -3) {
                maybeParsePendingSample(positionUs);
            } else if (result == -1) {
                this.inputStreamEnded = true;
            }
        }
        while (!this.pendingCaptionLists.isEmpty() && this.pendingCaptionLists.first().timeUs <= positionUs) {
            ClosedCaptionList nextCaptionList = this.pendingCaptionLists.pollFirst();
            consumeCaptionList(nextCaptionList);
            if (!nextCaptionList.decodeOnly) {
                invokeRenderer(this.caption);
            }
        }
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

    private void invokeRenderer(String text) {
        if (Util.areEqual(this.lastRenderedCaption, text)) {
            return;
        }
        this.lastRenderedCaption = text;
        if (this.textRendererHandler != null) {
            this.textRendererHandler.obtainMessage(0, text).sendToTarget();
        } else {
            invokeRendererInternal(text);
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message msg) {
        switch (msg.what) {
            case 0:
                invokeRendererInternal((String) msg.obj);
                return true;
            default:
                return false;
        }
    }

    private void invokeRendererInternal(String cueText) {
        if (cueText == null) {
            this.textRenderer.onCues(Collections.emptyList());
        } else {
            this.textRenderer.onCues(Collections.singletonList(new Cue(cueText)));
        }
    }

    private void maybeParsePendingSample(long positionUs) {
        if (this.sampleHolder.timeUs > positionUs + 5000000) {
            return;
        }
        ClosedCaptionList holder = this.eia608Parser.parse(this.sampleHolder);
        clearPendingSample();
        if (holder != null) {
            this.pendingCaptionLists.add(holder);
        }
    }

    private void consumeCaptionList(ClosedCaptionList captionList) {
        int captionBufferSize = captionList.captions.length;
        if (captionBufferSize == 0) {
            return;
        }
        boolean isRepeatableControl = false;
        for (int i = 0; i < captionBufferSize; i++) {
            ClosedCaption caption = captionList.captions[i];
            if (caption.type == 0) {
                ClosedCaptionCtrl captionCtrl = (ClosedCaptionCtrl) caption;
                isRepeatableControl = captionBufferSize == 1 && captionCtrl.isRepeatable();
                if (isRepeatableControl && this.repeatableControl != null && this.repeatableControl.cc1 == captionCtrl.cc1 && this.repeatableControl.cc2 == captionCtrl.cc2) {
                    this.repeatableControl = null;
                } else {
                    if (isRepeatableControl) {
                        this.repeatableControl = captionCtrl;
                    }
                    if (captionCtrl.isMiscCode()) {
                        handleMiscCode(captionCtrl);
                    } else if (captionCtrl.isPreambleAddressCode()) {
                        handlePreambleAddressCode();
                    }
                }
            } else {
                handleText((ClosedCaptionText) caption);
            }
        }
        if (!isRepeatableControl) {
            this.repeatableControl = null;
        }
        if (this.captionMode == 1 || this.captionMode == 3) {
            this.caption = getDisplayCaption();
        }
    }

    private void handleText(ClosedCaptionText captionText) {
        if (this.captionMode != 0) {
            this.captionStringBuilder.append(captionText.text);
        }
    }

    private void handleMiscCode(ClosedCaptionCtrl captionCtrl) {
        switch (captionCtrl.cc2) {
            case ClosedCaptionCtrl.RESUME_CAPTION_LOADING /* 32 */:
                setCaptionMode(2);
                break;
            case ClosedCaptionCtrl.BACKSPACE /* 33 */:
            case 34:
            case 35:
            case 36:
            case 40:
            default:
                if (this.captionMode != 0) {
                    switch (captionCtrl.cc2) {
                        case ClosedCaptionCtrl.BACKSPACE /* 33 */:
                            if (this.captionStringBuilder.length() > 0) {
                                this.captionStringBuilder.setLength(this.captionStringBuilder.length() - 1);
                                break;
                            }
                            break;
                        case ClosedCaptionCtrl.ERASE_DISPLAYED_MEMORY /* 44 */:
                            this.caption = null;
                            if (this.captionMode == 1 || this.captionMode == 3) {
                                this.captionStringBuilder.setLength(0);
                                break;
                            }
                            break;
                        case ClosedCaptionCtrl.CARRIAGE_RETURN /* 45 */:
                            maybeAppendNewline();
                            break;
                        case ClosedCaptionCtrl.ERASE_NON_DISPLAYED_MEMORY /* 46 */:
                            this.captionStringBuilder.setLength(0);
                            break;
                        case ClosedCaptionCtrl.END_OF_CAPTION /* 47 */:
                            this.caption = getDisplayCaption();
                            this.captionStringBuilder.setLength(0);
                            break;
                    }
                }
                break;
            case ClosedCaptionCtrl.ROLL_UP_CAPTIONS_2_ROWS /* 37 */:
                this.captionRowCount = 2;
                setCaptionMode(1);
                break;
            case ClosedCaptionCtrl.ROLL_UP_CAPTIONS_3_ROWS /* 38 */:
                this.captionRowCount = 3;
                setCaptionMode(1);
                break;
            case ClosedCaptionCtrl.ROLL_UP_CAPTIONS_4_ROWS /* 39 */:
                this.captionRowCount = 4;
                setCaptionMode(1);
                break;
            case ClosedCaptionCtrl.RESUME_DIRECT_CAPTIONING /* 41 */:
                setCaptionMode(3);
                break;
        }
    }

    private void handlePreambleAddressCode() {
        maybeAppendNewline();
    }

    private void setCaptionMode(int captionMode) {
        if (this.captionMode == captionMode) {
            return;
        }
        this.captionMode = captionMode;
        this.captionStringBuilder.setLength(0);
        if (captionMode == 1 || captionMode == 0) {
            this.caption = null;
        }
    }

    private void maybeAppendNewline() {
        int buildLength = this.captionStringBuilder.length();
        if (buildLength > 0 && this.captionStringBuilder.charAt(buildLength - 1) != '\n') {
            this.captionStringBuilder.append('\n');
        }
    }

    private String getDisplayCaption() {
        int buildLength = this.captionStringBuilder.length();
        if (buildLength == 0) {
            return null;
        }
        boolean endsWithNewline = this.captionStringBuilder.charAt(buildLength - 1) == '\n';
        if (buildLength == 1 && endsWithNewline) {
            return null;
        }
        int endIndex = endsWithNewline ? buildLength - 1 : buildLength;
        if (this.captionMode != 1) {
            return this.captionStringBuilder.substring(0, endIndex);
        }
        int startIndex = 0;
        int searchBackwardFromIndex = endIndex;
        for (int i = 0; i < this.captionRowCount && searchBackwardFromIndex != -1; i++) {
            searchBackwardFromIndex = this.captionStringBuilder.lastIndexOf("\n", searchBackwardFromIndex - 1);
        }
        if (searchBackwardFromIndex != -1) {
            startIndex = searchBackwardFromIndex + 1;
        }
        this.captionStringBuilder.delete(0, startIndex);
        return this.captionStringBuilder.substring(0, endIndex - startIndex);
    }

    private void clearPendingSample() {
        this.sampleHolder.timeUs = -1L;
        this.sampleHolder.clearData();
    }

    private boolean isSamplePending() {
        return this.sampleHolder.timeUs != -1;
    }
}
