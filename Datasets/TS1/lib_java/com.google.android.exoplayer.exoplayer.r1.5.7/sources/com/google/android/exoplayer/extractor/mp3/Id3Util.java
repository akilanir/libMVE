package com.google.android.exoplayer.extractor.mp3;

import android.util.Pair;
import com.google.android.exoplayer.C;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.GaplessInfo;
import com.google.android.exoplayer.extractor.ts.PsExtractor;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.nio.charset.Charset;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/mp3/Id3Util.class */
final class Id3Util {
    private static final int MAXIMUM_METADATA_SIZE = 3145728;
    private static final int ID3_TAG = Util.getIntegerCodeForString("ID3");
    private static final Charset[] CHARSET_BY_ENCODING = {Charset.forName("ISO-8859-1"), Charset.forName("UTF-16LE"), Charset.forName("UTF-16BE"), Charset.forName(C.UTF8_NAME)};

    public static GaplessInfo parseId3(ExtractorInput input) throws IOException, InterruptedException {
        ParsableByteArray scratch = new ParsableByteArray(10);
        int peekedId3Bytes = 0;
        GaplessInfo metadata = null;
        while (true) {
            input.peekFully(scratch.data, 0, 10);
            scratch.setPosition(0);
            if (scratch.readUnsignedInt24() == ID3_TAG) {
                int majorVersion = scratch.readUnsignedByte();
                int minorVersion = scratch.readUnsignedByte();
                int flags = scratch.readUnsignedByte();
                int length = scratch.readSynchSafeInt();
                if (metadata == null && canParseMetadata(majorVersion, minorVersion, flags, length)) {
                    byte[] frame = new byte[length];
                    input.peekFully(frame, 0, length);
                    metadata = parseGaplessInfo(new ParsableByteArray(frame), majorVersion, flags);
                } else {
                    input.advancePeekPosition(length);
                }
                peekedId3Bytes += 10 + length;
            } else {
                input.resetPeekPosition();
                input.advancePeekPosition(peekedId3Bytes);
                return metadata;
            }
        }
    }

    private static boolean canParseMetadata(int majorVersion, int minorVersion, int flags, int length) {
        return minorVersion != 255 && majorVersion >= 2 && majorVersion <= 4 && length <= MAXIMUM_METADATA_SIZE && (majorVersion != 2 || ((flags & 63) == 0 && (flags & 64) == 0)) && ((majorVersion != 3 || (flags & 31) == 0) && (majorVersion != 4 || (flags & 15) == 0));
    }

    private static GaplessInfo parseGaplessInfo(ParsableByteArray frame, int version, int flags) {
        int extendedHeaderSize;
        GaplessInfo gaplessInfo;
        int extendedHeaderSize2;
        unescape(frame, version, flags);
        frame.setPosition(0);
        if (version != 3 || (flags & 64) == 0) {
            if (version == 4 && (flags & 64) != 0) {
                if (frame.bytesLeft() < 4 || (extendedHeaderSize = frame.readSynchSafeInt()) < 6 || extendedHeaderSize > frame.bytesLeft() + 4) {
                    return null;
                }
                frame.setPosition(extendedHeaderSize);
            }
        } else {
            if (frame.bytesLeft() < 4 || (extendedHeaderSize2 = frame.readUnsignedIntToInt()) > frame.bytesLeft()) {
                return null;
            }
            if (extendedHeaderSize2 >= 6) {
                frame.skipBytes(2);
                int paddingSize = frame.readUnsignedIntToInt();
                frame.setPosition(4);
                frame.setLimit(frame.limit() - paddingSize);
                if (frame.bytesLeft() < extendedHeaderSize2) {
                    return null;
                }
            }
            frame.skipBytes(extendedHeaderSize2);
        }
        while (true) {
            Pair<String, String> comment = findNextComment(version, frame);
            if (comment != null) {
                if (((String) comment.first).length() > 3 && (gaplessInfo = GaplessInfo.createFromComment(((String) comment.first).substring(3), (String) comment.second)) != null) {
                    return gaplessInfo;
                }
            } else {
                return null;
            }
        }
    }

