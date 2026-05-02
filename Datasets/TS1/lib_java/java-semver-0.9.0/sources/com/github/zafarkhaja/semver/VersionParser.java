package com.github.zafarkhaja.semver;

import com.github.zafarkhaja.semver.util.Stream;
import com.github.zafarkhaja.semver.util.UnexpectedElementException;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/VersionParser.class */
class VersionParser implements Parser<Version> {
    private final Stream<Character> chars;

    /* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/VersionParser$CharType.class */
    enum CharType implements Stream.ElementType<Character> {
        DIGIT { // from class: com.github.zafarkhaja.semver.VersionParser.CharType.1
            @Override // com.github.zafarkhaja.semver.util.Stream.ElementType
            public boolean isMatchedBy(Character chr) {
                return chr != null && chr.charValue() >= '0' && chr.charValue() <= '9';
            }
        },
        LETTER { // from class: com.github.zafarkhaja.semver.VersionParser.CharType.2
            @Override // com.github.zafarkhaja.semver.util.Stream.ElementType
            public boolean isMatchedBy(Character chr) {
                if (chr == null) {
                    return false;
                }
                return (chr.charValue() >= 'a' && chr.charValue() <= 'z') || (chr.charValue() >= 'A' && chr.charValue() <= 'Z');
            }
        },
        DOT { // from class: com.github.zafarkhaja.semver.VersionParser.CharType.3
            @Override // com.github.zafarkhaja.semver.util.Stream.ElementType
            public boolean isMatchedBy(Character chr) {
                return chr != null && chr.charValue() == '.';
            }
        },
        HYPHEN { // from class: com.github.zafarkhaja.semver.VersionParser.CharType.4
            @Override // com.github.zafarkhaja.semver.util.Stream.ElementType
            public boolean isMatchedBy(Character chr) {
                return chr != null && chr.charValue() == '-';
            }
        },
        PLUS { // from class: com.github.zafarkhaja.semver.VersionParser.CharType.5
            @Override // com.github.zafarkhaja.semver.util.Stream.ElementType
            public boolean isMatchedBy(Character chr) {
                return chr != null && chr.charValue() == '+';
            }
        },
        EOI { // from class: com.github.zafarkhaja.semver.VersionParser.CharType.6
            @Override // com.github.zafarkhaja.semver.util.Stream.ElementType
            public boolean isMatchedBy(Character chr) {
                return chr == null;
            }
        },
        ILLEGAL { // from class: com.github.zafarkhaja.semver.VersionParser.CharType.7
            @Override // com.github.zafarkhaja.semver.util.Stream.ElementType
            public boolean isMatchedBy(Character chr) {
                EnumSet<CharType> itself = EnumSet.of(ILLEGAL);
                Iterator it = EnumSet.complementOf(itself).iterator();
                while (it.hasNext()) {
                    CharType type = (CharType) it.next();
                    if (type.isMatchedBy(chr)) {
                        return false;
                    }
                }
                return true;
            }
        };

        static CharType forCharacter(Character chr) {
            for (CharType type : values()) {
                if (type.isMatchedBy(chr)) {
                    return type;
                }
            }
            return null;
        }
    }

