package com.google.common.base;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
/* loaded from: guava-15.0.jar:com/google/common/base/CaseFormat.class */
public enum CaseFormat {
    LOWER_HYPHEN(CharMatcher.is('-'), "-") { // from class: com.google.common.base.CaseFormat.1
        @Override // com.google.common.base.CaseFormat
        String normalizeWord(String word) {
            return Ascii.toLowerCase(word);
        }

        @Override // com.google.common.base.CaseFormat
        String convert(CaseFormat format, String s) {
            if (format == LOWER_UNDERSCORE) {
                return s.replace('-', '_');
            }
            if (format == UPPER_UNDERSCORE) {
                return Ascii.toUpperCase(s.replace('-', '_'));
            }
            return super.convert(format, s);
        }
    },
    LOWER_UNDERSCORE(CharMatcher.is('_'), "_") { // from class: com.google.common.base.CaseFormat.2
        @Override // com.google.common.base.CaseFormat
        String normalizeWord(String word) {
            return Ascii.toLowerCase(word);
        }

        @Override // com.google.common.base.CaseFormat
        String convert(CaseFormat format, String s) {
            if (format == LOWER_HYPHEN) {
                return s.replace('_', '-');
            }
            if (format == UPPER_UNDERSCORE) {
                return Ascii.toUpperCase(s);
            }
            return super.convert(format, s);
        }
    },
    LOWER_CAMEL(CharMatcher.inRange('A', 'Z'), "") { // from class: com.google.common.base.CaseFormat.3
        @Override // com.google.common.base.CaseFormat
        String normalizeWord(String word) {
            return CaseFormat.firstCharOnlyToUpper(word);
        }
    },
    UPPER_CAMEL(CharMatcher.inRange('A', 'Z'), "") { // from class: com.google.common.base.CaseFormat.4
        @Override // com.google.common.base.CaseFormat
        String normalizeWord(String word) {
            return CaseFormat.firstCharOnlyToUpper(word);
        }
    },
    UPPER_UNDERSCORE(CharMatcher.is('_'), "_") { // from class: com.google.common.base.CaseFormat.5
        @Override // com.google.common.base.CaseFormat
        String normalizeWord(String word) {
            return Ascii.toUpperCase(word);
        }

        @Override // com.google.common.base.CaseFormat
        String convert(CaseFormat format, String s) {
            if (format == LOWER_HYPHEN) {
                return Ascii.toLowerCase(s.replace('_', '-'));
            }
            if (format == LOWER_UNDERSCORE) {
                return Ascii.toLowerCase(s);
            }
            return super.convert(format, s);
        }
    };

    private final CharMatcher wordBoundary;
    private final String wordSeparator;

    abstract String normalizeWord(String str);

    CaseFormat(CharMatcher wordBoundary, String wordSeparator) {
        this.wordBoundary = wordBoundary;
        this.wordSeparator = wordSeparator;
    }

    public final String to(CaseFormat format, String str) {
        Preconditions.checkNotNull(format);
        Preconditions.checkNotNull(str);
        return format == this ? str : convert(format, str);
    }

    String convert(CaseFormat format, String s) {
        StringBuilder out = null;
        int i = 0;
        int j = -1;
        while (true) {
            int indexIn = this.wordBoundary.indexIn(s, j + 1);
            j = indexIn;
            if (indexIn == -1) {
                break;
            }
            if (i == 0) {
                out = new StringBuilder(s.length() + (4 * this.wordSeparator.length()));
                out.append(format.normalizeFirstWord(s.substring(i, j)));
            } else {
                out.append(format.normalizeWord(s.substring(i, j)));
            }
            out.append(format.wordSeparator);
            i = j + this.wordSeparator.length();
        }
        return i == 0 ? format.normalizeFirstWord(s) : out.append(format.normalizeWord(s.substring(i))).toString();
    }

    private String normalizeFirstWord(String word) {
        return this == LOWER_CAMEL ? Ascii.toLowerCase(word) : normalizeWord(word);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String firstCharOnlyToUpper(String word) {
        return word.isEmpty() ? word : new StringBuilder(word.length()).append(Ascii.toUpperCase(word.charAt(0))).append(Ascii.toLowerCase(word.substring(1))).toString();
    }
}
