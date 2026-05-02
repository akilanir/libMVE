package com.google.zxing.pdf417.decoder;

import com.google.zxing.ChecksumException;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.pdf417.PDF417Common;
import com.google.zxing.pdf417.decoder.ec.ErrorCorrection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Formatter;
import java.util.List;

/* loaded from: core-3.2.1.jar:com/google/zxing/pdf417/decoder/PDF417ScanningDecoder.class */
public final class PDF417ScanningDecoder {
    private static final int CODEWORD_SKEW_SIZE = 2;
    private static final int MAX_ERRORS = 3;
    private static final int MAX_EC_CODEWORDS = 512;
    private static final ErrorCorrection errorCorrection = new ErrorCorrection();

    private PDF417ScanningDecoder() {
    }

    /* JADX WARN: Removed duplicated region for block: B:63:0x0184  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01a9 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.google.zxing.common.DecoderResult decode(com.google.zxing.common.BitMatrix r9, com.google.zxing.ResultPoint r10, com.google.zxing.ResultPoint r11, com.google.zxing.ResultPoint r12, com.google.zxing.ResultPoint r13, int r14, int r15) throws com.google.zxing.NotFoundException, com.google.zxing.FormatException, com.google.zxing.ChecksumException {
        /*
            Method dump skipped, instructions count: 443
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.pdf417.decoder.PDF417ScanningDecoder.decode(com.google.zxing.common.BitMatrix, com.google.zxing.ResultPoint, com.google.zxing.ResultPoint, com.google.zxing.ResultPoint, com.google.zxing.ResultPoint, int, int):com.google.zxing.common.DecoderResult");
    }

    private static DetectionResult merge(DetectionResultRowIndicatorColumn leftRowIndicatorColumn, DetectionResultRowIndicatorColumn rightRowIndicatorColumn) throws NotFoundException, FormatException {
        BarcodeMetadata barcodeMetadata;
        if ((leftRowIndicatorColumn == null && rightRowIndicatorColumn == null) || (barcodeMetadata = getBarcodeMetadata(leftRowIndicatorColumn, rightRowIndicatorColumn)) == null) {
            return null;
        }
        BoundingBox boundingBox = BoundingBox.merge(adjustBoundingBox(leftRowIndicatorColumn), adjustBoundingBox(rightRowIndicatorColumn));
        return new DetectionResult(barcodeMetadata, boundingBox);
    }

    private static BoundingBox adjustBoundingBox(DetectionResultRowIndicatorColumn rowIndicatorColumn) throws NotFoundException, FormatException {
        int[] rowHeights;
        if (rowIndicatorColumn == null || (rowHeights = rowIndicatorColumn.getRowHeights()) == null) {
            return null;
        }
        int maxRowHeight = getMax(rowHeights);
        int missingStartRows = 0;
        for (int rowHeight : rowHeights) {
            missingStartRows += maxRowHeight - rowHeight;
            if (rowHeight > 0) {
                break;
            }
        }
        Codeword[] codewords = rowIndicatorColumn.getCodewords();
        for (int row = 0; missingStartRows > 0 && codewords[row] == null; row++) {
            missingStartRows--;
        }
        int missingEndRows = 0;
        for (int row2 = rowHeights.length - 1; row2 >= 0; row2--) {
            missingEndRows += maxRowHeight - rowHeights[row2];
            if (rowHeights[row2] > 0) {
                break;
            }
        }
        for (int row3 = codewords.length - 1; missingEndRows > 0 && codewords[row3] == null; row3--) {
            missingEndRows--;
        }
        return rowIndicatorColumn.getBoundingBox().addMissingRows(missingStartRows, missingEndRows, rowIndicatorColumn.isLeft());
    }

    private static int getMax(int[] values) {
        int maxValue = -1;
        for (int value : values) {
            maxValue = Math.max(maxValue, value);
        }
        return maxValue;
    }

    private static BarcodeMetadata getBarcodeMetadata(DetectionResultRowIndicatorColumn leftRowIndicatorColumn, DetectionResultRowIndicatorColumn rightRowIndicatorColumn) {
        BarcodeMetadata leftBarcodeMetadata;
        BarcodeMetadata rightBarcodeMetadata;
        if (leftRowIndicatorColumn == null || (leftBarcodeMetadata = leftRowIndicatorColumn.getBarcodeMetadata()) == null) {
            if (rightRowIndicatorColumn == null) {
                return null;
            }
            return rightRowIndicatorColumn.getBarcodeMetadata();
        }
        if (rightRowIndicatorColumn == null || (rightBarcodeMetadata = rightRowIndicatorColumn.getBarcodeMetadata()) == null) {
            return leftBarcodeMetadata;
        }
        if (leftBarcodeMetadata.getColumnCount() != rightBarcodeMetadata.getColumnCount() && leftBarcodeMetadata.getErrorCorrectionLevel() != rightBarcodeMetadata.getErrorCorrectionLevel() && leftBarcodeMetadata.getRowCount() != rightBarcodeMetadata.getRowCount()) {
            return null;
        }
        return leftBarcodeMetadata;
    }

    private static DetectionResultRowIndicatorColumn getRowIndicatorColumn(BitMatrix image, BoundingBox boundingBox, ResultPoint startPoint, boolean leftToRight, int minCodewordWidth, int maxCodewordWidth) {
        DetectionResultRowIndicatorColumn rowIndicatorColumn = new DetectionResultRowIndicatorColumn(boundingBox, leftToRight);
        int i = 0;
        while (i < CODEWORD_SKEW_SIZE) {
            int increment = i == 0 ? 1 : -1;
            int startColumn = (int) startPoint.getX();
            int y = (int) startPoint.getY();
            while (true) {
                int imageRow = y;
                if (imageRow > boundingBox.getMaxY() || imageRow < boundingBox.getMinY()) {
                    break;
                }
                Codeword codeword = detectCodeword(image, 0, image.getWidth(), leftToRight, startColumn, imageRow, minCodewordWidth, maxCodewordWidth);
                if (codeword != null) {
                    rowIndicatorColumn.setCodeword(imageRow, codeword);
                    if (leftToRight) {
                        startColumn = codeword.getStartX();
                    } else {
                        startColumn = codeword.getEndX();
                    }
                }
                y = imageRow + increment;
            }
            i++;
        }
        return rowIndicatorColumn;
    }

    private static void adjustCodewordCount(DetectionResult detectionResult, BarcodeValue[][] barcodeMatrix) throws NotFoundException {
        int[] numberOfCodewords = barcodeMatrix[0][1].getValue();
        int calculatedNumberOfCodewords = (detectionResult.getBarcodeColumnCount() * detectionResult.getBarcodeRowCount()) - getNumberOfECCodeWords(detectionResult.getBarcodeECLevel());
        if (numberOfCodewords.length == 0) {
            if (calculatedNumberOfCodewords < 1 || calculatedNumberOfCodewords > 928) {
                throw NotFoundException.getNotFoundInstance();
            }
            barcodeMatrix[0][1].setValue(calculatedNumberOfCodewords);
            return;
        }
        if (numberOfCodewords[0] != calculatedNumberOfCodewords) {
            barcodeMatrix[0][1].setValue(calculatedNumberOfCodewords);
        }
    }

    /* JADX WARN: Type inference failed for: r0v14, types: [int[], int[][]] */
    private static DecoderResult createDecoderResult(DetectionResult detectionResult) throws FormatException, ChecksumException, NotFoundException {
        BarcodeValue[][] barcodeMatrix = createBarcodeMatrix(detectionResult);
        adjustCodewordCount(detectionResult, barcodeMatrix);
        Collection<Integer> erasures = new ArrayList<>();
        int[] codewords = new int[detectionResult.getBarcodeRowCount() * detectionResult.getBarcodeColumnCount()];
        List<int[]> ambiguousIndexValuesList = new ArrayList<>();
        List<Integer> ambiguousIndexesList = new ArrayList<>();
        for (int row = 0; row < detectionResult.getBarcodeRowCount(); row++) {
            for (int column = 0; column < detectionResult.getBarcodeColumnCount(); column++) {
                int[] values = barcodeMatrix[row][column + 1].getValue();
                int codewordIndex = (row * detectionResult.getBarcodeColumnCount()) + column;
                if (values.length == 0) {
                    erasures.add(Integer.valueOf(codewordIndex));
                } else if (values.length == 1) {
                    codewords[codewordIndex] = values[0];
                } else {
                    ambiguousIndexesList.add(Integer.valueOf(codewordIndex));
                    ambiguousIndexValuesList.add(values);
                }
            }
        }
        ?? r0 = new int[ambiguousIndexValuesList.size()];
        for (int i = 0; i < r0.length; i++) {
            r0[i] = ambiguousIndexValuesList.get(i);
        }
        return createDecoderResultFromAmbiguousValues(detectionResult.getBarcodeECLevel(), codewords, PDF417Common.toIntArray(erasures), PDF417Common.toIntArray(ambiguousIndexesList), r0);
    }

