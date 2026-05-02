package com.google.zxing.oned.rss.expanded;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import com.google.zxing.oned.rss.AbstractRSSReader;
import com.google.zxing.oned.rss.DataCharacter;
import com.google.zxing.oned.rss.FinderPattern;
import com.google.zxing.oned.rss.RSSUtils;
import com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: core-3.2.1.jar:com/google/zxing/oned/rss/expanded/RSSExpandedReader.class */
public final class RSSExpandedReader extends AbstractRSSReader {
    private static final int FINDER_PAT_A = 0;
    private static final int FINDER_PAT_D = 3;
    private static final int MAX_PAIRS = 11;
    private final List<ExpandedPair> pairs = new ArrayList(MAX_PAIRS);
    private final List<ExpandedRow> rows = new ArrayList();
    private final int[] startEnd = new int[FINDER_PAT_C];
    private boolean startFromEven;
    private static final int FINDER_PAT_F = 5;
    private static final int FINDER_PAT_E = 4;
    private static final int FINDER_PAT_B = 1;
    private static final int[] SYMBOL_WIDEST = {7, FINDER_PAT_F, FINDER_PAT_E, 3, FINDER_PAT_B};
    private static final int[] EVEN_TOTAL_SUBSET = {FINDER_PAT_E, 20, 52, 104, 204};
    private static final int[] GSUM = {0, 348, 1388, 2948, 3988};
    private static final int FINDER_PAT_C = 2;
    private static final int[][] FINDER_PATTERNS = {new int[]{FINDER_PAT_B, 8, FINDER_PAT_E, FINDER_PAT_B}, new int[]{3, 6, FINDER_PAT_E, FINDER_PAT_B}, new int[]{3, FINDER_PAT_E, 6, FINDER_PAT_B}, new int[]{3, FINDER_PAT_C, 8, FINDER_PAT_B}, new int[]{FINDER_PAT_C, 6, FINDER_PAT_F, FINDER_PAT_B}, new int[]{FINDER_PAT_C, FINDER_PAT_C, 9, FINDER_PAT_B}};
    private static final int[][] WEIGHTS = {new int[]{FINDER_PAT_B, 3, 9, 27, 81, 32, 96, 77}, new int[]{20, 60, 180, 118, 143, 7, 21, 63}, new int[]{189, 145, 13, 39, 117, 140, 209, 205}, new int[]{193, 157, 49, 147, 19, 57, 171, 91}, new int[]{62, 186, 136, 197, 169, 85, 44, 132}, new int[]{185, 133, 188, 142, FINDER_PAT_E, 12, 36, 108}, new int[]{113, 128, 173, 97, 80, 29, 87, 50}, new int[]{150, 28, 84, 41, 123, 158, 52, 156}, new int[]{46, 138, 203, 187, 139, 206, 196, 166}, new int[]{76, 17, 51, 153, 37, 111, 122, 155}, new int[]{43, 129, 176, 106, 107, 110, 119, 146}, new int[]{16, 48, 144, 10, 30, 90, 59, 177}, new int[]{109, 116, 137, 200, 178, 112, 125, 164}, new int[]{70, 210, 208, 202, 184, 130, 179, 115}, new int[]{134, 191, 151, 31, 93, 68, 204, 190}, new int[]{148, 22, 66, 198, 172, 94, 71, FINDER_PAT_C}, new int[]{6, 18, 54, 162, 64, 192, 154, 40}, new int[]{120, 149, 25, 75, 14, 42, 126, 167}, new int[]{79, 26, 78, 23, 69, 207, 199, 175}, new int[]{103, 98, 83, 38, 114, 131, 182, 124}, new int[]{161, 61, 183, 127, 170, 88, 53, 159}, new int[]{55, 165, 73, 8, 24, 72, FINDER_PAT_F, 15}, new int[]{45, 135, 194, 160, 58, 174, 100, 89}};
    private static final int[][] FINDER_PATTERN_SEQUENCES = {new int[]{0, 0}, new int[]{0, FINDER_PAT_B, FINDER_PAT_B}, new int[]{0, FINDER_PAT_C, FINDER_PAT_B, 3}, new int[]{0, FINDER_PAT_E, FINDER_PAT_B, 3, FINDER_PAT_C}, new int[]{0, FINDER_PAT_E, FINDER_PAT_B, 3, 3, FINDER_PAT_F}, new int[]{0, FINDER_PAT_E, FINDER_PAT_B, 3, FINDER_PAT_E, FINDER_PAT_F, FINDER_PAT_F}, new int[]{0, 0, FINDER_PAT_B, FINDER_PAT_B, FINDER_PAT_C, FINDER_PAT_C, 3, 3}, new int[]{0, 0, FINDER_PAT_B, FINDER_PAT_B, FINDER_PAT_C, FINDER_PAT_C, 3, FINDER_PAT_E, FINDER_PAT_E}, new int[]{0, 0, FINDER_PAT_B, FINDER_PAT_B, FINDER_PAT_C, FINDER_PAT_C, 3, FINDER_PAT_E, FINDER_PAT_F, FINDER_PAT_F}, new int[]{0, 0, FINDER_PAT_B, FINDER_PAT_B, FINDER_PAT_C, 3, 3, FINDER_PAT_E, FINDER_PAT_E, FINDER_PAT_F, FINDER_PAT_F}};

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException, FormatException {
        this.pairs.clear();
        this.startFromEven = false;
        try {
            List<ExpandedPair> pairs = decodeRow2pairs(rowNumber, row);
            return constructResult(pairs);
        } catch (NotFoundException e) {
            this.pairs.clear();
            this.startFromEven = true;
            List<ExpandedPair> pairs2 = decodeRow2pairs(rowNumber, row);
            return constructResult(pairs2);
        }
    }

