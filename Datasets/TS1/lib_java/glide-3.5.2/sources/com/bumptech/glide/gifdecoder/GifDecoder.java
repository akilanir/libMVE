package com.bumptech.glide.gifdecoder;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.os.Build;
import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Iterator;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/gifdecoder/GifDecoder.class */
public class GifDecoder {
    public static final int STATUS_OK = 0;
    public static final int STATUS_FORMAT_ERROR = 1;
    public static final int STATUS_OPEN_ERROR = 2;
    public static final int STATUS_PARTIAL_DECODE = 3;
    private static final int MAX_STACK_SIZE = 4096;
    private static final int DISPOSAL_UNSPECIFIED = 0;
    private static final int DISPOSAL_NONE = 1;
    private static final int DISPOSAL_BACKGROUND = 2;
    private static final int DISPOSAL_PREVIOUS = 3;
    private static final int NULL_CODE = -1;
    private static final int INITIAL_FRAME_POINTER = -1;
    private int[] act;
    private ByteBuffer rawData;
    private GifHeaderParser parser;
    private short[] prefix;
    private byte[] suffix;
    private byte[] pixelStack;
    private byte[] mainPixels;
    private int[] mainScratch;
    private int framePointer;
    private byte[] data;
    private BitmapProvider bitmapProvider;
    private Bitmap previousImage;
    private boolean savePrevious;
    private int status;
    private static final String TAG = GifDecoder.class.getSimpleName();
    private static final Bitmap.Config BITMAP_CONFIG = Bitmap.Config.ARGB_8888;
    private final byte[] block = new byte[256];
    private GifHeader header = new GifHeader();

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/gifdecoder/GifDecoder$BitmapProvider.class */
    public interface BitmapProvider {
        Bitmap obtain(int i, int i2, Bitmap.Config config);

        void release(Bitmap bitmap);
    }

    public GifDecoder(BitmapProvider provider) {
        this.bitmapProvider = provider;
    }

    public int getWidth() {
        return this.header.width;
    }

    public int getHeight() {
        return this.header.height;
    }

    public byte[] getData() {
        return this.data;
    }

    public int getStatus() {
        return this.status;
    }

    public void advance() {
        this.framePointer = (this.framePointer + 1) % this.header.frameCount;
    }

    public int getDelay(int n) {
        int delay = -1;
        if (n >= 0 && n < this.header.frameCount) {
            delay = this.header.frames.get(n).delay;
        }
        return delay;
    }

    public int getNextDelay() {
        if (this.header.frameCount <= 0 || this.framePointer < 0) {
            return -1;
        }
        return getDelay(this.framePointer);
    }

    public int getFrameCount() {
        return this.header.frameCount;
    }

    public int getCurrentFrameIndex() {
        return this.framePointer;
    }

    public void resetFrameIndex() {
        this.framePointer = -1;
    }

    public int getLoopCount() {
        return this.header.loopCount;
    }

