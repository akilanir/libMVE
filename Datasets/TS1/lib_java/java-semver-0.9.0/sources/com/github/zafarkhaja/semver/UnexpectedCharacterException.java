package com.github.zafarkhaja.semver;

import com.github.zafarkhaja.semver.VersionParser;
import com.github.zafarkhaja.semver.util.UnexpectedElementException;
import java.util.Arrays;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/UnexpectedCharacterException.class */
public class UnexpectedCharacterException extends ParseException {
    private final Character unexpected;
    private final int position;
    private final VersionParser.CharType[] expected;

    UnexpectedCharacterException(UnexpectedElementException cause) {
        this.position = cause.getPosition();
        this.unexpected = (Character) cause.getUnexpectedElement();
        this.expected = (VersionParser.CharType[]) cause.getExpectedElementTypes();
    }

    UnexpectedCharacterException(Character unexpected, int position, VersionParser.CharType... expected) {
        this.unexpected = unexpected;
        this.position = position;
        this.expected = expected;
    }

    Character getUnexpectedCharacter() {
        return this.unexpected;
    }

    int getPosition() {
        return this.position;
    }

    VersionParser.CharType[] getExpectedCharTypes() {
        return this.expected;
    }

    @Override // com.github.zafarkhaja.semver.ParseException, java.lang.Throwable
    public String toString() {
        String message = String.format("Unexpected character '%s(%s)' at position '%d'", VersionParser.CharType.forCharacter(this.unexpected), this.unexpected, Integer.valueOf(this.position));
        if (this.expected.length > 0) {
            message = message + String.format(", expecting '%s'", Arrays.toString(this.expected));
        }
        return message;
    }
}
