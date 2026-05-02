package com.google.android.exoplayer.metadata.id3;

import com.google.android.exoplayer.C;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.metadata.MetadataParser;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/metadata/id3/Id3Parser.class */
public final class Id3Parser implements MetadataParser<List<Id3Frame>> {
    private static final int ID3_TEXT_ENCODING_ISO_8859_1 = 0;
    private static final int ID3_TEXT_ENCODING_UTF_16 = 1;
    private static final int ID3_TEXT_ENCODING_UTF_16BE = 2;
    private static final int ID3_TEXT_ENCODING_UTF_8 = 3;

    @Override // com.google.android.exoplayer.metadata.MetadataParser
    public boolean canParse(String mimeType) {
        return mimeType.equals(MimeTypes.APPLICATION_ID3);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.exoplayer.metadata.MetadataParser
    public List<Id3Frame> parse(byte[] data, int size) throws UnsupportedEncodingException, ParserException {
        List<Id3Frame> id3Frames = new ArrayList<>();
        ParsableByteArray id3Data = new ParsableByteArray(data, size);
        int parseId3Header = parseId3Header(id3Data);
        while (true) {
            int id3Size = parseId3Header;
            if (id3Size <= 0) {
                break;
            }
            int frameId0 = id3Data.readUnsignedByte();
            int frameId1 = id3Data.readUnsignedByte();
            int frameId2 = id3Data.readUnsignedByte();
            int frameId3 = id3Data.readUnsignedByte();
            int frameSize = id3Data.readSynchSafeInt();
            if (frameSize <= 1) {
                break;
            }
            id3Data.skipBytes(2);
            if (frameId0 == 84 && frameId1 == 88 && frameId2 == 88 && frameId3 == 88) {
                int encoding = id3Data.readUnsignedByte();
                String charset = getCharsetName(encoding);
                byte[] frame = new byte[frameSize - 1];
                id3Data.readBytes(frame, 0, frameSize - 1);
                int firstZeroIndex = indexOfEOS(frame, 0, encoding);
                String description = new String(frame, 0, firstZeroIndex, charset);
                int valueStartIndex = firstZeroIndex + delimiterLength(encoding);
                int valueEndIndex = indexOfEOS(frame, valueStartIndex, encoding);
                String value = new String(frame, valueStartIndex, valueEndIndex - valueStartIndex, charset);
                id3Frames.add(new TxxxFrame(description, value));
            } else if (frameId0 == 80 && frameId1 == 82 && frameId2 == 73 && frameId3 == 86) {
                byte[] frame2 = new byte[frameSize];
                id3Data.readBytes(frame2, 0, frameSize);
                int firstZeroIndex2 = indexOf(frame2, 0, (byte) 0);
                String owner = new String(frame2, 0, firstZeroIndex2, "ISO-8859-1");
                byte[] privateData = new byte[(frameSize - firstZeroIndex2) - 1];
                System.arraycopy(frame2, firstZeroIndex2 + 1, privateData, 0, (frameSize - firstZeroIndex2) - 1);
                id3Frames.add(new PrivFrame(owner, privateData));
            } else if (frameId0 == 71 && frameId1 == 69 && frameId2 == 79 && frameId3 == 66) {
                int encoding2 = id3Data.readUnsignedByte();
                String charset2 = getCharsetName(encoding2);
                byte[] frame3 = new byte[frameSize - 1];
                id3Data.readBytes(frame3, 0, frameSize - 1);
                int firstZeroIndex3 = indexOf(frame3, 0, (byte) 0);
                String mimeType = new String(frame3, 0, firstZeroIndex3, "ISO-8859-1");
                int filenameStartIndex = firstZeroIndex3 + 1;
                int filenameEndIndex = indexOfEOS(frame3, filenameStartIndex, encoding2);
                String filename = new String(frame3, filenameStartIndex, filenameEndIndex - filenameStartIndex, charset2);
                int descriptionStartIndex = filenameEndIndex + delimiterLength(encoding2);
                int descriptionEndIndex = indexOfEOS(frame3, descriptionStartIndex, encoding2);
                String description2 = new String(frame3, descriptionStartIndex, descriptionEndIndex - descriptionStartIndex, charset2);
                int objectDataSize = ((frameSize - 1) - descriptionEndIndex) - delimiterLength(encoding2);
                byte[] objectData = new byte[objectDataSize];
                System.arraycopy(frame3, descriptionEndIndex + delimiterLength(encoding2), objectData, 0, objectDataSize);
                id3Frames.add(new GeobFrame(mimeType, filename, description2, objectData));
            } else {
                String type = String.format(Locale.US, "%c%c%c%c", Integer.valueOf(frameId0), Integer.valueOf(frameId1), Integer.valueOf(frameId2), Integer.valueOf(frameId3));
                byte[] frame4 = new byte[frameSize];
                id3Data.readBytes(frame4, 0, frameSize);
                id3Frames.add(new BinaryFrame(type, frame4));
            }
            parseId3Header = id3Size - (frameSize + 10);
        }
        return Collections.unmodifiableList(id3Frames);
    }

    private static int indexOf(byte[] data, int fromIndex, byte key) {
        for (int i = fromIndex; i < data.length; i++) {
            if (data[i] == key) {
                return i;
            }
        }
        return data.length;
    }

    private static int indexOfEOS(byte[] data, int fromIndex, int encodingByte) {
        int terminationPos = indexOf(data, fromIndex, (byte) 0);
        if (encodingByte == 0 || encodingByte == 3) {
            return terminationPos;
        }
        while (terminationPos < data.length - 1) {
            if (data[terminationPos + 1] == 0) {
                return terminationPos;
            }
            terminationPos = indexOf(data, terminationPos + 1, (byte) 0);
        }
        return data.length;
    }

    private static int delimiterLength(int encodingByte) {
        return (encodingByte == 0 || encodingByte == 3) ? 1 : 2;
    }

    private static int parseId3Header(ParsableByteArray id3Buffer) throws ParserException {
        int id1 = id3Buffer.readUnsignedByte();
        int id2 = id3Buffer.readUnsignedByte();
        int id3 = id3Buffer.readUnsignedByte();
        if (id1 != 73 || id2 != 68 || id3 != 51) {
            throw new ParserException(String.format(Locale.US, "Unexpected ID3 file identifier, expected \"ID3\", actual \"%c%c%c\".", Integer.valueOf(id1), Integer.valueOf(id2), Integer.valueOf(id3)));
        }
        id3Buffer.skipBytes(2);
        int flags = id3Buffer.readUnsignedByte();
        int id3Size = id3Buffer.readSynchSafeInt();
        if ((flags & 2) != 0) {
            int extendedHeaderSize = id3Buffer.readSynchSafeInt();
            if (extendedHeaderSize > 4) {
                id3Buffer.skipBytes(extendedHeaderSize - 4);
            }
            id3Size -= extendedHeaderSize;
        }
        if ((flags & 8) != 0) {
            id3Size -= 10;
        }
        return id3Size;
    }

    private static String getCharsetName(int encodingByte) {
        switch (encodingByte) {
            case 0:
                return "ISO-8859-1";
            case 1:
                return "UTF-16";
            case 2:
                return "UTF-16BE";
            case 3:
                return C.UTF8_NAME;
            default:
                return "ISO-8859-1";
        }
    }
}
