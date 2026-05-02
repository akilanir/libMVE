package org.jsoup.parser;

import java.util.Arrays;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Entities;
import org.jsoup.parser.Token;

/* loaded from: jsoup-1.8.2.jar:org/jsoup/parser/Tokeniser.class */
final class Tokeniser {
    static final char replacementChar = 65533;
    private static final char[] notCharRefCharsSorted = {'\t', '\n', '\r', '\f', ' ', '<', '&'};
    private CharacterReader reader;
    private ParseErrorList errors;
    private Token emitPending;
    Token.Tag tagPending;
    private String lastStartTag;
    private TokeniserState state = TokeniserState.Data;
    private boolean isEmitPending = false;
    private String charsString = null;
    private StringBuilder charsBuilder = new StringBuilder(1024);
    StringBuilder dataBuffer = new StringBuilder(1024);
    Token.StartTag startPending = new Token.StartTag();
    Token.EndTag endPending = new Token.EndTag();
    Token.Character charPending = new Token.Character();
    Token.Doctype doctypePending = new Token.Doctype();
    Token.Comment commentPending = new Token.Comment();
    private boolean selfClosingFlagAcknowledged = true;
    private final char[] charRefHolder = new char[1];

    static {
        Arrays.sort(notCharRefCharsSorted);
    }

    Tokeniser(CharacterReader reader, ParseErrorList errors) {
        this.reader = reader;
        this.errors = errors;
    }

    Token read() {
        if (!this.selfClosingFlagAcknowledged) {
            error("Self closing flag not acknowledged");
            this.selfClosingFlagAcknowledged = true;
        }
        while (!this.isEmitPending) {
            this.state.read(this, this.reader);
        }
        if (this.charsBuilder.length() > 0) {
            String str = this.charsBuilder.toString();
            this.charsBuilder.delete(0, this.charsBuilder.length());
            this.charsString = null;
            return this.charPending.data(str);
        }
        if (this.charsString != null) {
            Token token = this.charPending.data(this.charsString);
            this.charsString = null;
            return token;
        }
        this.isEmitPending = false;
        return this.emitPending;
    }

    void emit(Token token) {
        Validate.isFalse(this.isEmitPending, "There is an unread token pending!");
        this.emitPending = token;
        this.isEmitPending = true;
        if (token.type == Token.TokenType.StartTag) {
            Token.StartTag startTag = (Token.StartTag) token;
            this.lastStartTag = startTag.tagName;
            if (startTag.selfClosing) {
                this.selfClosingFlagAcknowledged = false;
                return;
            }
            return;
        }
        if (token.type == Token.TokenType.EndTag) {
            Token.EndTag endTag = (Token.EndTag) token;
            if (endTag.attributes != null) {
                error("Attributes incorrectly present on end tag");
            }
        }
    }

    void emit(String str) {
        if (this.charsString == null) {
            this.charsString = str;
            return;
        }
        if (this.charsBuilder.length() == 0) {
            this.charsBuilder.append(this.charsString);
        }
        this.charsBuilder.append(str);
    }

    void emit(char[] chars) {
        emit(String.valueOf(chars));
    }

    void emit(char c) {
        emit(String.valueOf(c));
    }

    TokeniserState getState() {
        return this.state;
    }

    void transition(TokeniserState state) {
        this.state = state;
    }

    void advanceTransition(TokeniserState state) {
        this.reader.advance();
        this.state = state;
    }

    void acknowledgeSelfClosingFlag() {
        this.selfClosingFlagAcknowledged = true;
    }

