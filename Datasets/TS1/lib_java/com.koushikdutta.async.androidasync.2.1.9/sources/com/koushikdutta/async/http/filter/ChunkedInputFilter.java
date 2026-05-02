package com.koushikdutta.async.http.filter;

import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.FilteredDataEmitter;
import com.koushikdutta.async.Util;
import com.koushikdutta.async.http.cache.ResponseCacheMiddleware;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/filter/ChunkedInputFilter.class */
public class ChunkedInputFilter extends FilteredDataEmitter {
    private int mChunkLength = 0;
    private int mChunkLengthRemaining = 0;
    private State mState = State.CHUNK_LEN;
    ByteBufferList pending = new ByteBufferList();
    static final /* synthetic */ boolean $assertionsDisabled;

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/filter/ChunkedInputFilter$State.class */
    private enum State {
        CHUNK_LEN,
        CHUNK_LEN_CR,
        CHUNK_LEN_CRLF,
        CHUNK,
        CHUNK_CR,
        CHUNK_CRLF,
        COMPLETE
    }

    static {
        $assertionsDisabled = !ChunkedInputFilter.class.desiredAssertionStatus();
    }

    private boolean checkByte(char b, char value) {
        if (b != value) {
            report(new ChunkedDataException(value + " was expected, got " + b));
            return false;
        }
        return true;
    }

    private boolean checkLF(char b) {
        return checkByte(b, '\n');
    }

    private boolean checkCR(char b) {
        return checkByte(b, '\r');
    }

    @Override // com.koushikdutta.async.DataEmitterBase
    protected void report(Exception e) {
        if (e == null && this.mState != State.COMPLETE) {
            e = new ChunkedDataException("chunked input ended before final chunk");
        }
        super.report(e);
    }

    /* renamed from: com.koushikdutta.async.http.filter.ChunkedInputFilter$1, reason: invalid class name */
    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/filter/ChunkedInputFilter$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$koushikdutta$async$http$filter$ChunkedInputFilter$State = new int[State.values().length];

        static {
            try {
                $SwitchMap$com$koushikdutta$async$http$filter$ChunkedInputFilter$State[State.CHUNK_LEN.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$koushikdutta$async$http$filter$ChunkedInputFilter$State[State.CHUNK_LEN_CR.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$koushikdutta$async$http$filter$ChunkedInputFilter$State[State.CHUNK.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$koushikdutta$async$http$filter$ChunkedInputFilter$State[State.CHUNK_CR.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$koushikdutta$async$http$filter$ChunkedInputFilter$State[State.CHUNK_CRLF.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$koushikdutta$async$http$filter$ChunkedInputFilter$State[State.COMPLETE.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
    }

    @Override // com.koushikdutta.async.FilteredDataEmitter, com.koushikdutta.async.callback.DataCallback
    public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
        while (bb.remaining() > 0) {
            try {
                switch (AnonymousClass1.$SwitchMap$com$koushikdutta$async$http$filter$ChunkedInputFilter$State[this.mState.ordinal()]) {
                    case ResponseCacheMiddleware.ENTRY_BODY /* 1 */:
                        char c = bb.getByteChar();
                        if (c == '\r') {
                            this.mState = State.CHUNK_LEN_CR;
                        } else {
                            this.mChunkLength *= 16;
                            if (c >= 'a' && c <= 'f') {
                                this.mChunkLength += (c - 'a') + 10;
                            } else if (c >= '0' && c <= '9') {
                                this.mChunkLength += c - '0';
                            } else if (c >= 'A' && c <= 'F') {
                                this.mChunkLength += (c - 'A') + 10;
                            } else {
                                report(new ChunkedDataException("invalid chunk length: " + c));
                                return;
                            }
                        }
                        this.mChunkLengthRemaining = this.mChunkLength;
                        break;
                    case ResponseCacheMiddleware.ENTRY_COUNT /* 2 */:
                        if (!checkLF(bb.getByteChar())) {
                            return;
                        }
                        this.mState = State.CHUNK;
                        break;
                    case 3:
                        int remaining = bb.remaining();
                        int reading = Math.min(this.mChunkLengthRemaining, remaining);
                        this.mChunkLengthRemaining -= reading;
                        if (this.mChunkLengthRemaining == 0) {
                            this.mState = State.CHUNK_CR;
                        }
                        if (reading != 0) {
                            bb.get(this.pending, reading);
                            Util.emitAllData(this, this.pending);
                            break;
                        } else {
                            break;
                        }
                    case 4:
                        if (!checkCR(bb.getByteChar())) {
                            return;
                        }
                        this.mState = State.CHUNK_CRLF;
                        break;
                    case 5:
                        if (!checkLF(bb.getByteChar())) {
                            return;
                        }
                        if (this.mChunkLength > 0) {
                            this.mState = State.CHUNK_LEN;
                        } else {
                            this.mState = State.COMPLETE;
                            report(null);
                        }
                        this.mChunkLength = 0;
                        break;
                    case 6:
                        if (!$assertionsDisabled) {
                            throw new AssertionError();
                        }
                        return;
                }
            } catch (Exception ex) {
                report(ex);
                return;
            }
        }
    }
}