    @Override // com.google.zxing.oned.OneDReader, com.google.zxing.Reader
    public void reset() {
        this.pairs.clear();
        this.rows.clear();
    }

    List<ExpandedPair> decodeRow2pairs(int rowNumber, BitArray row) throws NotFoundException {
        while (true) {
            try {
                ExpandedPair nextPair = retrieveNextPair(row, this.pairs, rowNumber);
                this.pairs.add(nextPair);
            } catch (NotFoundException nfe) {
                if (this.pairs.isEmpty()) {
                    throw nfe;
                }
                if (checkChecksum()) {
                    return this.pairs;
                }
                boolean tryStackedDecode = !this.rows.isEmpty();
                storeRow(rowNumber, false);
                if (tryStackedDecode) {
                    List<ExpandedPair> ps = checkRows(false);
                    if (ps != null) {
                        return ps;
                    }
                    List<ExpandedPair> ps2 = checkRows(true);
                    if (ps2 != null) {
                        return ps2;
                    }
                }
                throw NotFoundException.getNotFoundInstance();
            }
        }
    }

    private List<ExpandedPair> checkRows(boolean reverse) {
        if (this.rows.size() > 25) {
            this.rows.clear();
            return null;
        }
        this.pairs.clear();
        if (reverse) {
            Collections.reverse(this.rows);
        }
        List<ExpandedPair> ps = null;
        try {
            ps = checkRows(new ArrayList(), 0);
        } catch (NotFoundException e) {
        }
        if (reverse) {
            Collections.reverse(this.rows);
        }
        return ps;
    }