    char[] consumeCharacterReference(Character additionalAllowedCharacter, boolean inAttribute) {
        if (this.reader.isEmpty()) {
            return null;
        }
        if ((additionalAllowedCharacter != null && additionalAllowedCharacter.charValue() == this.reader.current()) || this.reader.matchesAnySorted(notCharRefCharsSorted)) {
            return null;
        }
        char[] charRef = this.charRefHolder;
        this.reader.mark();
        if (this.reader.matchConsume("#")) {
            boolean isHexMode = this.reader.matchConsumeIgnoreCase("X");
            String numRef = isHexMode ? this.reader.consumeHexSequence() : this.reader.consumeDigitSequence();
            if (numRef.length() == 0) {
                characterReferenceError("numeric reference with no numerals");
                this.reader.rewindToMark();
                return null;
            }
            if (!this.reader.matchConsume(";")) {
                characterReferenceError("missing semicolon");
            }
            int charval = -1;
            try {
                int base = isHexMode ? 16 : 10;
                charval = Integer.valueOf(numRef, base).intValue();
            } catch (NumberFormatException e) {
            }
            if (charval == -1 || ((charval >= 55296 && charval <= 57343) || charval > 1114111)) {
                characterReferenceError("character outside of valid range");
                charRef[0] = 65533;
                return charRef;
            }
            if (charval < 65536) {
                charRef[0] = (char) charval;
                return charRef;
            }
            return Character.toChars(charval);
        }
        String nameRef = this.reader.consumeLetterThenDigitSequence();
        boolean looksLegit = this.reader.matches(';');
        boolean found = Entities.isBaseNamedEntity(nameRef) || (Entities.isNamedEntity(nameRef) && looksLegit);
        if (!found) {
            this.reader.rewindToMark();
            if (looksLegit) {
                characterReferenceError(String.format("invalid named referenece '%s'", nameRef));
                return null;
            }
            return null;
        }
        if (inAttribute && (this.reader.matchesLetter() || this.reader.matchesDigit() || this.reader.matchesAny('=', '-', '_'))) {
            this.reader.rewindToMark();
            return null;
        }
        if (!this.reader.matchConsume(";")) {
            characterReferenceError("missing semicolon");
        }
        charRef[0] = Entities.getCharacterByName(nameRef).charValue();
        return charRef;
    }

    Token.Tag createTagPending(boolean start) {
        this.tagPending = start ? this.startPending.reset() : this.endPending.reset();
        return this.tagPending;
    }

    void emitTagPending() {
        this.tagPending.finaliseTag();
        emit(this.tagPending);
    }

    void createCommentPending() {
        this.commentPending.reset();
    }

    void emitCommentPending() {
        emit(this.commentPending);
    }

    void createDoctypePending() {
        this.doctypePending.reset();
    }

    void emitDoctypePending() {
        emit(this.doctypePending);
    }

    void createTempBuffer() {
        Token.reset(this.dataBuffer);
    }

    boolean isAppropriateEndTagToken() {
        return this.lastStartTag != null && this.tagPending.tagName.equals(this.lastStartTag);
    }

    String appropriateEndTagName() {
        if (this.lastStartTag == null) {
            return null;
        }
        return this.lastStartTag;
    }

    void error(TokeniserState state) {
        if (this.errors.canAddError()) {
            this.errors.add(new ParseError(this.reader.pos(), "Unexpected character '%s' in input state [%s]", Character.valueOf(this.reader.current()), state));
        }
    }

    void eofError(TokeniserState state) {
        if (this.errors.canAddError()) {
            this.errors.add(new ParseError(this.reader.pos(), "Unexpectedly reached end of file (EOF) in input state [%s]", state));
        }
    }

    private void characterReferenceError(String message) {
        if (this.errors.canAddError()) {
            this.errors.add(new ParseError(this.reader.pos(), "Invalid character reference: %s", message));
        }
    }

    private void error(String errorMsg) {
        if (this.errors.canAddError()) {
            this.errors.add(new ParseError(this.reader.pos(), errorMsg));
        }
    }

    boolean currentNodeInHtmlNS() {
        return true;
    }

    String unescapeEntities(boolean inAttribute) {
        StringBuilder builder = new StringBuilder();
        while (!this.reader.isEmpty()) {
            builder.append(this.reader.consumeTo('&'));
            if (this.reader.matches('&')) {
                this.reader.consume();
                char[] c = consumeCharacterReference(null, inAttribute);
                if (c == null || c.length == 0) {
                    builder.append('&');
                } else {
                    builder.append(c);
                }
            }
        }
        return builder.toString();
    }
}
