package com.nispok.snackbar.enums;

/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/enums/SnackbarType.class */
public enum SnackbarType {
    SINGLE_LINE(48, 48, 1),
    MULTI_LINE(48, 80, 2);

    private int minHeight;
    private int maxHeight;
    private int maxLines;

    SnackbarType(int minHeight, int maxHeight, int maxLines) {
        this.minHeight = minHeight;
        this.maxHeight = maxHeight;
        this.maxLines = maxLines;
    }

    public int getMinHeight() {
        return this.minHeight;
    }

    public int getMaxHeight() {
        return this.maxHeight;
    }

    public int getMaxLines() {
        return this.maxLines;
    }
}