    private static Pair<String, String> findNextComment(int majorVersion, ParsableByteArray data) {
        int frameSize;
        while (true) {
            if (majorVersion == 2) {
                if (data.bytesLeft() < 6) {
                    return null;
                }
                String id = data.readString(3, Charset.forName("US-ASCII"));
                if (id.equals("������")) {
                    return null;
                }
                frameSize = data.readUnsignedInt24();
                if (frameSize == 0 || frameSize > data.bytesLeft()) {
                    return null;
                }
                if (id.equals("COM")) {
                    break;
                }
                data.skipBytes(frameSize);
            } else {
                if (data.bytesLeft() < 10) {
                    return null;
                }
                String id2 = data.readString(4, Charset.forName("US-ASCII"));
                if (id2.equals("��������")) {
                    return null;
                }
                frameSize = majorVersion == 4 ? data.readSynchSafeInt() : data.readUnsignedIntToInt();
                if (frameSize == 0 || frameSize > data.bytesLeft() - 2) {
                    return null;
                }
                int flags = data.readUnsignedShort();
                boolean compressedOrEncrypted = (majorVersion == 4 && (flags & 12) != 0) || (majorVersion == 3 && (flags & PsExtractor.AUDIO_STREAM) != 0);
                if (!compressedOrEncrypted && id2.equals("COMM")) {
                    break;
                }
                data.skipBytes(frameSize);
            }
        }
        int encoding = data.readUnsignedByte();
        if (encoding < 0 || encoding >= CHARSET_BY_ENCODING.length) {
            return null;
        }
        Charset charset = CHARSET_BY_ENCODING[encoding];
        String[] commentFields = data.readString(frameSize - 1, charset).split("��");
        if (commentFields.length == 2) {
            return Pair.create(commentFields[0], commentFields[1]);
        }
        return null;
    }

    private static boolean unescape(ParsableByteArray frame, int version, int flags) {
        if (version != 4) {
            if ((flags & 128) != 0) {
                byte[] bytes = frame.data;
                int newLength = bytes.length;
                for (int i = 0; i + 1 < newLength; i++) {
                    if ((bytes[i] & 255) == 255 && bytes[i + 1] == 0) {
                        System.arraycopy(bytes, i + 2, bytes, i + 1, (newLength - i) - 2);
                        newLength--;
                    }
                }
                frame.setLimit(newLength);
                return true;
            }
            return true;
        }
        if (canUnescapeVersion4(frame, false)) {
            unescapeVersion4(frame, false);
            return true;
        }
        if (canUnescapeVersion4(frame, true)) {
            unescapeVersion4(frame, true);
            return true;
        }
        return false;
    }

    private static boolean canUnescapeVersion4(ParsableByteArray frame, boolean unsignedIntDataSizeHack) {
        frame.setPosition(0);
        while (frame.bytesLeft() >= 10 && frame.readInt() != 0) {
            long dataSize = frame.readUnsignedInt();
            if (!unsignedIntDataSizeHack) {
                if ((dataSize & 8421504) != 0) {
                    return false;
                }
                dataSize = (dataSize & 127) | (((dataSize >> 8) & 127) << 7) | (((dataSize >> 16) & 127) << 14) | (((dataSize >> 24) & 127) << 21);
            }
            if (dataSize > frame.bytesLeft() - 2) {
                return false;
            }
            int flags = frame.readUnsignedShort();
            if ((flags & 1) != 0 && frame.bytesLeft() < 4) {
                return false;
            }
            frame.skipBytes((int) dataSize);
        }
        return true;
    }

    private static void unescapeVersion4(ParsableByteArray frame, boolean unsignedIntDataSizeHack) {
        frame.setPosition(0);
        byte[] bytes = frame.data;
        while (frame.bytesLeft() >= 10 && frame.readInt() != 0) {
            int dataSize = unsignedIntDataSizeHack ? frame.readUnsignedIntToInt() : frame.readSynchSafeInt();
            int flags = frame.readUnsignedShort();
            if ((flags & 1) != 0) {
                int offset = frame.getPosition();
                System.arraycopy(bytes, offset + 4, bytes, offset, frame.bytesLeft() - 4);
                dataSize -= 4;
                flags &= -2;
                frame.setLimit(frame.limit() - 4);
            }
            if ((flags & 2) != 0) {
                int readOffset = frame.getPosition() + 1;
                int writeOffset = readOffset;
                for (int i = 0; i + 1 < dataSize; i++) {
                    if ((bytes[readOffset - 1] & 255) == 255 && bytes[readOffset] == 0) {
                        readOffset++;
                        dataSize--;
                    }
                    int i2 = writeOffset;
                    writeOffset++;
                    int i3 = readOffset;
                    readOffset++;
                    bytes[i2] = bytes[i3];
                }
                frame.setLimit(frame.limit() - (readOffset - writeOffset));
                System.arraycopy(bytes, readOffset, bytes, writeOffset, frame.bytesLeft() - readOffset);
                flags &= -3;
            }
            if (flags != flags || unsignedIntDataSizeHack) {
                int dataSizeOffset = frame.getPosition() - 6;
                writeSyncSafeInteger(bytes, dataSizeOffset, dataSize);
                bytes[dataSizeOffset + 4] = (byte) (flags >> 8);
                bytes[dataSizeOffset + 5] = (byte) (flags & 255);
            }
            frame.skipBytes(dataSize);
        }
    }

    private static void writeSyncSafeInteger(byte[] bytes, int offset, int value) {
        bytes[offset] = (byte) ((value >> 21) & 127);
        bytes[offset + 1] = (byte) ((value >> 14) & 127);
        bytes[offset + 2] = (byte) ((value >> 7) & 127);
        bytes[offset + 3] = (byte) (value & 127);
    }

    private Id3Util() {
    }
}
