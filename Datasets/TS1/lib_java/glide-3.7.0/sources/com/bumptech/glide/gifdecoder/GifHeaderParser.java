package com.bumptech.glide.gifdecoder;

import android.util.Log;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/gifdecoder/GifHeaderParser.class */
public class GifHeaderParser {
    public static final String TAG = "GifHeaderParser";
    static final int MIN_FRAME_DELAY = 3;
    static final int DEFAULT_FRAME_DELAY = 10;
    private static final int MAX_BLOCK_SIZE = 256;
    private ByteBuffer rawData;
    private GifHeader header;
    private final byte[] block = new byte[MAX_BLOCK_SIZE];
    private int blockSize = 0;

    public GifHeaderParser setData(byte[] data) {
        reset();
        if (data != null) {
            this.rawData = ByteBuffer.wrap(data);
            this.rawData.rewind();
            this.rawData.order(ByteOrder.LITTLE_ENDIAN);
        } else {
            this.rawData = null;
            this.header.status = 2;
        }
        return this;
    }

    public void clear() {
        this.rawData = null;
        this.header = null;
    }

    private void reset() {
        this.rawData = null;
        Arrays.fill(this.block, (byte) 0);
        this.header = new GifHeader();
        this.blockSize = 0;
    }

    public GifHeader parseHeader() {
        if (this.rawData == null) {
            throw new IllegalStateException("You must call setData() before parseHeader()");
        }
        if (err()) {
            return this.header;
        }
        readHeader();
        if (!err()) {
            readContents();
            if (this.header.frameCount < 0) {
                this.header.status = 1;
            }
        }
        return this.header;
    }

    private void readContents() {
        boolean done = false;
        while (!done && !err()) {
            int code = read();
            switch (code) {
                case 0:
                default:
                    this.header.status = 1;
                    break;
                case 33:
                    int code2 = read();
                    switch (code2) {
                        case 1:
                            skip();
                            break;
                        case 249:
                            this.header.currentFrame = new GifFrame();
                            readGraphicControlExt();
                            break;
                        case 254:
                            skip();
                            break;
                        case 255:
                            readBlock();
                            String app = "";
                            for (int i = 0; i < 11; i++) {
                                app = app + ((char) this.block[i]);
                            }
                            if (app.equals("NETSCAPE2.0")) {
                                readNetscapeExt();
                                break;
                            } else {
                                skip();
                                break;
                            }
                        default:
                            skip();
                            break;
                    }
                case 44:
                    if (this.header.currentFrame == null) {
                        this.header.currentFrame = new GifFrame();
                    }
                    readBitmap();
                    break;
                case 59:
                    done = true;
                    break;
            }
        }
    }

    private void readGraphicControlExt() {
        read();
        int packed = read();
        this.header.currentFrame.dispose = (packed & 28) >> 2;
        if (this.header.currentFrame.dispose == 0) {
            this.header.currentFrame.dispose = 1;
        }
        this.header.currentFrame.transparency = (packed & 1) != 0;
        int delayInHundredthsOfASecond = readShort();
        if (delayInHundredthsOfASecond < 3) {
            delayInHundredthsOfASecond = DEFAULT_FRAME_DELAY;
        }
        this.header.currentFrame.delay = delayInHundredthsOfASecond * DEFAULT_FRAME_DELAY;
        this.header.currentFrame.transIndex = read();
        read();
    }

    private void readBitmap() {
        this.header.currentFrame.ix = readShort();
        this.header.currentFrame.iy = readShort();
        this.header.currentFrame.iw = readShort();
        this.header.currentFrame.ih = readShort();
        int packed = read();
        boolean lctFlag = (packed & 128) != 0;
        int lctSize = (int) Math.pow(2.0d, (packed & 7) + 1);
        this.header.currentFrame.interlace = (packed & 64) != 0;
        if (lctFlag) {
            this.header.currentFrame.lct = readColorTable(lctSize);
        } else {
            this.header.currentFrame.lct = null;
        }
        this.header.currentFrame.bufferFrameStart = this.rawData.position();
        skipImageData();
        if (err()) {
            return;
        }
        this.header.frameCount++;
        this.header.frames.add(this.header.currentFrame);
    }

    private void readNetscapeExt() {
        do {
            readBlock();
            if (this.block[0] == 1) {
                int b1 = this.block[1] & 255;
                int b2 = this.block[2] & 255;
                this.header.loopCount = (b2 << 8) | b1;
            }
            if (this.blockSize <= 0) {
                return;
            }
        } while (!err());
    }

    private void readHeader() {
        String id = "";
        for (int i = 0; i < 6; i++) {
            id = id + ((char) read());
        }
        if (!id.startsWith("GIF")) {
            this.header.status = 1;
            return;
        }
        readLSD();
        if (this.header.gctFlag && !err()) {
            this.header.gct = readColorTable(this.header.gctSize);
            this.header.bgColor = this.header.gct[this.header.bgIndex];
        }
    }

    private void readLSD() {
        this.header.width = readShort();
        this.header.height = readShort();
        int packed = read();
        this.header.gctFlag = (packed & 128) != 0;
        this.header.gctSize = 2 << (packed & 7);
        this.header.bgIndex = read();
        this.header.pixelAspect = read();
    }

    private int[] readColorTable(int ncolors) {
        int nbytes = 3 * ncolors;
        int[] tab = null;
        byte[] c = new byte[nbytes];
        try {
            this.rawData.get(c);
            tab = new int[MAX_BLOCK_SIZE];
            int i = 0;
            int j = 0;
            while (i < ncolors) {
                int i2 = j;
                int j2 = j + 1;
                int r = c[i2] & 255;
                int j3 = j2 + 1;
                int g = c[j2] & 255;
                j = j3 + 1;
                int b = c[j3] & 255;
                int i3 = i;
                i++;
                tab[i3] = (-16777216) | (r << 16) | (g << 8) | b;
            }
        } catch (BufferUnderflowException e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Format Error Reading Color Table", e);
            }
            this.header.status = 1;
        }
        return tab;
    }

    private void skipImageData() {
        read();
        skip();
    }

    private void skip() {
        int blockSize;
        do {
            blockSize = read();
            this.rawData.position(this.rawData.position() + blockSize);
        } while (blockSize > 0);
    }

    private int readBlock() {
        this.blockSize = read();
        int n = 0;
        if (this.blockSize > 0) {
            int count = 0;
            while (n < this.blockSize) {
                try {
                    count = this.blockSize - n;
                    this.rawData.get(this.block, n, count);
                    n += count;
                } catch (Exception e) {
                    if (Log.isLoggable(TAG, 3)) {
                        Log.d(TAG, "Error Reading Block n: " + n + " count: " + count + " blockSize: " + this.blockSize, e);
                    }
                    this.header.status = 1;
                }
            }
        }
        return n;
    }

    private int read() {
        int curByte = 0;
        try {
            curByte = this.rawData.get() & 255;
        } catch (Exception e) {
            this.header.status = 1;
        }
        return curByte;
    }

    private int readShort() {
        return this.rawData.getShort();
    }

    private boolean err() {
        return this.header.status != 0;
    }
}