    public synchronized Bitmap getNextFrame() {
        if (this.header.frameCount <= 0 || this.framePointer < 0) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "unable to decode frame, frameCount=" + this.header.frameCount + " framePointer=" + this.framePointer);
            }
            this.status = 1;
        }
        if (this.status == 1 || this.status == 2) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Unable to decode frame, status=" + this.status);
                return null;
            }
            return null;
        }
        this.status = 0;
        GifFrame currentFrame = this.header.frames.get(this.framePointer);
        GifFrame previousFrame = null;
        int previousIndex = this.framePointer - 1;
        if (previousIndex >= 0) {
            previousFrame = this.header.frames.get(previousIndex);
        }
        if (currentFrame.lct == null) {
            this.act = this.header.gct;
        } else {
            this.act = currentFrame.lct;
            if (this.header.bgIndex == currentFrame.transIndex) {
                this.header.bgColor = 0;
            }
        }
        int save = 0;
        if (currentFrame.transparency) {
            save = this.act[currentFrame.transIndex];
            this.act[currentFrame.transIndex] = 0;
        }
        if (this.act == null) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "No Valid Color Table");
            }
            this.status = 1;
            return null;
        }
        Bitmap result = setPixels(currentFrame, previousFrame);
        if (currentFrame.transparency) {
            this.act[currentFrame.transIndex] = save;
        }
        return result;
    }

    public int read(InputStream is, int contentLength) {
        int i;
        if (is != null) {
            if (contentLength > 0) {
                try {
                    i = contentLength + MAX_STACK_SIZE;
                } catch (IOException e) {
                    Log.w(TAG, "Error reading data from stream", e);
                }
            } else {
                i = 16384;
            }
            int capacity = i;
            ByteArrayOutputStream buffer = new ByteArrayOutputStream(capacity);
            byte[] data = new byte[16384];
            while (true) {
                int nRead = is.read(data, 0, data.length);
                if (nRead == -1) {
                    break;
                }
                buffer.write(data, 0, nRead);
            }
            buffer.flush();
            read(buffer.toByteArray());
        } else {
            this.status = 2;
        }
        if (is != null) {
            try {
                is.close();
            } catch (IOException e2) {
                Log.w(TAG, "Error closing stream", e2);
            }
        }
        return this.status;
    }

    public void clear() {
        this.header = null;
        this.data = null;
        this.mainPixels = null;
        this.mainScratch = null;
        if (this.previousImage != null) {
            this.bitmapProvider.release(this.previousImage);
        }
        this.previousImage = null;
    }

    public void setData(GifHeader header, byte[] data) {
        this.header = header;
        this.data = data;
        this.status = 0;
        this.framePointer = -1;
        this.rawData = ByteBuffer.wrap(data);
        this.rawData.rewind();
        this.rawData.order(ByteOrder.LITTLE_ENDIAN);
        this.savePrevious = false;
        Iterator i$ = header.frames.iterator();
        while (true) {
            if (!i$.hasNext()) {
                break;
            }
            GifFrame frame = i$.next();
            if (frame.dispose == 3) {
                this.savePrevious = true;
                break;
            }
        }
        this.mainPixels = new byte[header.width * header.height];
        this.mainScratch = new int[header.width * header.height];
    }

    private GifHeaderParser getHeaderParser() {
        if (this.parser == null) {
            this.parser = new GifHeaderParser();
        }
        return this.parser;
    }

    public int read(byte[] data) {
        this.data = data;
        this.header = getHeaderParser().setData(data).parseHeader();
        if (data != null) {
            this.rawData = ByteBuffer.wrap(data);
            this.rawData.rewind();
            this.rawData.order(ByteOrder.LITTLE_ENDIAN);
            this.mainPixels = new byte[this.header.width * this.header.height];
            this.mainScratch = new int[this.header.width * this.header.height];
            this.savePrevious = false;
            Iterator i$ = this.header.frames.iterator();
            while (true) {
                if (!i$.hasNext()) {
                    break;
                }
                GifFrame frame = i$.next();
                if (frame.dispose == 3) {
                    this.savePrevious = true;
                    break;
                }
            }
        }
        return this.status;
    }

    private Bitmap setPixels(GifFrame currentFrame, GifFrame previousFrame) {
        int width = this.header.width;
        int height = this.header.height;
        int[] dest = this.mainScratch;
        if (previousFrame != null && previousFrame.dispose > 0) {
            if (previousFrame.dispose == 2) {
                int c = 0;
                if (!currentFrame.transparency) {
                    c = this.header.bgColor;
                }
                Arrays.fill(dest, c);
            } else if (previousFrame.dispose == 3 && this.previousImage != null) {
                this.previousImage.getPixels(dest, 0, width, 0, 0, width, height);
            }
        }
        decodeBitmapData(currentFrame);
        int pass = 1;
        int inc = 8;
        int iline = 0;
        for (int i = 0; i < currentFrame.ih; i++) {
            int line = i;
            if (currentFrame.interlace) {
                if (iline >= currentFrame.ih) {
                    pass++;
                    switch (pass) {
                        case 2:
                            iline = 4;
                            break;
                        case 3:
                            iline = 2;
                            inc = 4;
                            break;
                        case 4:
                            iline = 1;
                            inc = 2;
                            break;
                    }
                }
                line = iline;
                iline += inc;
            }
            int line2 = line + currentFrame.iy;
            if (line2 < this.header.height) {
                int k = line2 * this.header.width;
                int dx = k + currentFrame.ix;
                int dlim = dx + currentFrame.iw;
                if (k + this.header.width < dlim) {
                    dlim = k + this.header.width;
                }
                int sx = i * currentFrame.iw;
                while (dx < dlim) {
                    int i2 = sx;
                    sx++;
                    int index = this.mainPixels[i2] & 255;
                    int c2 = this.act[index];
                    if (c2 != 0) {
                        dest[dx] = c2;
                    }
                    dx++;
                }
            }
        }
        if (this.savePrevious && (currentFrame.dispose == 0 || currentFrame.dispose == 1)) {
            if (this.previousImage == null) {
                this.previousImage = getNextBitmap();
            }
            this.previousImage.setPixels(dest, 0, width, 0, 0, width, height);
        }
        Bitmap result = getNextBitmap();
        result.setPixels(dest, 0, width, 0, 0, width, height);
        return result;
    }

    private void decodeBitmapData(GifFrame frame) {
        if (frame != null) {
            this.rawData.position(frame.bufferFrameStart);
        }
        int npix = frame == null ? this.header.width * this.header.height : frame.iw * frame.ih;
        if (this.mainPixels == null || this.mainPixels.length < npix) {
            this.mainPixels = new byte[npix];
        }
        if (this.prefix == null) {
            this.prefix = new short[MAX_STACK_SIZE];
        }
        if (this.suffix == null) {
            this.suffix = new byte[MAX_STACK_SIZE];
        }
        if (this.pixelStack == null) {
            this.pixelStack = new byte[4097];
        }
        int dataSize = read();
        int clear = 1 << dataSize;
        int endOfInformation = clear + 1;
        int available = clear + 2;
        int oldCode = -1;
        int codeSize = dataSize + 1;
        int codeMask = (1 << codeSize) - 1;
        for (int code = 0; code < clear; code++) {
            this.prefix[code] = 0;
            this.suffix[code] = (byte) code;
        }
        int bi = 0;
        int pi = 0;
        int top = 0;
        int first = 0;
        int count = 0;
        int bits = 0;
        int datum = 0;
        int i = 0;
        while (true) {
            if (i >= npix) {
                break;
            }
            if (count == 0) {
                count = readBlock();
                if (count <= 0) {
                    this.status = 3;
                    break;
                }
                bi = 0;
            }
            datum += (this.block[bi] & 255) << bits;
            bits += 8;
            bi++;
            count--;
            while (true) {
                if (bits >= codeSize) {
                    int code2 = datum & codeMask;
                    datum >>= codeSize;
                    bits -= codeSize;
                    if (code2 == clear) {
                        codeSize = dataSize + 1;
                        codeMask = (1 << codeSize) - 1;
                        available = clear + 2;
                        oldCode = -1;
                    } else {
                        if (code2 > available) {
                            this.status = 3;
                            break;
                        }
                        if (code2 == endOfInformation) {
                            break;
                        }
                        if (oldCode == -1) {
                            int i2 = top;
                            top++;
                            this.pixelStack[i2] = this.suffix[code2];
                            oldCode = code2;
                            first = code2;
                        } else {
                            if (code2 >= available) {
                                int i3 = top;
                                top++;
                                this.pixelStack[i3] = (byte) first;
                                code2 = oldCode;
                            }
                            while (code2 >= clear) {
                                int i4 = top;
                                top++;
                                this.pixelStack[i4] = this.suffix[code2];
                                code2 = this.prefix[code2];
                            }
                            first = this.suffix[code2] & 255;
                            int i5 = top;
                            top++;
                            this.pixelStack[i5] = (byte) first;
                            if (available < MAX_STACK_SIZE) {
                                this.prefix[available] = (short) oldCode;
                                this.suffix[available] = (byte) first;
                                available++;
                                if ((available & codeMask) == 0 && available < MAX_STACK_SIZE) {
                                    codeSize++;
                                    codeMask += available;
                                }
                            }
                            oldCode = code2;
                            while (top > 0) {
                                top--;
                                int i6 = pi;
                                pi++;
                                this.mainPixels[i6] = this.pixelStack[top];
                                i++;
                            }
                        }
                    }
                }
            }
        }
        for (int i7 = pi; i7 < npix; i7++) {
            this.mainPixels[i7] = 0;
        }
    }

    private int read() {
        int curByte = 0;
        try {
            curByte = this.rawData.get() & 255;
        } catch (Exception e) {
            this.status = 1;
        }
        return curByte;
    }

    private int readBlock() {
        int blockSize = read();
        int n = 0;
        if (blockSize > 0) {
            while (n < blockSize) {
                try {
                    int count = blockSize - n;
                    this.rawData.get(this.block, n, count);
                    n += count;
                } catch (Exception e) {
                    Log.w(TAG, "Error Reading Block", e);
                    this.status = 1;
                }
            }
        }
        return n;
    }

    private Bitmap getNextBitmap() {
        Bitmap result = this.bitmapProvider.obtain(this.header.width, this.header.height, BITMAP_CONFIG);
        if (result == null) {
            result = Bitmap.createBitmap(this.header.width, this.header.height, BITMAP_CONFIG);
        }
        setAlpha(result);
        return result;
    }

    @TargetApi(12)
    private static void setAlpha(Bitmap bitmap) {
        if (Build.VERSION.SDK_INT >= 12) {
            bitmap.setHasAlpha(true);
        }
    }
}
