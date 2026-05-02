package com.google.zxing.datamatrix.encoder;

import java.util.Arrays;

/* loaded from: core-3.2.0.jar:com/google/zxing/datamatrix/encoder/DefaultPlacement.class */
public class DefaultPlacement {
    private final CharSequence codewords;
    private final int numrows;
    private final int numcols;
    private final byte[] bits;

    public DefaultPlacement(CharSequence codewords, int numcols, int numrows) {
        this.codewords = codewords;
        this.numcols = numcols;
        this.numrows = numrows;
        this.bits = new byte[numcols * numrows];
        Arrays.fill(this.bits, (byte) -1);
    }

    final int getNumrows() {
        return this.numrows;
    }

    final int getNumcols() {
        return this.numcols;
    }

    final byte[] getBits() {
        return this.bits;
    }

    public final boolean getBit(int col, int row) {
        return this.bits[(row * this.numcols) + col] == 1;
    }

    final void setBit(int col, int row, boolean bit) {
        this.bits[(row * this.numcols) + col] = bit ? (byte) 1 : (byte) 0;
    }

    final boolean hasBit(int col, int row) {
        return this.bits[(row * this.numcols) + col] >= 0;
    }

    public final void place() {
        int pos = 0;
        int row = 4;
        int col = 0;
        while (true) {
            if (row == this.numrows && col == 0) {
                int i = pos;
                pos++;
                corner1(i);
            }
            if (row == this.numrows - 2 && col == 0 && this.numcols % 4 != 0) {
                int i2 = pos;
                pos++;
                corner2(i2);
            }
            if (row == this.numrows - 2 && col == 0 && this.numcols % 8 == 4) {
                int i3 = pos;
                pos++;
                corner3(i3);
            }
            if (row == this.numrows + 4 && col == 2 && this.numcols % 8 == 0) {
                int i4 = pos;
                pos++;
                corner4(i4);
            }
            do {
                if (row < this.numrows && col >= 0 && !hasBit(col, row)) {
                    int i5 = pos;
                    pos++;
                    utah(row, col, i5);
                }
                row -= 2;
                col += 2;
                if (row < 0) {
                    break;
                }
            } while (col < this.numcols);
            int row2 = row + 1;
            int col2 = col + 3;
            do {
                if (row2 >= 0 && col2 < this.numcols && !hasBit(col2, row2)) {
                    int i6 = pos;
                    pos++;
                    utah(row2, col2, i6);
                }
                row2 += 2;
                col2 -= 2;
                if (row2 >= this.numrows) {
                    break;
                }
            } while (col2 >= 0);
            row = row2 + 3;
            col = col2 + 1;
            if (row >= this.numrows && col >= this.numcols) {
                break;
            }
        }
        if (!hasBit(this.numcols - 1, this.numrows - 1)) {
            setBit(this.numcols - 1, this.numrows - 1, true);
            setBit(this.numcols - 2, this.numrows - 2, true);
        }
    }

    private void module(int row, int col, int pos, int bit) {
        if (row < 0) {
            row += this.numrows;
            col += 4 - ((this.numrows + 4) % 8);
        }
        if (col < 0) {
            col += this.numcols;
            row += 4 - ((this.numcols + 4) % 8);
        }
        int v = this.codewords.charAt(pos);
        setBit(col, row, (v & (1 << (8 - bit))) != 0);
    }

    private void utah(int row, int col, int pos) {
        module(row - 2, col - 2, pos, 1);
        module(row - 2, col - 1, pos, 2);
        module(row - 1, col - 2, pos, 3);
        module(row - 1, col - 1, pos, 4);
        module(row - 1, col, pos, 5);
        module(row, col - 2, pos, 6);
        module(row, col - 1, pos, 7);
        module(row, col, pos, 8);
    }

    private void corner1(int pos) {
        module(this.numrows - 1, 0, pos, 1);
        module(this.numrows - 1, 1, pos, 2);
        module(this.numrows - 1, 2, pos, 3);
        module(0, this.numcols - 2, pos, 4);
        module(0, this.numcols - 1, pos, 5);
        module(1, this.numcols - 1, pos, 6);
        module(2, this.numcols - 1, pos, 7);
        module(3, this.numcols - 1, pos, 8);
    }

    private void corner2(int pos) {
        module(this.numrows - 3, 0, pos, 1);
        module(this.numrows - 2, 0, pos, 2);
        module(this.numrows - 1, 0, pos, 3);
        module(0, this.numcols - 4, pos, 4);
        module(0, this.numcols - 3, pos, 5);
        module(0, this.numcols - 2, pos, 6);
        module(0, this.numcols - 1, pos, 7);
        module(1, this.numcols - 1, pos, 8);
    }

    private void corner3(int pos) {
        module(this.numrows - 3, 0, pos, 1);
        module(this.numrows - 2, 0, pos, 2);
        module(this.numrows - 1, 0, pos, 3);
        module(0, this.numcols - 2, pos, 4);
        module(0, this.numcols - 1, pos, 5);
        module(1, this.numcols - 1, pos, 6);
        module(2, this.numcols - 1, pos, 7);
        module(3, this.numcols - 1, pos, 8);
    }

    private void corner4(int pos) {
        module(this.numrows - 1, 0, pos, 1);
        module(this.numrows - 1, this.numcols - 1, pos, 2);
        module(0, this.numcols - 3, pos, 3);
        module(0, this.numcols - 2, pos, 4);
        module(0, this.numcols - 1, pos, 5);
        module(1, this.numcols - 3, pos, 6);
        module(1, this.numcols - 2, pos, 7);
        module(1, this.numcols - 1, pos, 8);
    }
}
