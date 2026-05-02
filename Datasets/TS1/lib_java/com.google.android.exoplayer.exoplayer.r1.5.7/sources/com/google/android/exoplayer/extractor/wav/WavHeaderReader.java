package com.google.android.exoplayer.extractor.wav;

import android.util.Log;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/wav/WavHeaderReader.class */
final class WavHeaderReader {
    private static final String TAG = "WavHeaderReader";
    private static final int TYPE_PCM = 1;
    private static final int TYPE_WAVE_FORMAT_EXTENSIBLE = 65534;

    WavHeaderReader() {
    }

    public static WavHeader peek(ExtractorInput input) throws IOException, InterruptedException, ParserException {
        Assertions.checkNotNull(input);
        ParsableByteArray scratch = new ParsableByteArray(16);
        ChunkHeader riffChunkHeader = ChunkHeader.peek(input, scratch);
        if (riffChunkHeader.id != Util.getIntegerCodeForString("RIFF")) {
            return null;
        }
        input.peekFully(scratch.data, 0, 4);
        scratch.setPosition(0);
        int riffFormat = scratch.readInt();
        if (riffFormat != Util.getIntegerCodeForString("WAVE")) {
            Log.e(TAG, "Unsupported RIFF format: " + riffFormat);
            return null;
        }
        ChunkHeader formatChunkHeader = ChunkHeader.peek(input, scratch);
        if (formatChunkHeader.id != Util.getIntegerCodeForString("fmt ")) {
            throw new ParserException("Second chunk in RIFF WAV should be format; got: " + formatChunkHeader.id);
        }
        Assertions.checkState(formatChunkHeader.size >= 16);
        input.peekFully(scratch.data, 0, 16);
        scratch.setPosition(0);
        int type = scratch.readLittleEndianUnsignedShort();
        int numChannels = scratch.readLittleEndianUnsignedShort();
        int sampleRateHz = scratch.readLittleEndianUnsignedIntToInt();
        int averageBytesPerSecond = scratch.readLittleEndianUnsignedIntToInt();
        int blockAlignment = scratch.readLittleEndianUnsignedShort();
        int bitsPerSample = scratch.readLittleEndianUnsignedShort();
        int expectedBlockAlignment = (numChannels * bitsPerSample) / 8;
        if (blockAlignment != expectedBlockAlignment) {
            throw new ParserException("Expected WAV block alignment of: " + expectedBlockAlignment + "; got: " + blockAlignment);
        }
        if (bitsPerSample != 16) {
            Log.e(TAG, "Only 16-bit WAVs are supported; got: " + bitsPerSample);
            return null;
        }
        if (type != 1 && type != TYPE_WAVE_FORMAT_EXTENSIBLE) {
            Log.e(TAG, "Unsupported WAV format type: " + type);
            return null;
        }
        input.advancePeekPosition(((int) formatChunkHeader.size) - 16);
        return new WavHeader(numChannels, sampleRateHz, averageBytesPerSecond, blockAlignment, bitsPerSample);
    }

    public static void skipToData(ExtractorInput input, WavHeader wavHeader) throws IOException, InterruptedException, ParserException {
        Assertions.checkNotNull(input);
        Assertions.checkNotNull(wavHeader);
        ParsableByteArray scratch = new ParsableByteArray(8);
        ChunkHeader peek = ChunkHeader.peek(input, scratch);
        while (true) {
            ChunkHeader chunkHeader = peek;
            if (chunkHeader.id != Util.getIntegerCodeForString("data")) {
                Log.w(TAG, "Ignoring unknown WAV chunk: " + chunkHeader.id);
                long bytesToSkip = 8 + chunkHeader.size;
                if (chunkHeader.id == Util.getIntegerCodeForString("RIFF")) {
                    bytesToSkip = 12;
                }
                if (bytesToSkip > 2147483647L) {
                    throw new ParserException("Chunk is too large (~2GB+) to skip; id: " + chunkHeader.id);
                }
                input.skipFully((int) bytesToSkip);
                peek = ChunkHeader.peek(input, scratch);
            } else {
                input.skipFully(8);
                wavHeader.setDataBounds(input.getPosition(), chunkHeader.size);
                return;
            }
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader.class */
    private static final class ChunkHeader {
        public static final int SIZE_IN_BYTES = 8;
        public final int id;
        public final long size;

        private ChunkHeader(int id, long size) {
            this.id = id;
            this.size = size;
        }

        public static ChunkHeader peek(ExtractorInput input, ParsableByteArray scratch) throws IOException, InterruptedException {
            input.peekFully(scratch.data, 0, 8);
            scratch.setPosition(0);
            int id = scratch.readInt();
            long size = scratch.readLittleEndianUnsignedInt();
            return new ChunkHeader(id, size);
        }
    }
}