    private static DecoderResult createDecoderResultFromAmbiguousValues(int ecLevel, int[] codewords, int[] erasureArray, int[] ambiguousIndexes, int[][] ambiguousIndexValues) throws FormatException, ChecksumException {
        int[] ambiguousIndexCount = new int[ambiguousIndexes.length];
        int tries = 100;
        while (true) {
            int i = tries;
            tries--;
            if (i > 0) {
                for (int i2 = 0; i2 < ambiguousIndexCount.length; i2++) {
                    codewords[ambiguousIndexes[i2]] = ambiguousIndexValues[i2][ambiguousIndexCount[i2]];
                }
                try {
                    return decodeCodewords(codewords, ecLevel, erasureArray);
                } catch (ChecksumException e) {
                    if (ambiguousIndexCount.length == 0) {
                        throw ChecksumException.getChecksumInstance();
                    }
                    int i3 = 0;
                    while (true) {
                        if (i3 >= ambiguousIndexCount.length) {
                            break;
                        }
                        if (ambiguousIndexCount[i3] < ambiguousIndexValues[i3].length - 1) {
                            int i4 = i3;
                            ambiguousIndexCount[i4] = ambiguousIndexCount[i4] + 1;
                            break;
                        }
                        ambiguousIndexCount[i3] = 0;
                        if (i3 != ambiguousIndexCount.length - 1) {
                            i3++;
                        } else {
                            throw ChecksumException.getChecksumInstance();
                        }
                    }
                }
            } else {
                throw ChecksumException.getChecksumInstance();
            }
        }
    }

