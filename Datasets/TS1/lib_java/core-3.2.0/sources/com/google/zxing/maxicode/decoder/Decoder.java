package com.google.zxing.maxicode.decoder;

import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonDecoder;
import com.google.zxing.common.reedsolomon.ReedSolomonException;
import com.google.zxing.pdf417.PDF417Common;
import java.util.Map;

/* loaded from: core-3.2.0.jar:com/google/zxing/maxicode/decoder/Decoder.class */
public final class Decoder {
    private static final int ALL = 0;
    private static final int EVEN = 1;
    private static final int ODD = 2;
    private final ReedSolomonDecoder rsDecoder = new ReedSolomonDecoder(GenericGF.MAXICODE_FIELD_64);

    public DecoderResult decode(BitMatrix bits) throws ChecksumException, FormatException {
        return decode(bits, null);
    }

    public DecoderResult decode(BitMatrix bits, Map<DecodeHintType, ?> hints) throws FormatException, ChecksumException {
        byte[] datawords;
        BitMatrixParser parser = new BitMatrixParser(bits);
        byte[] codewords = parser.readCodewords();
        correctErrors(codewords, 0, 10, 10, 0);
        int mode = codewords[0] & 15;
        switch (mode) {
            case ODD /* 2 */:
            case PDF417Common.MIN_ROWS_IN_BARCODE /* 3 */:
            case 4:
                correctErrors(codewords, 20, 84, 40, EVEN);
                correctErrors(codewords, 20, 84, 40, ODD);
                datawords = new byte[94];
                break;
            case 5:
                correctErrors(codewords, 20, 68, 56, EVEN);
                correctErrors(codewords, 20, 68, 56, ODD);
                datawords = new byte[78];
                break;
            default:
                throw FormatException.getFormatInstance();
        }
        System.arraycopy(codewords, 0, datawords, 0, 10);
        System.arraycopy(codewords, 20, datawords, 10, datawords.length - 10);
        return DecodedBitStreamParser.decode(datawords, mode);
    }

    private void correctErrors(byte[] codewordBytes, int start, int dataCodewords, int ecCodewords, int mode) throws ChecksumException {
        int codewords = dataCodewords + ecCodewords;
        int divisor = mode == 0 ? EVEN : ODD;
        int[] codewordsInts = new int[codewords / divisor];
        for (int i = 0; i < codewords; i += EVEN) {
            if (mode == 0 || i % ODD == mode - EVEN) {
                codewordsInts[i / divisor] = codewordBytes[i + start] & 255;
            }
        }
        try {
            this.rsDecoder.decode(codewordsInts, ecCodewords / divisor);
            for (int i2 = 0; i2 < dataCodewords; i2 += EVEN) {
                if (mode == 0 || i2 % ODD == mode - EVEN) {
                    codewordBytes[i2 + start] = (byte) codewordsInts[i2 / divisor];
                }
            }
        } catch (ReedSolomonException e) {
            throw ChecksumException.getChecksumInstance();
        }
    }
}
