package ch.qos.logback.classic.pattern;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator.class */
public class TargetLengthBasedClassNameAbbreviator implements Abbreviator {
    final int targetLength;

    public TargetLengthBasedClassNameAbbreviator(int i) {
        this.targetLength = i;
    }

    @Override // ch.qos.logback.classic.pattern.Abbreviator
    public String abbreviate(String str) {
        StringBuilder sb = new StringBuilder(this.targetLength);
        if (str == null) {
            throw new IllegalArgumentException("Class name may not be null");
        }
        if (str.length() < this.targetLength) {
            return str;
        }
        int[] iArr = new int[16];
        int[] iArr2 = new int[17];
        int computeDotIndexes = computeDotIndexes(str, iArr);
        if (computeDotIndexes == 0) {
            return str;
        }
        computeLengthArray(str, iArr, iArr2, computeDotIndexes);
        for (int i = 0; i <= computeDotIndexes; i++) {
            if (i == 0) {
                sb.append(str.substring(0, iArr2[i] - 1));
            } else {
                sb.append(str.substring(iArr[i - 1], iArr[i - 1] + iArr2[i]));
            }
        }
        return sb.toString();
    }

    static int computeDotIndexes(String str, int[] iArr) {
        int i = 0;
        int i2 = 0;
        while (true) {
            int indexOf = str.indexOf(46, i2);
            if (indexOf == -1 || i >= 16) {
                break;
            }
            iArr[i] = indexOf;
            i++;
            i2 = indexOf + 1;
        }
        return i;
    }

    void computeLengthArray(String str, int[] iArr, int[] iArr2, int i) {
        int length = str.length() - this.targetLength;
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = (iArr[i2] - (i2 > 0 ? iArr[i2 - 1] : -1)) - 1;
            int i4 = i3 < 1 ? i3 : 1;
            int i5 = length > 0 ? i3 < 1 ? i3 : 1 : i3;
            length -= i3 - i5;
            iArr2[i2] = i5 + 1;
        }
        iArr2[i] = str.length() - iArr[i - 1];
    }

    static void printArray(String str, int[] iArr) {
        System.out.print(str);
        for (int i = 0; i < iArr.length; i++) {
            if (i == 0) {
                System.out.print(iArr[i]);
            } else {
                System.out.print(", " + iArr[i]);
            }
        }
        System.out.println();
    }
}