    private List<ExpandedPair> checkRows(List<ExpandedRow> collectedRows, int currentRow) throws NotFoundException {
        for (int i = currentRow; i < this.rows.size(); i += FINDER_PAT_B) {
            ExpandedRow row = this.rows.get(i);
            this.pairs.clear();
            int size = collectedRows.size();
            for (int j = 0; j < size; j += FINDER_PAT_B) {
                this.pairs.addAll(collectedRows.get(j).getPairs());
            }
            this.pairs.addAll(row.getPairs());
            if (isValidSequence(this.pairs)) {
                if (checkChecksum()) {
                    return this.pairs;
                }
                List<ExpandedRow> rs = new ArrayList<>();
                rs.addAll(collectedRows);
                rs.add(row);
                try {
                    return checkRows(rs, i + FINDER_PAT_B);
                } catch (NotFoundException e) {
                }
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static boolean isValidSequence(List<ExpandedPair> pairs) {
        int[][] iArr = FINDER_PATTERN_SEQUENCES;
        int length = iArr.length;
        for (int i = 0; i < length; i += FINDER_PAT_B) {
            int[] sequence = iArr[i];
            if (pairs.size() <= sequence.length) {
                boolean stop = FINDER_PAT_B;
                int j = 0;
                while (true) {
                    if (j >= pairs.size()) {
                        break;
                    }
                    if (pairs.get(j).getFinderPattern().getValue() == sequence[j]) {
                        j += FINDER_PAT_B;
                    } else {
                        stop = false;
                        break;
                    }
                }
                if (stop) {
                    return true;
                }
            }
        }
        return false;
    }

    private void storeRow(int rowNumber, boolean wasReversed) {
        int insertPos = 0;
        boolean prevIsSame = false;
        boolean nextIsSame = false;
        while (true) {
            if (insertPos >= this.rows.size()) {
                break;
            }
            ExpandedRow erow = this.rows.get(insertPos);
            if (erow.getRowNumber() > rowNumber) {
                nextIsSame = erow.isEquivalent(this.pairs);
                break;
            } else {
                prevIsSame = erow.isEquivalent(this.pairs);
                insertPos += FINDER_PAT_B;
            }
        }
        if (nextIsSame || prevIsSame || isPartialRow(this.pairs, this.rows)) {
            return;
        }
        this.rows.add(insertPos, new ExpandedRow(this.pairs, rowNumber, wasReversed));
        removePartialRows(this.pairs, this.rows);
    }

    private static void removePartialRows(List<ExpandedPair> pairs, List<ExpandedRow> rows) {
        Iterator<ExpandedRow> iterator = rows.iterator();
        while (iterator.hasNext()) {
            ExpandedRow r = iterator.next();
            if (r.getPairs().size() != pairs.size()) {
                boolean allFound = FINDER_PAT_B;
                Iterator<ExpandedPair> it = r.getPairs().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    ExpandedPair p = it.next();
                    boolean found = false;
                    Iterator<ExpandedPair> it2 = pairs.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            break;
                        }
                        ExpandedPair pp = it2.next();
                        if (p.equals(pp)) {
                            found = FINDER_PAT_B;
                            break;
                        }
                    }
                    if (!found) {
                        allFound = false;
                        break;
                    }
                }
                if (allFound) {
                    iterator.remove();
                }
            }
        }
    }

