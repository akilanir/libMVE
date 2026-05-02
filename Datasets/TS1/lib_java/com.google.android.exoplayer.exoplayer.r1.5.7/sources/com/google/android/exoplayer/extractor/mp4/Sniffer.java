package com.google.android.exoplayer.extractor.mp4;

import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.util.MpegAudioHeader;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/mp4/Sniffer.class */
final class Sniffer {
    private static final int[] COMPATIBLE_BRANDS = {Util.getIntegerCodeForString("isom"), Util.getIntegerCodeForString("iso2"), Util.getIntegerCodeForString("avc1"), Util.getIntegerCodeForString("hvc1"), Util.getIntegerCodeForString("hev1"), Util.getIntegerCodeForString("mp41"), Util.getIntegerCodeForString("mp42"), Util.getIntegerCodeForString("3g2a"), Util.getIntegerCodeForString("3g2b"), Util.getIntegerCodeForString("3gr6"), Util.getIntegerCodeForString("3gs6"), Util.getIntegerCodeForString("3ge6"), Util.getIntegerCodeForString("3gg6"), Util.getIntegerCodeForString("M4V "), Util.getIntegerCodeForString("M4A "), Util.getIntegerCodeForString("f4v "), Util.getIntegerCodeForString("kddi"), Util.getIntegerCodeForString("M4VP"), Util.getIntegerCodeForString("qt  "), Util.getIntegerCodeForString("MSNV")};

    public static boolean sniffFragmented(ExtractorInput input) throws IOException, InterruptedException {
        return sniffInternal(input, MpegAudioHeader.MAX_FRAME_SIZE_BYTES, true);
    }

    public static boolean sniffUnfragmented(ExtractorInput input) throws IOException, InterruptedException {
        return sniffInternal(input, 128, false);
    }

    private static boolean sniffInternal(ExtractorInput input, int searchLength, boolean fragmented) throws IOException, InterruptedException {
        long inputLength = input.getLength();
        int bytesToSearch = (int) ((inputLength == -1 || inputLength > ((long) searchLength)) ? searchLength : inputLength);
        ParsableByteArray buffer = new ParsableByteArray(64);
        int bytesSearched = 0;
        boolean foundGoodFileType = false;
        boolean foundFragment = false;
        while (true) {
            if (bytesSearched >= bytesToSearch) {
                break;
            }
            int headerSize = 8;
            input.peekFully(buffer.data, 0, 8);
            buffer.setPosition(0);
            long atomSize = buffer.readUnsignedInt();
            int atomType = buffer.readInt();
            if (atomSize == 1) {
                input.peekFully(buffer.data, 8, 16 - 8);
                headerSize = 16;
                atomSize = buffer.readLong();
            }
            if (atomSize < headerSize) {
                return false;
            }
            int atomDataSize = ((int) atomSize) - headerSize;
            if (atomType == Atom.TYPE_ftyp) {
                if (atomDataSize < 8) {
                    return false;
                }
                int compatibleBrandsCount = (atomDataSize - 8) / 4;
                input.peekFully(buffer.data, 0, 4 * (compatibleBrandsCount + 2));
                int i = 0;
                while (true) {
                    if (i >= compatibleBrandsCount + 2) {
                        break;
                    }
                    if (i == 1 || !isCompatibleBrand(buffer.readInt())) {
                        i++;
                    } else {
                        foundGoodFileType = true;
                        break;
                    }
                }
                if (!foundGoodFileType) {
                    return false;
                }
            } else {
                if (atomType == Atom.TYPE_moof) {
                    foundFragment = true;
                    break;
                }
                if (atomDataSize == 0) {
                    continue;
                } else {
                    if (bytesSearched + atomSize >= bytesToSearch) {
                        break;
                    }
                    input.advancePeekPosition(atomDataSize);
                }
            }
            bytesSearched = (int) (bytesSearched + atomSize);
        }
        return foundGoodFileType && fragmented == foundFragment;
    }

    private static boolean isCompatibleBrand(int brand) {
        if ((brand >>> 8) == Util.getIntegerCodeForString("3gp")) {
            return true;
        }
        int[] arr$ = COMPATIBLE_BRANDS;
        for (int compatibleBrand : arr$) {
            if (compatibleBrand == brand) {
                return true;
            }
        }
        return false;
    }

    private Sniffer() {
    }
}
