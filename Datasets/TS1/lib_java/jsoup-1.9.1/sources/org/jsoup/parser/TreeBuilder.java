package org.jsoup.parser;

import java.util.ArrayList;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Attributes;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Token;

/* loaded from: jsoup-1.9.1.jar:org/jsoup/parser/TreeBuilder.class */
abstract class TreeBuilder {
    CharacterReader reader;
    Tokeniser tokeniser;
    protected Document doc;
    protected ArrayList<Element> stack;
    protected String baseUri;
    protected Token currentToken;
    protected ParseErrorList errors;
    private Token.StartTag start = new Token.StartTag();
    private Token.EndTag end = new Token.EndTag();

    protected abstract boolean process(Token token);

    TreeBuilder() {
    }

    protected void initialiseParse(String input, String baseUri, ParseErrorList errors) {
        Validate.notNull(input, "String input must not be null");
        Validate.notNull(baseUri, "BaseURI must not be null");
        this.doc = new Document(baseUri);
        this.reader = new CharacterReader(input);
        this.errors = errors;
        this.tokeniser = new Tokeniser(this.reader, errors);
        this.stack = new ArrayList<>(32);
        this.baseUri = baseUri;
    }

    Document parse(String input, String baseUri) {
        return parse(input, baseUri, ParseErrorList.noTracking());
    }

    Document parse(String input, String baseUri, ParseErrorList errors) {
        initialiseParse(input, baseUri, errors);
        runParser();
        return this.doc;
    }

    protected void runParser() {
        Token token;
        do {
            token = this.tokeniser.read();
            process(token);
            token.reset();
        } while (token.type != Token.TokenType.EOF);
    }

    protected boolean processStartTag(String name) {
        if (this.currentToken == this.start) {
            return process(new Token.StartTag().name(name));
        }
        return process(this.start.reset().name(name));
    }

    public boolean processStartTag(String name, Attributes attrs) {
        if (this.currentToken == this.start) {
            return process(new Token.StartTag().nameAttr(name, attrs));
        }
        this.start.reset();
        this.start.nameAttr(name, attrs);
        return process(this.start);
    }

    protected boolean processEndTag(String name) {
        if (this.currentToken == this.end) {
            return process(new Token.EndTag().name(name));
        }
        return process(this.end.reset().name(name));
    }

    protected Element currentElement() {
        int size = this.stack.size();
        if (size > 0) {
            return this.stack.get(size - 1);
        }
        return null;
    }
}
