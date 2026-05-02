package org.apache.commons.codec.language;

import java.util.Locale;
import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.StringEncoder;

/* loaded from: commons-codec-1.8.jar:org/apache/commons/codec/language/MatchRatingApproachEncoder.class */
public class MatchRatingApproachEncoder implements StringEncoder {
    private static final String SPACE = " ";
    private static final String EMPTY = "";
    private static final int ONE = 1;
    private static final int TWO = 2;
    private static final int THREE = 3;
    private static final int FOUR = 4;
    private static final int FIVE = 5;
    private static final int SIX = 6;
    private static final int SEVEN = 7;
    private static final int EIGHT = 8;
    private static final int ELEVEN = 11;
    private static final int TWELVE = 12;
    private static final String PLAIN_ASCII = "AaEeIiOoUuAaEeIiOoUuYyAaEeIiOoUuYyAaOoNnAaEeIiOoUuYyAaCcOoUu";
    private static final String UNICODE = "ÀàÈèÌìÒòÙùÁáÉéÍíÓóÚúÝýÂâÊêÎîÔôÛûŶŷÃãÕõÑñÄäËëÏïÖöÜüŸÿÅåÇçŐőŰű";
    private static final String[] DOUBLE_CONSONANT = {"BB", "CC", "DD", "FF", "GG", "HH", "JJ", "KK", "LL", "MM", "NN", "PP", "QQ", "RR", "SS", "TT", "VV", "WW", "XX", "YY", "ZZ"};

    String cleanName(String name) {
        String upperName = name.toUpperCase(Locale.ENGLISH);
        String[] charsToTrim = {"\\-", "[&]", "\\'", "\\.", "[\\,]"};
        int len$ = charsToTrim.length;
        for (int i$ = 0; i$ < len$; i$ += ONE) {
            String str = charsToTrim[i$];
            upperName = upperName.replaceAll(str, EMPTY);
        }
        return removeAccents(upperName).replaceAll("\\s+", EMPTY);
    }

    @Override // org.apache.commons.codec.Encoder
    public final Object encode(Object pObject) throws EncoderException {
        if (!(pObject instanceof String)) {
            throw new EncoderException("Parameter supplied to Match Rating Approach encoder is not of type java.lang.String");
        }
        return encode((String) pObject);
    }

    @Override // org.apache.commons.codec.StringEncoder
    public final String encode(String name) {
        if (name == null || EMPTY.equalsIgnoreCase(name) || SPACE.equalsIgnoreCase(name) || name.length() == ONE) {
            return EMPTY;
        }
        return getFirst3Last3(removeDoubleConsonants(removeVowels(cleanName(name))));
    }

    String getFirst3Last3(String name) {
        int nameLength = name.length();
        if (nameLength > SIX) {
            String firstThree = name.substring(0, THREE);
            String lastThree = name.substring(nameLength - THREE, nameLength);
            return firstThree + lastThree;
        }
        return name;
    }

    int getMinRating(int sumLength) {
        int minRating;
        if (sumLength <= FOUR) {
            minRating = FIVE;
        } else if (sumLength >= FIVE && sumLength <= SEVEN) {
            minRating = FOUR;
        } else if (sumLength >= EIGHT && sumLength <= ELEVEN) {
            minRating = THREE;
        } else if (sumLength == TWELVE) {
            minRating = TWO;
        } else {
            minRating = ONE;
        }
        return minRating;
    }

    public boolean isEncodeEquals(String name1, String name2) {
        if (name1 == null || EMPTY.equalsIgnoreCase(name1) || SPACE.equalsIgnoreCase(name1) || name2 == null || EMPTY.equalsIgnoreCase(name2) || SPACE.equalsIgnoreCase(name2) || name1.length() == ONE || name2.length() == ONE) {
            return false;
        }
        if (name1.equalsIgnoreCase(name2)) {
            return true;
        }
        String name12 = cleanName(name1);
        String name22 = cleanName(name2);
        String name13 = removeVowels(name12);
        String name23 = removeVowels(name22);
        String name14 = removeDoubleConsonants(name13);
        String name24 = removeDoubleConsonants(name23);
        String name15 = getFirst3Last3(name14);
        String name25 = getFirst3Last3(name24);
        if (Math.abs(name15.length() - name25.length()) >= THREE) {
            return false;
        }
        int sumLength = Math.abs(name15.length() + name25.length());
        int minRating = getMinRating(sumLength);
        int count = leftToRightThenRightToLeftProcessing(name15, name25);
        return count >= minRating;
    }

    boolean isVowel(String letter) {
        return letter.equalsIgnoreCase("E") || letter.equalsIgnoreCase("A") || letter.equalsIgnoreCase("O") || letter.equalsIgnoreCase("I") || letter.equalsIgnoreCase("U");
    }

    int leftToRightThenRightToLeftProcessing(String name1, String name2) {
        char[] name1Char = name1.toCharArray();
        char[] name2Char = name2.toCharArray();
        int name1Size = name1.length() - ONE;
        int name2Size = name2.length() - ONE;
        for (int i = 0; i < name1Char.length && i <= name2Size; i += ONE) {
            String name1LtRStart = name1.substring(i, i + ONE);
            String name1LtREnd = name1.substring(name1Size - i, (name1Size - i) + ONE);
            String name2RtLStart = name2.substring(i, i + ONE);
            String name2RtLEnd = name2.substring(name2Size - i, (name2Size - i) + ONE);
            if (name1LtRStart.equals(name2RtLStart)) {
                name1Char[i] = ' ';
                name2Char[i] = ' ';
            }
            if (name1LtREnd.equals(name2RtLEnd)) {
                name1Char[name1Size - i] = ' ';
                name2Char[name2Size - i] = ' ';
            }
        }
        String strA = new String(name1Char).replaceAll("\\s+", EMPTY);
        String strB = new String(name2Char).replaceAll("\\s+", EMPTY);
        if (strA.length() > strB.length()) {
            return Math.abs(SIX - strA.length());
        }
        return Math.abs(SIX - strB.length());
    }

    String removeAccents(String accentedWord) {
        if (accentedWord == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        int n = accentedWord.length();
        for (int i = 0; i < n; i += ONE) {
            char c = accentedWord.charAt(i);
            int pos = UNICODE.indexOf(c);
            if (pos > -1) {
                sb.append(PLAIN_ASCII.charAt(pos));
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    String removeDoubleConsonants(String name) {
        String replacedName = name.toUpperCase();
        String[] arr$ = DOUBLE_CONSONANT;
        int len$ = arr$.length;
        for (int i$ = 0; i$ < len$; i$ += ONE) {
            String dc = arr$[i$];
            if (replacedName.contains(dc)) {
                String singleLetter = dc.substring(0, ONE);
                replacedName = replacedName.replace(dc, singleLetter);
            }
        }
        return replacedName;
    }

    String removeVowels(String name) {
        String firstLetter = name.substring(0, ONE);
        String name2 = name.replaceAll("A", EMPTY).replaceAll("E", EMPTY).replaceAll("I", EMPTY).replaceAll("O", EMPTY).replaceAll("U", EMPTY).replaceAll("\\s{2,}\\b", SPACE);
        if (isVowel(firstLetter)) {
            return firstLetter + name2;
        }
        return name2;
    }
}