    private static BarcodeValue[][] createBarcodeMatrix(DetectionResult detectionResult) throws FormatException {
        int rowNumber;
        BarcodeValue[][] barcodeMatrix = new BarcodeValue[detectionResult.getBarcodeRowCount()][detectionResult.getBarcodeColumnCount() + CODEWORD_SKEW_SIZE];
        for (int row = 0; row < barcodeMatrix.length; row++) {
            for (int column = 0; column < barcodeMatrix[row].length; column++) {
                barcodeMatrix[row][column] = new BarcodeValue();
            }
        }
        int column2 = 0;
        for (DetectionResultColumn detectionResultColumn : detectionResult.getDetectionResultColumns()) {
            if (detectionResultColumn != null) {
                for (Codeword codeword : detectionResultColumn.getCodewords()) {
                    if (codeword != null && (rowNumber = codeword.getRowNumber()) >= 0) {
                        if (rowNumber >= barcodeMatrix.length) {
                            throw FormatException.getFormatInstance();
                        }
                        barcodeMatrix[rowNumber][column2].setValue(codeword.getValue());
                    }
                }
            }
            column2++;
        }
        return barcodeMatrix;
    }

    private static boolean isValidBarcodeColumn(DetectionResult detectionResult, int barcodeColumn) {
        return barcodeColumn >= 0 && barcodeColumn <= detectionResult.getBarcodeColumnCount() + 1;
    }

    private static int getStartColumn(DetectionResult detectionResult, int barcodeColumn, int imageRow, boolean leftToRight) {
        int offset = leftToRight ? 1 : -1;
        Codeword codeword = null;
        if (isValidBarcodeColumn(detectionResult, barcodeColumn - offset)) {
            codeword = detectionResult.getDetectionResultColumn(barcodeColumn - offset).getCodeword(imageRow);
        }
        if (codeword != null) {
            return leftToRight ? codeword.getEndX() : codeword.getStartX();
        }
        Codeword codeword2 = detectionResult.getDetectionResultColumn(barcodeColumn).getCodewordNearby(imageRow);
        if (codeword2 != null) {
            return leftToRight ? codeword2.getStartX() : codeword2.getEndX();
        }
        if (isValidBarcodeColumn(detectionResult, barcodeColumn - offset)) {
            codeword2 = detectionResult.getDetectionResultColumn(barcodeColumn - offset).getCodewordNearby(imageRow);
        }
        if (codeword2 != null) {
            return leftToRight ? codeword2.getEndX() : codeword2.getStartX();
        }
        int skippedColumns = 0;
        while (isValidBarcodeColumn(detectionResult, barcodeColumn - offset)) {
            barcodeColumn -= offset;
            for (Codeword previousRowCodeword : detectionResult.getDetectionResultColumn(barcodeColumn).getCodewords()) {
                if (previousRowCodeword != null) {
                    return (leftToRight ? previousRowCodeword.getEndX() : previousRowCodeword.getStartX()) + (offset * skippedColumns * (previousRowCodeword.getEndX() - previousRowCodeword.getStartX()));
                }
            }
            skippedColumns++;
        }
        return leftToRight ? detectionResult.getBoundingBox().getMinX() : detectionResult.getBoundingBox().getMaxX();
    }

