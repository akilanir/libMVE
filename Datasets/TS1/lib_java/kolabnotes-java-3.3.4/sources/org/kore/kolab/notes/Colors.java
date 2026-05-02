package org.kore.kolab.notes;

import org.kore.kolab.notes.Color;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/Colors.class */
public enum Colors implements Color {
    WHITE("#FFFFFF"),
    SILVER("#C0C0C0"),
    GRAY("#808080"),
    BLACK("#000000"),
    RED("#FF0000"),
    MAROON("#800000"),
    YELLOW("#FFFF00"),
    OLIVE("#808000"),
    LIME("#00FF00"),
    GREN("#008000"),
    CYAN("#00FFFF"),
    TEAL("#008080"),
    BLUE("#0000FF"),
    NAVY("#000080"),
    MAGENTA("#FF00FF"),
    BROWN("#8B4513"),
    GOLD("#FFD700"),
    ORANGE("FFA500"),
    PURPLE("#800080");

    private final String colorCode;

    Colors(String colorCode) {
        this.colorCode = colorCode;
    }

    @Override // org.kore.kolab.notes.Color
    public String getHexcode() {
        return this.colorCode;
    }

    public static Color getColor(String hexCode) {
        if (hexCode == null || hexCode.trim().length() == 0) {
            return null;
        }
        for (Color color : values()) {
            if (color.getHexcode().equalsIgnoreCase(hexCode)) {
                return color;
            }
        }
        return new Color.DefaultImpl(hexCode);
    }
}