    VersionParser(String input) {
        if (input == null || input.isEmpty()) {
            throw new IllegalArgumentException("Input string is NULL or empty");
        }
        Character[] elements = new Character[input.length()];
        for (int i = 0; i < input.length(); i++) {
            elements[i] = Character.valueOf(input.charAt(i));
        }
        this.chars = new Stream<>(elements);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.github.zafarkhaja.semver.Parser
    public Version parse(String input) {
        return parseValidSemVer();
    }

    static Version parseValidSemVer(String version) {
        VersionParser parser = new VersionParser(version);
        return parser.parseValidSemVer();
    }

    static NormalVersion parseVersionCore(String versionCore) {
        VersionParser parser = new VersionParser(versionCore);
        return parser.parseVersionCore();
    }

    static MetadataVersion parsePreRelease(String preRelease) {
        VersionParser parser = new VersionParser(preRelease);
        return parser.parsePreRelease();
    }

    static MetadataVersion parseBuild(String build) {
        VersionParser parser = new VersionParser(build);
        return parser.parseBuild();
    }

    private Version parseValidSemVer() {
        NormalVersion normal = parseVersionCore();
        MetadataVersion preRelease = MetadataVersion.NULL;
        MetadataVersion build = MetadataVersion.NULL;
        Character next = consumeNextCharacter(CharType.HYPHEN, CharType.PLUS, CharType.EOI);
        if (CharType.HYPHEN.isMatchedBy(next)) {
            preRelease = parsePreRelease();
            if (CharType.PLUS.isMatchedBy(consumeNextCharacter(CharType.PLUS, CharType.EOI))) {
                build = parseBuild();
            }
        } else if (CharType.PLUS.isMatchedBy(next)) {
            build = parseBuild();
        }
        consumeNextCharacter(CharType.EOI);
        return new Version(normal, preRelease, build);
    }

    private NormalVersion parseVersionCore() {
        int major = Integer.parseInt(numericIdentifier());
        consumeNextCharacter(CharType.DOT);
        int minor = Integer.parseInt(numericIdentifier());
        consumeNextCharacter(CharType.DOT);
        int patch = Integer.parseInt(numericIdentifier());
        return new NormalVersion(major, minor, patch);
    }

    private MetadataVersion parsePreRelease() {
        ensureValidLookahead(CharType.DIGIT, CharType.LETTER, CharType.HYPHEN);
        List<String> idents = new ArrayList<>();
        while (true) {
            idents.add(preReleaseIdentifier());
            if (this.chars.positiveLookahead(CharType.DOT)) {
                consumeNextCharacter(CharType.DOT);
            } else {
                return new MetadataVersion((String[]) idents.toArray(new String[idents.size()]));
            }
        }
    }

    private String preReleaseIdentifier() {
        checkForEmptyIdentifier();
        CharType boundary = nearestCharType(CharType.DOT, CharType.PLUS, CharType.EOI);
        if (this.chars.positiveLookaheadBefore(boundary, CharType.LETTER, CharType.HYPHEN)) {
            return alphanumericIdentifier();
        }
        return numericIdentifier();
    }

    private MetadataVersion parseBuild() {
        ensureValidLookahead(CharType.DIGIT, CharType.LETTER, CharType.HYPHEN);
        List<String> idents = new ArrayList<>();
        while (true) {
            idents.add(buildIdentifier());
            if (this.chars.positiveLookahead(CharType.DOT)) {
                consumeNextCharacter(CharType.DOT);
            } else {
                return new MetadataVersion((String[]) idents.toArray(new String[idents.size()]));
            }
        }
    }

    private String buildIdentifier() {
        checkForEmptyIdentifier();
        CharType boundary = nearestCharType(CharType.DOT, CharType.EOI);
        if (this.chars.positiveLookaheadBefore(boundary, CharType.LETTER, CharType.HYPHEN)) {
            return alphanumericIdentifier();
        }
        return digits();
    }

    private String numericIdentifier() {
        checkForLeadingZeroes();
        return digits();
    }

    private String alphanumericIdentifier() {
        StringBuilder sb = new StringBuilder();
        do {
            sb.append(consumeNextCharacter(CharType.DIGIT, CharType.LETTER, CharType.HYPHEN));
        } while (this.chars.positiveLookahead(CharType.DIGIT, CharType.LETTER, CharType.HYPHEN));
        return sb.toString();
    }

    private String digits() {
        StringBuilder sb = new StringBuilder();
        do {
            sb.append(consumeNextCharacter(CharType.DIGIT));
        } while (this.chars.positiveLookahead(CharType.DIGIT));
        return sb.toString();
    }

    private CharType nearestCharType(CharType... types) {
        Iterator<Character> it = this.chars.iterator();
        while (it.hasNext()) {
            Character chr = it.next();
            for (CharType type : types) {
                if (type.isMatchedBy(chr)) {
                    return type;
                }
            }
        }
        return CharType.EOI;
    }

    private void checkForLeadingZeroes() {
        Character la1 = this.chars.lookahead(1);
        Character la2 = this.chars.lookahead(2);
        if (la1 != null && la1.charValue() == '0' && CharType.DIGIT.isMatchedBy(la2)) {
            throw new ParseException("Numeric identifier MUST NOT contain leading zeroes");
        }
    }

    private void checkForEmptyIdentifier() {
        Character la = this.chars.lookahead(1);
        if (CharType.DOT.isMatchedBy(la) || CharType.PLUS.isMatchedBy(la) || CharType.EOI.isMatchedBy(la)) {
            throw new ParseException("Identifiers MUST NOT be empty", new UnexpectedCharacterException(la, this.chars.currentOffset(), CharType.DIGIT, CharType.LETTER, CharType.HYPHEN));
        }
    }

    private Character consumeNextCharacter(CharType... expected) {
        try {
            return this.chars.consume(expected);
        } catch (UnexpectedElementException e) {
            throw new UnexpectedCharacterException(e);
        }
    }

    private void ensureValidLookahead(CharType... expected) {
        if (!this.chars.positiveLookahead(expected)) {
            throw new UnexpectedCharacterException(this.chars.lookahead(1), this.chars.currentOffset(), expected);
        }
    }
}
