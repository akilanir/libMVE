package com.google.android.exoplayer.util.extensions;

import com.google.android.exoplayer.C;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.extensions.InputBuffer;
import com.google.android.exoplayer.util.extensions.OutputBuffer;
import java.lang.Exception;
import java.util.LinkedList;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/extensions/SimpleDecoder.class */
public abstract class SimpleDecoder<I extends InputBuffer, O extends OutputBuffer, E extends Exception> extends Thread implements Decoder<I, O, E> {
    private final Object lock = new Object();
    private final LinkedList<I> queuedInputBuffers = new LinkedList<>();
    private final LinkedList<O> queuedOutputBuffers = new LinkedList<>();
    private final I[] availableInputBuffers;
    private final O[] availableOutputBuffers;
    private int availableInputBufferCount;
    private int availableOutputBufferCount;
    private I dequeuedInputBuffer;
    private E exception;
    private boolean flushDecodedOutputBuffer;
    private boolean released;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/extensions/SimpleDecoder$EventListener.class */
    public interface EventListener<E> {
        void onDecoderError(E e);
    }

    protected abstract I createInputBuffer();

    protected abstract O createOutputBuffer();

    protected abstract E decode(I i, O o);

    protected SimpleDecoder(I[] iArr, O[] oArr) {
        this.availableInputBuffers = iArr;
        this.availableInputBufferCount = iArr.length;
        for (int i = 0; i < this.availableInputBufferCount; i++) {
            ((I[]) this.availableInputBuffers)[i] = createInputBuffer();
        }
        this.availableOutputBuffers = oArr;
        this.availableOutputBufferCount = oArr.length;
        for (int i2 = 0; i2 < this.availableOutputBufferCount; i2++) {
            ((O[]) this.availableOutputBuffers)[i2] = createOutputBuffer();
        }
    }

    protected final void setInitialInputBufferSize(int size) {
        Assertions.checkState(this.availableInputBufferCount == this.availableInputBuffers.length);
        for (int i = 0; i < this.availableInputBuffers.length; i++) {
            this.availableInputBuffers[i].sampleHolder.ensureSpaceForWrite(size);
        }
    }

    @Override // com.google.android.exoplayer.util.extensions.Decoder
    public final I dequeueInputBuffer() throws Exception {
        synchronized (this.lock) {
            maybeThrowException();
            Assertions.checkState(this.dequeuedInputBuffer == null);
            if (this.availableInputBufferCount == 0) {
                return null;
            }
            I[] iArr = this.availableInputBuffers;
            int i = this.availableInputBufferCount - 1;
            this.availableInputBufferCount = i;
            I inputBuffer = iArr[i];
            inputBuffer.reset();
            this.dequeuedInputBuffer = inputBuffer;
            return inputBuffer;
        }
    }

    @Override // com.google.android.exoplayer.util.extensions.Decoder
    public final void queueInputBuffer(I inputBuffer) throws Exception {
        synchronized (this.lock) {
            maybeThrowException();
            Assertions.checkArgument(inputBuffer == this.dequeuedInputBuffer);
            this.queuedInputBuffers.addLast(inputBuffer);
            maybeNotifyDecodeLoop();
            this.dequeuedInputBuffer = null;
        }
    }

    @Override // com.google.android.exoplayer.util.extensions.Decoder
    public final O dequeueOutputBuffer() throws Exception {
        synchronized (this.lock) {
            maybeThrowException();
            if (this.queuedOutputBuffers.isEmpty()) {
                return null;
            }
            return this.queuedOutputBuffers.removeFirst();
        }
    }

    protected void releaseOutputBuffer(O outputBuffer) {
        synchronized (this.lock) {
            O[] oArr = this.availableOutputBuffers;
            int i = this.availableOutputBufferCount;
            this.availableOutputBufferCount = i + 1;
            oArr[i] = outputBuffer;
            maybeNotifyDecodeLoop();
        }
    }

    @Override // com.google.android.exoplayer.util.extensions.Decoder
    public final void flush() {
        synchronized (this.lock) {
            this.flushDecodedOutputBuffer = true;
            if (this.dequeuedInputBuffer != null) {
                I[] iArr = this.availableInputBuffers;
                int i = this.availableInputBufferCount;
                this.availableInputBufferCount = i + 1;
                iArr[i] = this.dequeuedInputBuffer;
                this.dequeuedInputBuffer = null;
            }
            while (!this.queuedInputBuffers.isEmpty()) {
                I[] iArr2 = this.availableInputBuffers;
                int i2 = this.availableInputBufferCount;
                this.availableInputBufferCount = i2 + 1;
                iArr2[i2] = this.queuedInputBuffers.removeFirst();
            }
            while (!this.queuedOutputBuffers.isEmpty()) {
                O[] oArr = this.availableOutputBuffers;
                int i3 = this.availableOutputBufferCount;
                this.availableOutputBufferCount = i3 + 1;
                oArr[i3] = this.queuedOutputBuffers.removeFirst();
            }
        }
    }

    @Override // com.google.android.exoplayer.util.extensions.Decoder
    public void release() {
        synchronized (this.lock) {
            this.released = true;
            this.lock.notify();
        }
        try {
            join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    private void maybeThrowException() throws Exception {
        if (this.exception != null) {
            throw this.exception;
        }
    }

    private void maybeNotifyDecodeLoop() {
        if (canDecodeBuffer()) {
            this.lock.notify();
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        do {
            try {
            } catch (InterruptedException e) {
                throw new IllegalStateException(e);
            }
        } while (decode());
    }

    private boolean decode() throws InterruptedException {
        synchronized (this.lock) {
            while (!this.released && !canDecodeBuffer()) {
                this.lock.wait();
            }
            if (this.released) {
                return false;
            }
            I removeFirst = this.queuedInputBuffers.removeFirst();
            O[] oArr = this.availableOutputBuffers;
            int i = this.availableOutputBufferCount - 1;
            this.availableOutputBufferCount = i;
            O o = oArr[i];
            this.flushDecodedOutputBuffer = false;
            o.reset();
            if (removeFirst.getFlag(1)) {
                o.setFlag(1);
            } else {
                if (removeFirst.getFlag(C.SAMPLE_FLAG_DECODE_ONLY)) {
                    o.setFlag(C.SAMPLE_FLAG_DECODE_ONLY);
                }
                this.exception = (E) decode(removeFirst, o);
                if (this.exception != null) {
                    synchronized (this.lock) {
                    }
                    return false;
                }
            }
            synchronized (this.lock) {
                if (this.flushDecodedOutputBuffer || o.getFlag(4)) {
                    O[] oArr2 = this.availableOutputBuffers;
                    int i2 = this.availableOutputBufferCount;
                    this.availableOutputBufferCount = i2 + 1;
                    oArr2[i2] = o;
                } else {
                    this.queuedOutputBuffers.addLast(o);
                }
                I[] iArr = this.availableInputBuffers;
                int i3 = this.availableInputBufferCount;
                this.availableInputBufferCount = i3 + 1;
                iArr[i3] = removeFirst;
            }
            return true;
        }
    }

    private boolean canDecodeBuffer() {
        return !this.queuedInputBuffers.isEmpty() && this.availableOutputBufferCount > 0;
    }
}