    private static Codeword detectCodeword(BitMatrix image, int minColumn, int maxColumn, boolean leftToRight, int startColumn, int imageRow, int minCodewordWidth, int maxCodewordWidth) {
        int endColumn;
        int decodedValue;
        int codeword;
        int startColumn2 = adjustCodewordStartColumn(image, minColumn, maxColumn, leftToRight, startColumn, imageRow);
        int[] moduleBitCount = getModuleBitCount(image, minColumn, maxColumn, leftToRight, startColumn2, imageRow);
        if (moduleBitCount == null) {
            return null;
        }
        int codewordBitCount = PDF417Common.getBitCountSum(moduleBitCount);
        if (leftToRight) {
            endColumn = startColumn2 + codewordBitCount;
        } else {
            for (int i = 0; i < moduleBitCount.length / CODEWORD_SKEW_SIZE; i++) {
                int tmpCount = moduleBitCount[i];
                moduleBitCount[i] = moduleBitCount[(moduleBitCount.length - 1) - i];
                moduleBitCount[(moduleBitCount.length - 1) - i] = tmpCount;
            }
            endColumn = startColumn2;
            startColumn2 = endColumn - codewordBitCount;
        }
        if (!checkCodewordSkew(codewordBitCount, minCodewordWidth, maxCodewordWidth) || (codeword = PDF417Common.getCodeword((decodedValue = PDF417CodewordDecoder.getDecodedValue(moduleBitCount)))) == -1) {
            return null;
        }
        return new Codeword(startColumn2, endColumn, getCodewordBucketNumber(decodedValue), codeword);
    }

    private static int[] getModuleBitCount(BitMatrix image, int minColumn, int maxColumn, boolean leftToRight, int startColumn, int imageRow) {
        int imageColumn = startColumn;
        int[] moduleBitCount = new int[8];
        int moduleNumber = 0;
        int increment = leftToRight ? 1 : -1;
        boolean previousPixelValue = leftToRight;
        while (true) {
            if (((!leftToRight || imageColumn >= maxColumn) && (leftToRight || imageColumn < minColumn)) || moduleNumber >= moduleBitCount.length) {
                break;
            }
            if (image.get(imageColumn, imageRow) == previousPixelValue) {
                int i = moduleNumber;
                moduleBitCount[i] = moduleBitCount[i] + 1;
                imageColumn += increment;
            } else {
                moduleNumber++;
                previousPixelValue = !previousPixelValue;
            }
        }
        if (moduleNumber == moduleBitCount.length || (((leftToRight && imageColumn == maxColumn) || (!leftToRight && imageColumn == minColumn)) && moduleNumber == moduleBitCount.length - 1)) {
            return moduleBitCount;
        }
        return null;
    }

