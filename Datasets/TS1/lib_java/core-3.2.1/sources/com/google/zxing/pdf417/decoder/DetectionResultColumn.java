package com.google.zxing.pdf417.decoder;

import java.util.Formatter;

/* loaded from: core-3.2.1.jar:com/google/zxing/pdf417/decoder/DetectionResultColumn.class */
class DetectionResultColumn {
    private static final int MAX_NEARBY_DISTANCE = 5;
    private final BoundingBox boundingBox;
    private final Codeword[] codewords;

    DetectionResultColumn(BoundingBox boundingBox) {
        this.boundingBox = new BoundingBox(boundingBox);
        this.codewords = new Codeword[(boundingBox.getMaxY() - boundingBox.getMinY()) + 1];
    }

    final Codeword getCodewordNearby(int imageRow) {
        Codeword codeword;
        Codeword codeword2;
        Codeword codeword3 = getCodeword(imageRow);
        if (codeword3 != null) {
            return codeword3;
        }
        for (int i = 1; i < MAX_NEARBY_DISTANCE; i++) {
            int nearImageRow = imageRowToCodewordIndex(imageRow) - i;
            if (nearImageRow >= 0 && (codeword2 = this.codewords[nearImageRow]) != null) {
                return codeword2;
            }
            int nearImageRow2 = imageRowToCodewordIndex(imageRow) + i;
            if (nearImageRow2 < this.codewords.length && (codeword = this.codewords[nearImageRow2]) != null) {
                return codeword;
            }
        }
        return null;
    }

    final int imageRowToCodewordIndex(int imageRow) {
        return imageRow - this.boundingBox.getMinY();
    }

    final void setCodeword(int imageRow, Codeword codeword) {
        this.codewords[imageRowToCodewordIndex(imageRow)] = codeword;
    }

    final Codeword getCodeword(int imageRow) {
        return this.codewords[imageRowToCodewordIndex(imageRow)];
    }

    final BoundingBox getBoundingBox() {
        return this.boundingBox;
    }

    final Codeword[] getCodewords() {
        return this.codewords;
    }

    public String toString() {
        Formatter formatter = new Formatter();
        int row = 0;
        for (Codeword codeword : this.codewords) {
            if (codeword == null) {
                int i = row;
                row++;
                formatter.format("%3d:    |   %n", Integer.valueOf(i));
            } else {
                int i2 = row;
                row++;
                formatter.format("%3d: %3d|%3d%n", Integer.valueOf(i2), Integer.valueOf(codeword.getRowNumber()), Integer.valueOf(codeword.getValue()));
            }
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }
}
