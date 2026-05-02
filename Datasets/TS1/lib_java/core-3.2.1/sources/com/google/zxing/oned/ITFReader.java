package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Map;

/* loaded from: core-3.2.1.jar:com/google/zxing/oned/ITFReader.class */
public final class ITFReader extends OneDReader {
    private static final float MAX_AVG_VARIANCE = 0.38f;
    private static final float MAX_INDIVIDUAL_VARIANCE = 0.78f;
    private static final int W = 3;
    private int narrowLineWidth = -1;
    private static final int[] DEFAULT_ALLOWED_LENGTHS = {6, 8, 10, 12, 14};
    private static final int N = 1;
    private static final int[] START_PATTERN = {N, N, N, N};
    private static final int[] END_PATTERN_REVERSED = {N, N, 3};
    static final int[][] PATTERNS = {new int[]{N, N, 3, 3, N}, new int[]{3, N, N, N, 3}, new int[]{N, 3, N, N, 3}, new int[]{3, 3, N, N, N}, new int[]{N, N, 3, N, 3}, new int[]{3, N, 3, N, N}, new int[]{N, 3, 3, N, N}, new int[]{N, N, N, 3, 3}, new int[]{3, N, N, 3, N}, new int[]{N, 3, N, 3, N}};

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws FormatException, NotFoundException {
        int[] startRange = decodeStart(row);
        int[] endRange = decodeEnd(row);
        StringBuilder result = new StringBuilder(20);
        decodeMiddle(row, startRange[N], endRange[0], result);
        String resultString = result.toString();
        int[] allowedLengths = null;
        if (hints != null) {
            allowedLengths = (int[]) hints.get(DecodeHintType.ALLOWED_LENGTHS);
        }
        if (allowedLengths == null) {
            allowedLengths = DEFAULT_ALLOWED_LENGTHS;
        }
        int length = resultString.length();
        boolean lengthOK = false;
        int maxAllowedLength = 0;
        int[] iArr = allowedLengths;
        int length2 = iArr.length;
        int i = 0;
        while (true) {
            if (i >= length2) {
                break;
            }
            int allowedLength = iArr[i];
            if (length == allowedLength) {
                lengthOK = N;
                break;
            }
            if (allowedLength > maxAllowedLength) {
                maxAllowedLength = allowedLength;
            }
            i += N;
        }
        if (!lengthOK && length > maxAllowedLength) {
            lengthOK = N;
        }
        if (!lengthOK) {
            throw FormatException.getFormatInstance();
        }
        return new Result(resultString, null, new ResultPoint[]{new ResultPoint(startRange[N], rowNumber), new ResultPoint(endRange[0], rowNumber)}, BarcodeFormat.ITF);
    }

    private static void decodeMiddle(BitArray row, int payloadStart, int payloadEnd, StringBuilder resultString) throws NotFoundException {
        int[] counterDigitPair = new int[10];
        int[] counterBlack = new int[5];
        int[] counterWhite = new int[5];
        while (payloadStart < payloadEnd) {
            recordPattern(row, payloadStart, counterDigitPair);
            for (int k = 0; k < 5; k += N) {
                int twoK = 2 * k;
                counterBlack[k] = counterDigitPair[twoK];
                counterWhite[k] = counterDigitPair[twoK + N];
            }
            int bestMatch = decodeDigit(counterBlack);
            resultString.append((char) (48 + bestMatch));
            int bestMatch2 = decodeDigit(counterWhite);
            resultString.append((char) (48 + bestMatch2));
            int length = counterDigitPair.length;
            for (int i = 0; i < length; i += N) {
                int counterDigit = counterDigitPair[i];
                payloadStart += counterDigit;
            }
        }
    }

    int[] decodeStart(BitArray row) throws NotFoundException {
        int endStart = skipWhiteSpace(row);
        int[] startPattern = findGuardPattern(row, endStart, START_PATTERN);
        this.narrowLineWidth = (startPattern[N] - startPattern[0]) / 4;
        validateQuietZone(row, startPattern[0]);
        return startPattern;
    }

    private void validateQuietZone(BitArray row, int startPattern) throws NotFoundException {
        int quietCount = this.narrowLineWidth * 10;
        int quietCount2 = quietCount < startPattern ? quietCount : startPattern;
        for (int i = startPattern - N; quietCount2 > 0 && i >= 0 && !row.get(i); i--) {
            quietCount2--;
        }
        if (quietCount2 != 0) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    private static int skipWhiteSpace(BitArray row) throws NotFoundException {
        int width = row.getSize();
        int endStart = row.getNextSet(0);
        if (endStart == width) {
            throw NotFoundException.getNotFoundInstance();
        }
        return endStart;
    }

    int[] decodeEnd(BitArray row) throws NotFoundException {
        row.reverse();
        try {
            int endStart = skipWhiteSpace(row);
            int[] endPattern = findGuardPattern(row, endStart, END_PATTERN_REVERSED);
            validateQuietZone(row, endPattern[0]);
            int temp = endPattern[0];
            endPattern[0] = row.getSize() - endPattern[N];
            endPattern[N] = row.getSize() - temp;
            row.reverse();
            return endPattern;
        } catch (Throwable th) {
            row.reverse();
            throw th;
        }
    }

    private static int[] findGuardPattern(BitArray row, int rowOffset, int[] pattern) throws NotFoundException {
        int patternLength = pattern.length;
        int[] counters = new int[patternLength];
        int width = row.getSize();
        boolean isWhite = false;
        int counterPosition = 0;
        int patternStart = rowOffset;
        for (int x = rowOffset; x < width; x += N) {
            if (row.get(x) ^ isWhite) {
                int i = counterPosition;
                counters[i] = counters[i] + N;
            } else {
                if (counterPosition == patternLength - N) {
                    if (patternMatchVariance(counters, pattern, MAX_INDIVIDUAL_VARIANCE) < MAX_AVG_VARIANCE) {
                        return new int[]{patternStart, x};
                    }
                    patternStart += counters[0] + counters[N];
                    System.arraycopy(counters, 2, counters, 0, patternLength - 2);
                    counters[patternLength - 2] = 0;
                    counters[patternLength - N] = 0;
                    counterPosition--;
                } else {
                    counterPosition += N;
                }
                counters[counterPosition] = N;
                isWhite = !isWhite;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int decodeDigit(int[] counters) throws NotFoundException {
        float bestVariance = 0.38f;
        int bestMatch = -1;
        int max = PATTERNS.length;
        for (int i = 0; i < max; i += N) {
            int[] pattern = PATTERNS[i];
            float variance = patternMatchVariance(counters, pattern, MAX_INDIVIDUAL_VARIANCE);
            if (variance < bestVariance) {
                bestVariance = variance;
                bestMatch = i;
            }
        }
        if (bestMatch >= 0) {
            return bestMatch;
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