    private static int getNumberOfECCodeWords(int barcodeECLevel) {
        return CODEWORD_SKEW_SIZE << barcodeECLevel;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0051, code lost:
    
        r12 = -r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0057, code lost:
    
        if (r8 != false) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x005a, code lost:
    
        r0 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x005e, code lost:
    
        r0 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x005f, code lost:
    
        r8 = r0;
        r13 = r13 + 1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int adjustCodewordStartColumn(com.google.zxing.common.BitMatrix r5, int r6, int r7, boolean r8, int r9, int r10) {
        /*
            r0 = r9
            r11 = r0
            r0 = r8
            if (r0 == 0) goto Lc
            r0 = -1
            goto Ld
        Lc:
            r0 = 1
        Ld:
            r12 = r0
            r0 = 0
            r13 = r0
        L12:
            r0 = r13
            r1 = 2
            if (r0 >= r1) goto L66
        L18:
            r0 = r8
            if (r0 == 0) goto L22
            r0 = r11
            r1 = r6
            if (r0 >= r1) goto L2c
        L22:
            r0 = r8
            if (r0 != 0) goto L51
            r0 = r11
            r1 = r7
            if (r0 >= r1) goto L51
        L2c:
            r0 = r8
            r1 = r5
            r2 = r11
            r3 = r10
            boolean r1 = r1.get(r2, r3)
            if (r0 != r1) goto L51
            r0 = r9
            r1 = r11
            int r0 = r0 - r1
            int r0 = java.lang.Math.abs(r0)
            r1 = 2
            if (r0 <= r1) goto L47
            r0 = r9
            return r0
        L47:
            r0 = r11
            r1 = r12
            int r0 = r0 + r1
            r11 = r0
            goto L18
        L51:
            r0 = r12
            int r0 = -r0
            r12 = r0
            r0 = r8
            if (r0 != 0) goto L5e
            r0 = 1
            goto L5f
        L5e:
            r0 = 0
        L5f:
            r8 = r0
            int r13 = r13 + 1
            goto L12
        L66:
            r0 = r11
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.pdf417.decoder.PDF417ScanningDecoder.adjustCodewordStartColumn(com.google.zxing.common.BitMatrix, int, int, boolean, int, int):int");
    }

    private static boolean checkCodewordSkew(int codewordSize, int minCodewordWidth, int maxCodewordWidth) {
        return minCodewordWidth - CODEWORD_SKEW_SIZE <= codewordSize && codewordSize <= maxCodewordWidth + CODEWORD_SKEW_SIZE;
    }

    private static DecoderResult decodeCodewords(int[] codewords, int ecLevel, int[] erasures) throws FormatException, ChecksumException {
        if (codewords.length == 0) {
            throw FormatException.getFormatInstance();
        }
        int numECCodewords = 1 << (ecLevel + 1);
        int correctedErrorsCount = correctErrors(codewords, erasures, numECCodewords);
        verifyCodewordCount(codewords, numECCodewords);
        DecoderResult decoderResult = DecodedBitStreamParser.decode(codewords, String.valueOf(ecLevel));
        decoderResult.setErrorsCorrected(Integer.valueOf(correctedErrorsCount));
        decoderResult.setErasures(Integer.valueOf(erasures.length));
        return decoderResult;
    }

    private static int correctErrors(int[] codewords, int[] erasures, int numECCodewords) throws ChecksumException {
        if ((erasures != null && erasures.length > (numECCodewords / CODEWORD_SKEW_SIZE) + 3) || numECCodewords < 0 || numECCodewords > MAX_EC_CODEWORDS) {
            throw ChecksumException.getChecksumInstance();
        }
        return errorCorrection.decode(codewords, numECCodewords, erasures);
    }

    private static void verifyCodewordCount(int[] codewords, int numECCodewords) throws FormatException {
        if (codewords.length < 4) {
            throw FormatException.getFormatInstance();
        }
        int numberOfCodewords = codewords[0];
        if (numberOfCodewords > codewords.length) {
            throw FormatException.getFormatInstance();
        }
        if (numberOfCodewords == 0) {
            if (numECCodewords < codewords.length) {
                codewords[0] = codewords.length - numECCodewords;
                return;
            }
            throw FormatException.getFormatInstance();
        }
    }

    private static int[] getBitCountForCodeword(int codeword) {
        int[] result = new int[8];
        int previousValue = 0;
        int i = result.length - 1;
        while (true) {
            if ((codeword & 1) != previousValue) {
                previousValue = codeword & 1;
                i--;
                if (i < 0) {
                    return result;
                }
            }
            int i2 = i;
            result[i2] = result[i2] + 1;
            codeword >>= 1;
        }
    }

    private static int getCodewordBucketNumber(int codeword) {
        return getCodewordBucketNumber(getBitCountForCodeword(codeword));
    }

    private static int getCodewordBucketNumber(int[] moduleBitCount) {
        return ((((moduleBitCount[0] - moduleBitCount[CODEWORD_SKEW_SIZE]) + moduleBitCount[4]) - moduleBitCount[6]) + 9) % 9;
    }

    public static String toString(BarcodeValue[][] barcodeMatrix) {
        Formatter formatter = new Formatter();
        for (int row = 0; row < barcodeMatrix.length; row++) {
            formatter.format("Row %2d: ", Integer.valueOf(row));
            for (int column = 0; column < barcodeMatrix[row].length; column++) {
                BarcodeValue barcodeValue = barcodeMatrix[row][column];
                if (barcodeValue.getValue().length == 0) {
                    formatter.format("        ", (Object[]) null);
                } else {
                    formatter.format("%4d(%2d)", Integer.valueOf(barcodeValue.getValue()[0]), barcodeValue.getConfidence(barcodeValue.getValue()[0]));
                }
            }
            formatter.format("%n", new Object[0]);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }
}
