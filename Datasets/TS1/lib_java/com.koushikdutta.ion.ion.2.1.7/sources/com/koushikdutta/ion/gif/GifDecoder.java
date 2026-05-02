package com.koushikdutta.ion.gif;

import android.graphics.Bitmap;
import android.util.Log;
import com.koushikdutta.ion.BuildConfig;
import com.koushikdutta.ion.loader.MediaFile;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/gif/GifDecoder.class */
public class GifDecoder implements Cloneable {
    public static final int STATUS_PARSING = 0;
    public static final int STATUS_FORMAT_ERROR = 1;
    public static final int STATUS_OPEN_ERROR = 2;
    public static final int STATUS_FINISH = -1;
    private int status;
    public int width;
    public int height;
    private boolean gctFlag;
    private int gctSize;
    private int loopCount;
    private int[] gct;
    private int[] lct;
    private int[] act;
    private int bgIndex;
    private int bgColor;
    private int lastBgColor;
    private int pixelAspect;
    private boolean lctFlag;
    private boolean interlace;
    private int lctSize;
    private int ix;
    private int iy;
    private int iw;
    private int ih;
    private int lrx;
    private int lry;
    private int lrw;
    private int lrh;
    private byte[] block;
    private int blockSize;
    private int dispose;
    private int lastDispose;
    private boolean transparency;
    private int delay;
    private int transIndex;
    private static final int MaxStackSize = 4096;
    private short[] prefix;
    private byte[] suffix;
    private byte[] pixelStack;
    private byte[] pixels;
    private byte[] gifData;
    private int gifDataOffset;
    private int gifDataLength;
    private int readBytes;
    private int currentFrame;
    GifFrame lastFrame;
    GifFrame restoreFrame;
    int[] dest;