    private static boolean isPartialRow(Iterable<ExpandedPair> pairs, Iterable<ExpandedRow> rows) {
        for (ExpandedRow r : rows) {
            boolean allFound = FINDER_PAT_B;
            Iterator<ExpandedPair> it = pairs.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                ExpandedPair p = it.next();
                boolean found = false;
                Iterator<ExpandedPair> it2 = r.getPairs().iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    ExpandedPair pp = it2.next();
                    if (p.equals(pp)) {
                        found = FINDER_PAT_B;
                        break;
                    }
                }
                if (!found) {
                    allFound = false;
                    break;
                }
            }
            if (allFound) {
                return true;
            }
        }
        return false;
    }

    List<ExpandedRow> getRows() {
        return this.rows;
    }

    static Result constructResult(List<ExpandedPair> pairs) throws NotFoundException, FormatException {
        BitArray binary = BitArrayBuilder.buildBitArray(pairs);
        AbstractExpandedDecoder decoder = AbstractExpandedDecoder.createDecoder(binary);
        String resultingString = decoder.parseInformation();
        ResultPoint[] firstPoints = pairs.get(0).getFinderPattern().getResultPoints();
        ResultPoint[] lastPoints = pairs.get(pairs.size() - FINDER_PAT_B).getFinderPattern().getResultPoints();
        return new Result(resultingString, null, new ResultPoint[]{firstPoints[0], firstPoints[FINDER_PAT_B], lastPoints[0], lastPoints[FINDER_PAT_B]}, BarcodeFormat.RSS_EXPANDED);
    }

    private boolean checkChecksum() {
        ExpandedPair firstPair = this.pairs.get(0);
        DataCharacter checkCharacter = firstPair.getLeftChar();
        DataCharacter firstCharacter = firstPair.getRightChar();
        if (firstCharacter == null) {
            return false;
        }
        int checksum = firstCharacter.getChecksumPortion();
        int s = FINDER_PAT_C;
        for (int i = FINDER_PAT_B; i < this.pairs.size(); i += FINDER_PAT_B) {
            ExpandedPair currentPair = this.pairs.get(i);
            checksum += currentPair.getLeftChar().getChecksumPortion();
            s += FINDER_PAT_B;
            DataCharacter currentRightChar = currentPair.getRightChar();
            if (currentRightChar != null) {
                checksum += currentRightChar.getChecksumPortion();
                s += FINDER_PAT_B;
            }
        }
        int checkCharacterValue = (211 * (s - FINDER_PAT_E)) + (checksum % 211);
        return checkCharacterValue == checkCharacter.getValue();
    }

    private static int getNextSecondBar(BitArray row, int initialPos) {
        int currentPos;
        if (row.get(initialPos)) {
            int currentPos2 = row.getNextUnset(initialPos);
            currentPos = row.getNextSet(currentPos2);
        } else {
            int currentPos3 = row.getNextSet(initialPos);
            currentPos = row.getNextUnset(currentPos3);
        }
        return currentPos;
    }

    ExpandedPair retrieveNextPair(BitArray row, List<ExpandedPair> previousPairs, int rowNumber) throws NotFoundException {
        FinderPattern pattern;
        DataCharacter rightChar;
        boolean isOddPattern = previousPairs.size() % FINDER_PAT_C == 0;
        if (this.startFromEven) {
            isOddPattern = !isOddPattern;
        }
        boolean keepFinding = FINDER_PAT_B;
        int forcedOffset = -1;
        do {
            findNextPair(row, previousPairs, forcedOffset);
            pattern = parseFoundFinderPattern(row, rowNumber, isOddPattern);
            if (pattern == null) {
                forcedOffset = getNextSecondBar(row, this.startEnd[0]);
            } else {
                keepFinding = false;
            }
        } while (keepFinding);
        DataCharacter leftChar = decodeDataCharacter(row, pattern, isOddPattern, true);
        if (!previousPairs.isEmpty() && previousPairs.get(previousPairs.size() - FINDER_PAT_B).mustBeLast()) {
            throw NotFoundException.getNotFoundInstance();
        }
        try {
            rightChar = decodeDataCharacter(row, pattern, isOddPattern, false);
        } catch (NotFoundException e) {
            rightChar = null;
        }
        return new ExpandedPair(leftChar, rightChar, pattern, true);
    }

    private void findNextPair(BitArray row, List<ExpandedPair> previousPairs, int forcedOffset) throws NotFoundException {
        int rowOffset;
        int[] counters = getDecodeFinderCounters();
        counters[0] = 0;
        counters[FINDER_PAT_B] = 0;
        counters[FINDER_PAT_C] = 0;
        counters[3] = 0;
        int width = row.getSize();
        if (forcedOffset >= 0) {
            rowOffset = forcedOffset;
        } else if (previousPairs.isEmpty()) {
            rowOffset = 0;
        } else {
            ExpandedPair lastPair = previousPairs.get(previousPairs.size() - FINDER_PAT_B);
            rowOffset = lastPair.getFinderPattern().getStartEnd()[FINDER_PAT_B];
        }
        boolean searchingEvenPair = previousPairs.size() % FINDER_PAT_C != 0;
        if (this.startFromEven) {
            searchingEvenPair = !searchingEvenPair;
        }
        boolean isWhite = false;
        while (rowOffset < width) {
            isWhite = !row.get(rowOffset);
            if (!isWhite) {
                break;
            } else {
                rowOffset += FINDER_PAT_B;
            }
        }
        int counterPosition = 0;
        int patternStart = rowOffset;
        for (int x = rowOffset; x < width; x += FINDER_PAT_B) {
            if (row.get(x) ^ isWhite) {
                int i = counterPosition;
                counters[i] = counters[i] + FINDER_PAT_B;
            } else {
                if (counterPosition == 3) {
                    if (searchingEvenPair) {
                        reverseCounters(counters);
                    }
                    if (isFinderPattern(counters)) {
                        this.startEnd[0] = patternStart;
                        this.startEnd[FINDER_PAT_B] = x;
                        return;
                    }
                    if (searchingEvenPair) {
                        reverseCounters(counters);
                    }
                    patternStart += counters[0] + counters[FINDER_PAT_B];
                    counters[0] = counters[FINDER_PAT_C];
                    counters[FINDER_PAT_B] = counters[3];
                    counters[FINDER_PAT_C] = 0;
                    counters[3] = 0;
                    counterPosition--;
                } else {
                    counterPosition += FINDER_PAT_B;
                }
                counters[counterPosition] = FINDER_PAT_B;
                isWhite = !isWhite;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static void reverseCounters(int[] counters) {
        int length = counters.length;
        for (int i = 0; i < length / FINDER_PAT_C; i += FINDER_PAT_B) {
            int tmp = counters[i];
            counters[i] = counters[(length - i) - FINDER_PAT_B];
            counters[(length - i) - FINDER_PAT_B] = tmp;
        }
    }

    private FinderPattern parseFoundFinderPattern(BitArray row, int rowNumber, boolean oddPattern) {
        int start;
        int end;
        int firstCounter;
        if (oddPattern) {
            int firstElementStart = this.startEnd[0] - FINDER_PAT_B;
            while (firstElementStart >= 0 && !row.get(firstElementStart)) {
                firstElementStart--;
            }
            int firstElementStart2 = firstElementStart + FINDER_PAT_B;
            firstCounter = this.startEnd[0] - firstElementStart2;
            start = firstElementStart2;
            end = this.startEnd[FINDER_PAT_B];
        } else {
            start = this.startEnd[0];
            end = row.getNextUnset(this.startEnd[FINDER_PAT_B] + FINDER_PAT_B);
            firstCounter = end - this.startEnd[FINDER_PAT_B];
        }
        int[] counters = getDecodeFinderCounters();
        System.arraycopy(counters, 0, counters, FINDER_PAT_B, counters.length - FINDER_PAT_B);
        counters[0] = firstCounter;
        try {
            int value = parseFinderValue(counters, FINDER_PATTERNS);
            return new FinderPattern(value, new int[]{start, end}, start, end, rowNumber);
        } catch (NotFoundException e) {
            return null;
        }
    }

    DataCharacter decodeDataCharacter(BitArray row, FinderPattern pattern, boolean isOddPattern, boolean leftChar) throws NotFoundException {
        int[] counters = getDataCharacterCounters();
        counters[0] = 0;
        counters[FINDER_PAT_B] = 0;
        counters[FINDER_PAT_C] = 0;
        counters[3] = 0;
        counters[FINDER_PAT_E] = 0;
        counters[FINDER_PAT_F] = 0;
        counters[6] = 0;
        counters[7] = 0;
        if (leftChar) {
            recordPatternInReverse(row, pattern.getStartEnd()[0], counters);
        } else {
            recordPattern(row, pattern.getStartEnd()[FINDER_PAT_B], counters);
            int i = 0;
            for (int j = counters.length - FINDER_PAT_B; i < j; j--) {
                int temp = counters[i];
                counters[i] = counters[j];
                counters[j] = temp;
                i += FINDER_PAT_B;
            }
        }
        float elementWidth = count(counters) / 17;
        float expectedElementWidth = (pattern.getStartEnd()[FINDER_PAT_B] - pattern.getStartEnd()[0]) / 15.0f;
        if (Math.abs(elementWidth - expectedElementWidth) / expectedElementWidth > 0.3f) {
            throw NotFoundException.getNotFoundInstance();
        }
        int[] oddCounts = getOddCounts();
        int[] evenCounts = getEvenCounts();
        float[] oddRoundingErrors = getOddRoundingErrors();
        float[] evenRoundingErrors = getEvenRoundingErrors();
        for (int i2 = 0; i2 < counters.length; i2 += FINDER_PAT_B) {
            float value = (1.0f * counters[i2]) / elementWidth;
            int count = (int) (value + 0.5f);
            if (count < FINDER_PAT_B) {
                if (value < 0.3f) {
                    throw NotFoundException.getNotFoundInstance();
                }
                count = FINDER_PAT_B;
            } else if (count > 8) {
                if (value > 8.7f) {
                    throw NotFoundException.getNotFoundInstance();
                }
                count = 8;
            }
            int offset = i2 / FINDER_PAT_C;
            if ((i2 & FINDER_PAT_B) == 0) {
                oddCounts[offset] = count;
                oddRoundingErrors[offset] = value - count;
            } else {
                evenCounts[offset] = count;
                evenRoundingErrors[offset] = value - count;
            }
        }
        adjustOddEvenCounts(17);
        int weightRowNumber = (((FINDER_PAT_E * pattern.getValue()) + (isOddPattern ? 0 : FINDER_PAT_C)) + (leftChar ? 0 : FINDER_PAT_B)) - FINDER_PAT_B;
        int oddSum = 0;
        int oddChecksumPortion = 0;
        for (int i3 = oddCounts.length - FINDER_PAT_B; i3 >= 0; i3--) {
            if (isNotA1left(pattern, isOddPattern, leftChar)) {
                int weight = WEIGHTS[weightRowNumber][FINDER_PAT_C * i3];
                oddChecksumPortion += oddCounts[i3] * weight;
            }
            oddSum += oddCounts[i3];
        }
        int evenChecksumPortion = 0;
        for (int i4 = evenCounts.length - FINDER_PAT_B; i4 >= 0; i4--) {
            if (isNotA1left(pattern, isOddPattern, leftChar)) {
                int weight2 = WEIGHTS[weightRowNumber][(FINDER_PAT_C * i4) + FINDER_PAT_B];
                evenChecksumPortion += evenCounts[i4] * weight2;
            }
        }
        int checksumPortion = oddChecksumPortion + evenChecksumPortion;
        if ((oddSum & FINDER_PAT_B) != 0 || oddSum > 13 || oddSum < FINDER_PAT_E) {
            throw NotFoundException.getNotFoundInstance();
        }
        int group = (13 - oddSum) / FINDER_PAT_C;
        int oddWidest = SYMBOL_WIDEST[group];
        int evenWidest = 9 - oddWidest;
        int vOdd = RSSUtils.getRSSvalue(oddCounts, oddWidest, true);
        int vEven = RSSUtils.getRSSvalue(evenCounts, evenWidest, false);
        int tEven = EVEN_TOTAL_SUBSET[group];
        int gSum = GSUM[group];
        return new DataCharacter((vOdd * tEven) + vEven + gSum, checksumPortion);
    }

    private static boolean isNotA1left(FinderPattern pattern, boolean isOddPattern, boolean leftChar) {
        return (pattern.getValue() == 0 && isOddPattern && leftChar) ? false : true;
    }

    private void adjustOddEvenCounts(int numModules) throws NotFoundException {
        int oddSum = count(getOddCounts());
        int evenSum = count(getEvenCounts());
        int mismatch = (oddSum + evenSum) - numModules;
        boolean oddParityBad = (oddSum & FINDER_PAT_B) == FINDER_PAT_B;
        boolean evenParityBad = (evenSum & FINDER_PAT_B) == 0;
        boolean incrementOdd = false;
        boolean decrementOdd = false;
        if (oddSum > 13) {
            decrementOdd = FINDER_PAT_B;
        } else if (oddSum < FINDER_PAT_E) {
            incrementOdd = FINDER_PAT_B;
        }
        boolean incrementEven = false;
        boolean decrementEven = false;
        if (evenSum > 13) {
            decrementEven = FINDER_PAT_B;
        } else if (evenSum < FINDER_PAT_E) {
            incrementEven = FINDER_PAT_B;
        }
        if (mismatch == FINDER_PAT_B) {
            if (oddParityBad) {
                if (evenParityBad) {
                    throw NotFoundException.getNotFoundInstance();
                }
                decrementOdd = FINDER_PAT_B;
            } else {
                if (!evenParityBad) {
                    throw NotFoundException.getNotFoundInstance();
                }
                decrementEven = FINDER_PAT_B;
            }
        } else if (mismatch == -1) {
            if (oddParityBad) {
                if (evenParityBad) {
                    throw NotFoundException.getNotFoundInstance();
                }
                incrementOdd = FINDER_PAT_B;
            } else {
                if (!evenParityBad) {
                    throw NotFoundException.getNotFoundInstance();
                }
                incrementEven = FINDER_PAT_B;
            }
        } else if (mismatch == 0) {
            if (oddParityBad) {
                if (!evenParityBad) {
                    throw NotFoundException.getNotFoundInstance();
                }
                if (oddSum < evenSum) {
                    incrementOdd = FINDER_PAT_B;
                    decrementEven = FINDER_PAT_B;
                } else {
                    decrementOdd = FINDER_PAT_B;
                    incrementEven = FINDER_PAT_B;
                }
            } else if (evenParityBad) {
                throw NotFoundException.getNotFoundInstance();
            }
        } else {
            throw NotFoundException.getNotFoundInstance();
        }
        if (incrementOdd) {
            if (decrementOdd) {
                throw NotFoundException.getNotFoundInstance();
            }
            increment(getOddCounts(), getOddRoundingErrors());
        }
        if (decrementOdd) {
            decrement(getOddCounts(), getOddRoundingErrors());
        }
        if (incrementEven) {
            if (decrementEven) {
                throw NotFoundException.getNotFoundInstance();
            }
            increment(getEvenCounts(), getOddRoundingErrors());
        }
        if (decrementEven) {
            decrement(getEvenCounts(), getEvenRoundingErrors());
        }
    }
}
