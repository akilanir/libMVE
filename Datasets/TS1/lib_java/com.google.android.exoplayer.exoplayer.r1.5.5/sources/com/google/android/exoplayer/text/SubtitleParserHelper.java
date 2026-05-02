package com.google.android.exoplayer.text;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/text/SubtitleParserHelper.class */
final class SubtitleParserHelper implements Handler.Callback {
    private static final int MSG_FORMAT = 0;
    private static final int MSG_SAMPLE = 1;
    private final SubtitleParser parser;
    private final Handler handler;
    private SampleHolder sampleHolder;
    private boolean parsing;
    private PlayableSubtitle result;
    private IOException error;
    private RuntimeException runtimeError;
    private boolean subtitlesAreRelative;
    private long subtitleOffsetUs;

    public SubtitleParserHelper(Looper looper, SubtitleParser parser) {
        this.handler = new Handler(looper, this);
        this.parser = parser;
        flush();
    }

    public synchronized void flush() {
        this.sampleHolder = new SampleHolder(1);
        this.parsing = false;
        this.result = null;
        this.error = null;
        this.runtimeError = null;
    }

    public synchronized boolean isParsing() {
        return this.parsing;
    }

    public synchronized SampleHolder getSampleHolder() {
        return this.sampleHolder;
    }

    public void setFormat(MediaFormat format) {
        this.handler.obtainMessage(0, format).sendToTarget();
    }

    public synchronized void startParseOperation() {
        Assertions.checkState(!this.parsing);
        this.parsing = true;
        this.result = null;
        this.error = null;
        this.runtimeError = null;
        this.handler.obtainMessage(1, Util.getTopInt(this.sampleHolder.timeUs), Util.getBottomInt(this.sampleHolder.timeUs), this.sampleHolder).sendToTarget();
    }

    public synchronized PlayableSubtitle getAndClearResult() throws IOException {
        try {
            if (this.error != null) {
                throw this.error;
            }
            if (this.runtimeError != null) {
                throw this.runtimeError;
            }
            PlayableSubtitle playableSubtitle = this.result;
            this.result = null;
            this.error = null;
            this.runtimeError = null;
            return playableSubtitle;
        } catch (Throwable th) {
            this.result = null;
            this.error = null;
            this.runtimeError = null;
            throw th;
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message msg) {
        switch (msg.what) {
            case 0:
                handleFormat((MediaFormat) msg.obj);
                break;
            case 1:
                long sampleTimeUs = Util.getLong(msg.arg1, msg.arg2);
                SampleHolder holder = (SampleHolder) msg.obj;
                handleSample(sampleTimeUs, holder);
                break;
        }
        return true;
    }

    private void handleFormat(MediaFormat format) {
        this.subtitlesAreRelative = format.subsampleOffsetUs == Long.MAX_VALUE;
        this.subtitleOffsetUs = this.subtitlesAreRelative ? 0L : format.subsampleOffsetUs;
    }

    private void handleSample(long sampleTimeUs, SampleHolder holder) {
        Subtitle parsedSubtitle = null;
        ParserException error = null;
        RuntimeException runtimeError = null;
        try {
            parsedSubtitle = this.parser.parse(holder.data.array(), 0, holder.size);
        } catch (ParserException e) {
            error = e;
        } catch (RuntimeException e2) {
            runtimeError = e2;
        }
        synchronized (this) {
            if (this.sampleHolder == holder) {
                this.result = new PlayableSubtitle(parsedSubtitle, this.subtitlesAreRelative, sampleTimeUs, this.subtitleOffsetUs);
                this.error = error;
                this.runtimeError = runtimeError;
                this.parsing = false;
            }
        }
    }
}