    public GifDecoder mutate() {
        try {
            GifDecoder ret = (GifDecoder) clone();
            this.block = new byte[256];
            this.prefix = null;
            this.suffix = null;
            this.pixelStack = null;
            this.pixels = null;
            this.dest = null;
            return ret;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public ByteBuffer getByteBuffer() {
        return ByteBuffer.wrap(this.gifData, this.gifDataOffset, this.gifDataLength);
    }

    public int getWidth() {
        return this.width;
    }

    public int getHeight() {
        return this.height;
    }

    public int getGifDataLength() {
        return this.gifDataLength;
    }

    public GifFrame getLastFrame() {
        return this.lastFrame;
    }

    public GifDecoder(ByteBuffer bb) {
        this(bb.array(), bb.arrayOffset() + bb.position(), bb.remaining());
    }

    public GifDecoder(byte[] data) {
        this(data, 0, data.length);
    }

    public GifDecoder(byte[] data, int offset, int length) {
        this.loopCount = 1;
        this.block = new byte[256];
        this.blockSize = 0;
        this.dispose = 0;
        this.lastDispose = 0;
        this.transparency = false;
        this.delay = 0;
        this.gifData = null;
        this.gifData = data;
        this.gifDataOffset = offset;
        this.gifDataLength = length;
        restart();
    }

    public void restart() {
        this.readBytes = 0;
        this.status = 0;
        this.gct = null;
        this.lct = null;
        readHeader();
    }

    public synchronized GifFrame nextFrame() {
        while (!err() && this.status == 0) {
            int code = read();
            switch (code) {
                case 0:
                    break;
                case MediaFile.FILE_TYPE_GIF /* 33 */:
                    int code2 = read();
                    switch (code2) {
                        case 249:
                            readGraphicControlExt();
                            break;
                        case 255:
                            readBlock();
                            String app = BuildConfig.FLAVOR;
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
                case MediaFile.FILE_TYPE_HTTPLIVE /* 44 */:
                    GifFrame readImage = readImage();
                    this.lastFrame = readImage;
                    return readImage;
                case 59:
                    this.status = -1;
                    return null;
                default:
                    this.status = 1;
                    break;
            }
        }
        this.status = 1;
        return null;
    }

    public int getStatus() {
        return this.status;
    }

    public boolean parseOk() {
        return this.status == -1;
    }

    public int getLoopCount() {
        return this.loopCount;
    }

    private Bitmap setPixels() {
        if (this.lastDispose == 2) {
            if (this.dest == null) {
                this.dest = new int[this.width * this.height];
            }
            int c = 0;
            if (!this.transparency) {
                c = this.lastBgColor;
            }
            Arrays.fill(this.dest, c);
        } else if (this.dest == null) {
            this.dest = new int[this.width * this.height];
            if (this.restoreFrame != null) {
                this.restoreFrame.image.getPixels(this.dest, 0, this.width, 0, 0, this.width, this.height);
            } else {
                Arrays.fill(this.dest, 0);
            }
        } else if (this.lastDispose == 3) {
            if (this.restoreFrame != null) {
                this.restoreFrame.image.getPixels(this.dest, 0, this.width, 0, 0, this.width, this.height);
            } else {
                Arrays.fill(this.dest, 0);
            }
        }
        int pass = 1;
        int inc = 8;
        int iline = 0;
        for (int i = 0; i < this.ih; i++) {
            int line = i;
            if (this.interlace) {
                if (iline >= this.ih) {
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
            int line2 = line + this.iy;
            if (line2 < this.height) {
                int k = line2 * this.width;
                int dx = k + this.ix;
                int dlim = dx + this.iw;
                if (k + this.width < dlim) {
                    dlim = k + this.width;
                }
                int sx = i * this.iw;
                while (dx < dlim) {
                    int i2 = sx;
                    sx++;
                    int index = this.pixels[i2] & 255;
                    if (!this.transparency || index != this.transIndex) {
                        this.dest[dx] = this.act[index];
                    }
                    dx++;
                }
            }
        }
        return Bitmap.createBitmap(this.dest, this.width, this.height, Bitmap.Config.ARGB_4444);
    }

    private void decodeImageData() {
        int npix = this.iw * this.ih;
        if (this.pixels == null || this.pixels.length < npix) {
            this.pixels = new byte[npix];
        }
        if (this.prefix == null) {
            this.prefix = new short[MaxStackSize];
        }
        if (this.suffix == null) {
            this.suffix = new byte[MaxStackSize];
        }
        if (this.pixelStack == null) {
            this.pixelStack = new byte[4097];
        }
        int data_size = read();
        int clear = 1 << data_size;
        int end_of_information = clear + 1;
        int available = clear + 2;
        int old_code = -1;
        int code_size = data_size + 1;
        int code_mask = (1 << code_size) - 1;
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
        while (i < npix) {
            if (top == 0) {
                if (bits < code_size) {
                    if (count == 0) {
                        count = readBlock();
                        if (count <= 0) {
                            break;
                        } else {
                            bi = 0;
                        }
                    }
                    datum += (this.block[bi] & 255) << bits;
                    bits += 8;
                    bi++;
                    count--;
                } else {
                    int code2 = datum & code_mask;
                    datum >>= code_size;
                    bits -= code_size;
                    if (code2 > available || code2 == end_of_information) {
                        break;
                    }
                    if (code2 != clear) {
                        if (old_code == -1) {
                            int i2 = top;
                            top++;
                            this.pixelStack[i2] = this.suffix[code2];
                            old_code = code2;
                            first = code2;
                        } else {
                            if (code2 == available) {
                                int i3 = top;
                                top++;
                                this.pixelStack[i3] = (byte) first;
                                code2 = old_code;
                            }
                            while (code2 > clear) {
                                int i4 = top;
                                top++;
                                this.pixelStack[i4] = this.suffix[code2];
                                code2 = this.prefix[code2];
                            }
                            first = this.suffix[code2] & 255;
                            if (available >= MaxStackSize) {
                                break;
                            }
                            int i5 = top;
                            top++;
                            this.pixelStack[i5] = (byte) first;
                            this.prefix[available] = (short) old_code;
                            this.suffix[available] = (byte) first;
                            available++;
                            if ((available & code_mask) == 0 && available < MaxStackSize) {
                                code_size++;
                                code_mask += available;
                            }
                            old_code = code2;
                        }
                    } else {
                        code_size = data_size + 1;
                        code_mask = (1 << code_size) - 1;
                        available = clear + 2;
                        old_code = -1;
                    }
                }
            }
            top--;
            int i6 = pi;
            pi++;
            this.pixels[i6] = this.pixelStack[top];
            i++;
        }
        for (int i7 = pi; i7 < npix; i7++) {
            this.pixels[i7] = 0;
        }
    }

    private boolean err() {
        return this.status != 0;
    }

    private int read() {
        if (this.readBytes >= this.gifDataLength) {
            return 0;
        }
        byte[] bArr = this.gifData;
        int i = this.gifDataOffset;
        int i2 = this.readBytes;
        this.readBytes = i2 + 1;
        return bArr[i + i2] & 255;
    }

    private int read(byte[] bytes, int offset, int length) throws IOException {
        if (this.readBytes >= this.gifDataLength) {
            return -1;
        }
        int toCopy = Math.min(this.gifDataLength - this.readBytes, length);
        System.arraycopy(this.gifData, this.gifDataOffset + this.readBytes, bytes, offset, toCopy);
        this.readBytes += toCopy;
        return toCopy;
    }

    private int read(byte[] bytes) throws IOException {
        return read(bytes, 0, bytes.length);
    }

    private int readBlock() {
        int count;
        this.blockSize = read();
        int n = 0;
        if (this.blockSize > 0) {
            while (n < this.blockSize && (count = read(this.block, n, this.blockSize - n)) != -1) {
                try {
                    n += count;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (n < this.blockSize) {
                this.status = 1;
            }
        }
        return n;
    }

    private int[] readColorTable(int ncolors) {
        int nbytes = 3 * ncolors;
        int[] tab = null;
        byte[] c = new byte[nbytes];
        int n = 0;
        try {
            n = read(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (n < nbytes) {
            this.status = 1;
        } else {
            tab = new int[256];
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
        }
        return tab;
    }

    private void readGraphicControlExt() {
        read();
        int packed = read();
        this.dispose = (packed & 28) >> 2;
        if (this.dispose == 0) {
            this.dispose = 1;
        }
        this.transparency = (packed & 1) != 0;
        this.delay = readShort() * 10;
        this.transIndex = read();
        read();
    }

    private void readHeader() {
        String id = BuildConfig.FLAVOR;
        for (int i = 0; i < 6; i++) {
            id = id + ((char) read());
        }
        if (!id.startsWith("GIF")) {
            this.status = 1;
            return;
        }
        readLSD();
        if (this.gctFlag && !err()) {
            this.gct = readColorTable(this.gctSize);
            this.bgColor = this.gct[this.bgIndex];
        }
    }

    private GifFrame readImage() {
        this.ix = readShort();
        this.iy = readShort();
        this.iw = readShort();
        this.ih = readShort();
        int packed = read();
        this.lctFlag = (packed & 128) != 0;
        this.interlace = (packed & 64) != 0;
        this.lctSize = 2 << (packed & 7);
        if (this.lctFlag) {
            this.lct = readColorTable(this.lctSize);
            this.act = this.lct;
        } else {
            this.act = this.gct;
            if (this.bgIndex == this.transIndex) {
                this.bgColor = 0;
            }
        }
        if (this.act == null) {
            this.status = 1;
        }
        if (err()) {
            return null;
        }
        decodeImageData();
        skip();
        if (err()) {
            return null;
        }
        this.currentFrame++;
        Bitmap image = setPixels();
        GifFrame gifFrame = new GifFrame(image, this.delay);
        resetFrame(gifFrame);
        return gifFrame;
    }

    private void readLSD() {
        this.width = readShort();
        this.height = readShort();
        int packed = read();
        this.gctFlag = (packed & 128) != 0;
        this.gctSize = 2 << (packed & 7);
        this.bgIndex = read();
        this.pixelAspect = read();
    }

    private void readNetscapeExt() {
        do {
            readBlock();
            if (this.block[0] == 1) {
                int b1 = this.block[1] & 255;
                int b2 = this.block[2] & 255;
                this.loopCount = (b2 << 8) | b1;
            }
            if (this.blockSize <= 0) {
                return;
            }
        } while (!err());
    }

    private int readShort() {
        return read() | (read() << 8);
    }

    private void resetFrame(GifFrame newFrame) {
        switch (this.dispose) {
            case 0:
                this.restoreFrame = newFrame;
                break;
            case 1:
                this.restoreFrame = newFrame;
                break;
            case 2:
                this.restoreFrame = null;
                break;
            case 3:
                break;
            default:
                Log.w("Ion", "Unknown gif dispose code: " + this.lastDispose);
                break;
        }
        this.lastDispose = this.dispose;
        this.lrx = this.ix;
        this.lry = this.iy;
        this.lrw = this.iw;
        this.lrh = this.ih;
        this.lastBgColor = this.bgColor;
        this.dispose = 0;
        this.transparency = false;
        this.delay = 0;
        this.lct = null;
    }

    private void skip() {
        do {
            readBlock();
            if (this.blockSize <= 0) {
                return;
            }
        } while (!err());
    }
}
