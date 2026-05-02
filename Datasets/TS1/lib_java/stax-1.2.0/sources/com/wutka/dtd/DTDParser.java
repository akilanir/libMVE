package com.wutka.dtd;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.util.Enumeration;
import java.util.Hashtable;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDParser.class */
public class DTDParser implements EntityExpansion {
    protected Scanner scanner;
    protected DTD dtd;
    protected Object defaultLocation;

    public DTDParser(Reader in) {
        this.scanner = new Scanner(in, false, this);
        this.dtd = new DTD();
    }

    public DTDParser(Reader in, boolean trace) {
        this.scanner = new Scanner(in, trace, this);
        this.dtd = new DTD();
    }

    public DTDParser(File in) throws IOException {
        this.defaultLocation = in.getParentFile();
        this.scanner = new Scanner(new BufferedReader(new FileReader(in)), false, this);
        this.dtd = new DTD();
    }

    public DTDParser(File in, boolean trace) throws IOException {
        this.defaultLocation = in.getParentFile();
        this.scanner = new Scanner(new BufferedReader(new FileReader(in)), trace, this);
        this.dtd = new DTD();
    }

    public DTDParser(URL in) throws IOException {
        String file = in.getFile();
        this.defaultLocation = new URL(in.getProtocol(), in.getHost(), in.getPort(), file.substring(0, file.lastIndexOf(47) + 1));
        this.scanner = new Scanner(new BufferedReader(new InputStreamReader(in.openStream())), false, this);
        this.dtd = new DTD();
    }

    public DTDParser(URL in, boolean trace) throws IOException {
        String file = in.getFile();
        this.defaultLocation = new URL(in.getProtocol(), in.getHost(), in.getPort(), file.substring(0, file.lastIndexOf(47) + 1));
        this.scanner = new Scanner(new BufferedReader(new InputStreamReader(in.openStream())), trace, this);
        this.dtd = new DTD();
    }

    public DTD parse() throws IOException {
        return parse(false);
    }

    /* JADX WARN: Incorrect condition in loop: B:3:0x000f */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.wutka.dtd.DTD parse(boolean r6) throws java.io.IOException {
        /*
            r5 = this;
        L0:
            r0 = r5
            com.wutka.dtd.Scanner r0 = r0.scanner
            com.wutka.dtd.Token r0 = r0.peek()
            r7 = r0
            r0 = r7
            com.wutka.dtd.TokenType r0 = r0.type
            com.wutka.dtd.TokenType r1 = com.wutka.dtd.Scanner.EOF
            if (r0 != r1) goto L15
            goto L1c
        L15:
            r0 = r5
            r0.parseTopLevelElement()
            goto L0
        L1c:
            r0 = r6
            if (r0 == 0) goto Le9
            java.util.Hashtable r0 = new java.util.Hashtable
            r1 = r0
            r1.<init>()
            r8 = r0
            r0 = r5
            com.wutka.dtd.DTD r0 = r0.dtd
            java.util.Hashtable r0 = r0.elements
            java.util.Enumeration r0 = r0.elements()
            r9 = r0
        L34:
            r0 = r9
            boolean r0 = r0.hasMoreElements()
            if (r0 == 0) goto L59
            r0 = r9
            java.lang.Object r0 = r0.nextElement()
            com.wutka.dtd.DTDElement r0 = (com.wutka.dtd.DTDElement) r0
            r10 = r0
            r0 = r8
            r1 = r10
            java.lang.String r1 = r1.name
            r2 = r10
            java.lang.Object r0 = r0.put(r1, r2)
            goto L34
        L59:
            r0 = r5
            com.wutka.dtd.DTD r0 = r0.dtd
            java.util.Hashtable r0 = r0.elements
            java.util.Enumeration r0 = r0.elements()
            r9 = r0
        L65:
            r0 = r9
            boolean r0 = r0.hasMoreElements()
            if (r0 == 0) goto Lbc
            r0 = r9
            java.lang.Object r0 = r0.nextElement()
            com.wutka.dtd.DTDElement r0 = (com.wutka.dtd.DTDElement) r0
            r10 = r0
            r0 = r10
            com.wutka.dtd.DTDItem r0 = r0.content
            boolean r0 = r0 instanceof com.wutka.dtd.DTDContainer
            if (r0 != 0) goto L89
            goto L65
        L89:
            r0 = r10
            com.wutka.dtd.DTDItem r0 = r0.content
            com.wutka.dtd.DTDContainer r0 = (com.wutka.dtd.DTDContainer) r0
            java.util.Vector r0 = r0.getItemsVec()
            java.util.Enumeration r0 = r0.elements()
            r11 = r0
        L99:
            r0 = r11
            boolean r0 = r0.hasMoreElements()
            if (r0 == 0) goto Lb9
            r0 = r5
            r1 = r8
            r2 = r5
            com.wutka.dtd.DTD r2 = r2.dtd
            r3 = r11
            java.lang.Object r3 = r3.nextElement()
            com.wutka.dtd.DTDItem r3 = (com.wutka.dtd.DTDItem) r3
            r0.removeElements(r1, r2, r3)
            goto L99
        Lb9:
            goto L65
        Lbc:
            r0 = r8
            int r0 = r0.size()
            r1 = 1
            if (r0 != r1) goto Lde
            r0 = r8
            java.util.Enumeration r0 = r0.elements()
            r9 = r0
            r0 = r5
            com.wutka.dtd.DTD r0 = r0.dtd
            r1 = r9
            java.lang.Object r1 = r1.nextElement()
            com.wutka.dtd.DTDElement r1 = (com.wutka.dtd.DTDElement) r1
            r0.rootElement = r1
            goto Le6
        Lde:
            r0 = r5
            com.wutka.dtd.DTD r0 = r0.dtd
            r1 = 0
            r0.rootElement = r1
        Le6:
            goto Lf1
        Le9:
            r0 = r5
            com.wutka.dtd.DTD r0 = r0.dtd
            r1 = 0
            r0.rootElement = r1
        Lf1:
            r0 = r5
            com.wutka.dtd.DTD r0 = r0.dtd
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.wutka.dtd.DTDParser.parse(boolean):com.wutka.dtd.DTD");
    }

    protected void removeElements(Hashtable h, DTD dtd, DTDItem item) {
        if (item instanceof DTDName) {
            h.remove(((DTDName) item).value);
        } else if (item instanceof DTDContainer) {
            Enumeration e = ((DTDContainer) item).getItemsVec().elements();
            while (e.hasMoreElements()) {
                removeElements(h, dtd, (DTDItem) e.nextElement());
            }
        }
    }

    protected void parseTopLevelElement() throws IOException {
        Token token = this.scanner.get();
        if (token.type == Scanner.LTQUES) {
            StringBuffer textBuffer = new StringBuffer();
            while (true) {
                String text = this.scanner.getUntil('?');
                textBuffer.append(text);
                if (this.scanner.peek().type == Scanner.GT) {
                    this.scanner.get();
                    DTDProcessingInstruction instruct = new DTDProcessingInstruction(textBuffer.toString());
                    this.dtd.items.addElement(instruct);
                    return;
                }
                textBuffer.append('?');
            }
        } else {
            if (token.type == Scanner.CONDITIONAL) {
                Token token2 = expect(Scanner.IDENTIFIER);
                if (token2.value.equals("IGNORE")) {
                    this.scanner.skipConditional();
                    return;
                } else {
                    if (token2.value.equals("INCLUDE")) {
                        this.scanner.skipUntil('[');
                        return;
                    }
                    throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Invalid token in conditional: ").append(token2.value).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
                }
            }
            if (token.type != Scanner.ENDCONDITIONAL) {
                if (token.type == Scanner.COMMENT) {
                    this.dtd.items.addElement(new DTDComment(token.value));
                    return;
                }
                if (token.type == Scanner.LTBANG) {
                    Token token3 = expect(Scanner.IDENTIFIER);
                    if (token3.value.equals("ELEMENT")) {
                        parseElement();
                        return;
                    }
                    if (token3.value.equals("ATTLIST")) {
                        parseAttlist();
                        return;
                    }
                    if (token3.value.equals("ENTITY")) {
                        parseEntity();
                        return;
                    } else if (token3.value.equals("NOTATION")) {
                        parseNotation();
                        return;
                    } else {
                        skipUntil(Scanner.GT);
                        return;
                    }
                }
                throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Unexpected token: ").append(token.type.name).append("(").append(token.value).append(")").toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
            }
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000d */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void skipUntil(com.wutka.dtd.TokenType r4) throws java.io.IOException {
        /*
            r3 = this;
            r0 = r3
            com.wutka.dtd.Scanner r0 = r0.scanner
            com.wutka.dtd.Token r0 = r0.get()
            r5 = r0
        L8:
            r0 = r5
            com.wutka.dtd.TokenType r0 = r0.type
            r1 = r4
            if (r0 == r1) goto L1b
            r0 = r3
            com.wutka.dtd.Scanner r0 = r0.scanner
            com.wutka.dtd.Token r0 = r0.get()
            r5 = r0
            goto L8
        L1b:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.wutka.dtd.DTDParser.skipUntil(com.wutka.dtd.TokenType):void");
    }

    protected Token expect(TokenType expected) throws IOException {
        Token token = this.scanner.get();
        if (token.type != expected) {
            if (token.value == null) {
                throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Expected ").append(expected.name).append(" instead of ").append(token.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
            }
            throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Expected ").append(expected.name).append(" instead of ").append(token.type.name).append("(").append(token.value).append(")").toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
        }
        return token;
    }

    protected void parseElement() throws IOException {
        Token name = expect(Scanner.IDENTIFIER);
        DTDElement element = (DTDElement) this.dtd.elements.get(name.value);
        if (element == null) {
            element = new DTDElement(name.value);
            this.dtd.elements.put(element.name, element);
        } else if (element.content != null) {
            throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Found second definition of element: ").append(name.value).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
        }
        this.dtd.items.addElement(element);
        parseContentSpec(this.scanner, element);
        expect(Scanner.GT);
    }

    protected void parseContentSpec(Scanner scanner, DTDElement element) throws IOException {
        Token token = scanner.get();
        if (token.type == Scanner.IDENTIFIER) {
            if (token.value.equals("EMPTY")) {
                element.content = new DTDEmpty();
                return;
            } else {
                if (token.value.equals("ANY")) {
                    element.content = new DTDAny();
                    return;
                }
                throw new DTDParseException(scanner.getUriId(), new StringBuffer().append("Invalid token in entity content spec ").append(token.value).toString(), scanner.getLineNumber(), scanner.getColumn());
            }
        }
        if (token.type == Scanner.LPAREN) {
            Token token2 = scanner.peek();
            if (token2.type == Scanner.IDENTIFIER) {
                if (token2.value.equals("#PCDATA")) {
                    parseMixed(element);
                    return;
                } else {
                    parseChildren(element);
                    return;
                }
            }
            if (token2.type == Scanner.LPAREN) {
                parseChildren(element);
            }
        }
    }

    protected void parseMixed(DTDElement element) throws IOException {
        boolean isPcdataOnly = true;
        DTDMixed mixed = new DTDMixed();
        mixed.add(new DTDPCData());
        this.scanner.get();
        element.content = mixed;
        while (true) {
            Token token = this.scanner.get();
            if (token.type == Scanner.RPAREN) {
                Token token2 = this.scanner.peek();
                if (token2.type == Scanner.ASTERISK) {
                    this.scanner.get();
                    mixed.cardinal = DTDCardinal.ZEROMANY;
                    return;
                } else {
                    if (!isPcdataOnly) {
                        throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Invalid token in Mixed content type, '*' required after (#PCDATA|xx ...): ").append(token2.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
                    }
                    mixed.cardinal = DTDCardinal.NONE;
                    return;
                }
            }
            if (token.type == Scanner.PIPE) {
                mixed.add(new DTDName(this.scanner.get().value));
                isPcdataOnly = false;
            } else {
                throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Invalid token in Mixed content type: ").append(token.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
            }
        }
    }

    protected void parseChildren(DTDElement element) throws IOException {
        DTDContainer choiceSeq = parseChoiceSequence();
        Token token = this.scanner.peek();
        choiceSeq.cardinal = parseCardinality();
        if (token.type == Scanner.QUES) {
            choiceSeq.cardinal = DTDCardinal.OPTIONAL;
        } else if (token.type == Scanner.ASTERISK) {
            choiceSeq.cardinal = DTDCardinal.ZEROMANY;
        } else if (token.type == Scanner.PLUS) {
            choiceSeq.cardinal = DTDCardinal.ONEMANY;
        } else {
            choiceSeq.cardinal = DTDCardinal.NONE;
        }
        element.content = choiceSeq;
    }

    protected DTDContainer parseChoiceSequence() throws IOException {
        TokenType separator = null;
        DTDContainer cs = null;
        while (true) {
            DTDItem item = parseCP();
            Token token = this.scanner.get();
            if (token.type == Scanner.PIPE || token.type == Scanner.COMMA) {
                if (separator != null && separator != token.type) {
                    throw new DTDParseException(this.scanner.getUriId(), "Can't mix separators in a choice/sequence", this.scanner.getLineNumber(), this.scanner.getColumn());
                }
                separator = token.type;
                if (cs == null) {
                    if (token.type == Scanner.PIPE) {
                        cs = new DTDChoice();
                    } else {
                        cs = new DTDSequence();
                    }
                }
                cs.add(item);
            } else {
                if (token.type == Scanner.RPAREN) {
                    if (cs == null) {
                        cs = new DTDSequence();
                    }
                    cs.add(item);
                    return cs;
                }
                throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Found invalid token in sequence: ").append(token.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
            }
        }
    }

    protected DTDItem parseCP() throws IOException {
        DTDItem item;
        Token token = this.scanner.get();
        if (token.type == Scanner.IDENTIFIER) {
            item = new DTDName(token.value);
        } else if (token.type == Scanner.LPAREN) {
            item = parseChoiceSequence();
        } else {
            throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Found invalid token in sequence: ").append(token.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
        }
        item.cardinal = parseCardinality();
        return item;
    }

    protected DTDCardinal parseCardinality() throws IOException {
        Token token = this.scanner.peek();
        if (token.type == Scanner.QUES) {
            this.scanner.get();
            return DTDCardinal.OPTIONAL;
        }
        if (token.type == Scanner.ASTERISK) {
            this.scanner.get();
            return DTDCardinal.ZEROMANY;
        }
        if (token.type == Scanner.PLUS) {
            this.scanner.get();
            return DTDCardinal.ONEMANY;
        }
        return DTDCardinal.NONE;
    }

    protected void parseAttlist() throws IOException {
        Token token = expect(Scanner.IDENTIFIER);
        DTDElement element = (DTDElement) this.dtd.elements.get(token.value);
        DTDAttlist attlist = new DTDAttlist(token.value);
        this.dtd.items.addElement(attlist);
        if (element == null) {
            element = new DTDElement(token.value);
            this.dtd.elements.put(token.value, element);
        }
        Token token2 = this.scanner.peek();
        while (token2.type != Scanner.GT) {
            parseAttdef(this.scanner, element, attlist);
            token2 = this.scanner.peek();
        }
        expect(Scanner.GT);
    }

    protected void parseAttdef(Scanner scanner, DTDElement element, DTDAttlist attlist) throws IOException {
        Token token = expect(Scanner.IDENTIFIER);
        DTDAttribute attr = new DTDAttribute(token.value);
        attlist.attributes.addElement(attr);
        element.attributes.put(token.value, attr);
        Token token2 = scanner.get();
        if (token2.type == Scanner.IDENTIFIER) {
            if (token2.value.equals("NOTATION")) {
                attr.type = parseNotationList();
            } else {
                attr.type = token2.value;
            }
        } else if (token2.type == Scanner.LPAREN) {
            attr.type = parseEnumeration();
        }
        Token token3 = scanner.peek();
        if (token3.type == Scanner.IDENTIFIER) {
            scanner.get();
            if (token3.value.equals("#FIXED")) {
                attr.decl = DTDDecl.FIXED;
                attr.defaultValue = scanner.get().value;
                return;
            } else if (token3.value.equals("#REQUIRED")) {
                attr.decl = DTDDecl.REQUIRED;
                return;
            } else {
                if (token3.value.equals("#IMPLIED")) {
                    attr.decl = DTDDecl.IMPLIED;
                    return;
                }
                throw new DTDParseException(scanner.getUriId(), new StringBuffer().append("Invalid token in attribute declaration: ").append(token3.value).toString(), scanner.getLineNumber(), scanner.getColumn());
            }
        }
        if (token3.type == Scanner.STRING) {
            scanner.get();
            attr.decl = DTDDecl.VALUE;
            attr.defaultValue = token3.value;
        }
    }

    protected DTDNotationList parseNotationList() throws IOException {
        DTDNotationList notation = new DTDNotationList();
        Token token = this.scanner.get();
        if (token.type != Scanner.LPAREN) {
            throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Invalid token in notation: ").append(token.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
        }
        while (true) {
            Token token2 = this.scanner.get();
            if (token2.type != Scanner.IDENTIFIER) {
                throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Invalid token in notation: ").append(token2.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
            }
            notation.add(token2.value);
            Token token3 = this.scanner.peek();
            if (token3.type == Scanner.RPAREN) {
                this.scanner.get();
                return notation;
            }
            if (token3.type != Scanner.PIPE) {
                throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Invalid token in notation: ").append(token3.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
            }
            this.scanner.get();
        }
    }

    protected DTDEnumeration parseEnumeration() throws IOException {
        DTDEnumeration enumeration = new DTDEnumeration();
        while (true) {
            Token token = this.scanner.get();
            if (token.type != Scanner.IDENTIFIER && token.type != Scanner.NMTOKEN) {
                throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Invalid token in enumeration: ").append(token.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
            }
            enumeration.add(token.value);
            Token token2 = this.scanner.peek();
            if (token2.type == Scanner.RPAREN) {
                this.scanner.get();
                return enumeration;
            }
            if (token2.type != Scanner.PIPE) {
                throw new DTDParseException(this.scanner.getUriId(), new StringBuffer().append("Invalid token in enumeration: ").append(token2.type.name).toString(), this.scanner.getLineNumber(), this.scanner.getColumn());
            }
            this.scanner.get();
        }
    }

    protected void parseEntity() throws IOException {
        DTDEntity entity;
        boolean isParsed = false;
        Token name = this.scanner.get();
        if (name.type == Scanner.PERCENT) {
            isParsed = true;
            name = expect(Scanner.IDENTIFIER);
        } else if (name.type != Scanner.IDENTIFIER) {
            throw new DTDParseException(this.scanner.getUriId(), "Invalid entity declaration", this.scanner.getLineNumber(), this.scanner.getColumn());
        }
        DTDEntity entity2 = (DTDEntity) this.dtd.entities.get(name.value);
        boolean skip = false;
        if (entity2 == null) {
            entity = new DTDEntity(name.value, this.defaultLocation);
            this.dtd.entities.put(entity.name, entity);
        } else {
            entity = new DTDEntity(name.value, this.defaultLocation);
            skip = true;
        }
        this.dtd.items.addElement(entity);
        entity.isParsed = isParsed;
        parseEntityDef(entity);
        if (entity.isParsed && entity.value != null && !skip) {
            this.scanner.addEntity(entity.name, entity.value);
        }
    }

    protected void parseEntityDef(DTDEntity entity) throws IOException {
        Token token = this.scanner.get();
        if (token.type == Scanner.STRING) {
            if (entity.value == null) {
                entity.value = token.value;
            }
        } else if (token.type == Scanner.IDENTIFIER) {
            if (token.value.equals("SYSTEM")) {
                DTDSystem sys = new DTDSystem();
                sys.system = expect(Scanner.STRING).value;
                entity.externalID = sys;
            } else if (token.value.equals("PUBLIC")) {
                DTDPublic pub = new DTDPublic();
                pub.pub = expect(Scanner.STRING).value;
                pub.system = expect(Scanner.STRING).value;
                entity.externalID = pub;
            } else {
                throw new DTDParseException(this.scanner.getUriId(), "Invalid External ID specification", this.scanner.getLineNumber(), this.scanner.getColumn());
            }
            if (!entity.isParsed) {
                Token token2 = this.scanner.peek();
                if (token2.type == Scanner.IDENTIFIER) {
                    if (!token2.value.equals("NDATA")) {
                        throw new DTDParseException(this.scanner.getUriId(), "Invalid NData declaration", this.scanner.getLineNumber(), this.scanner.getColumn());
                    }
                    this.scanner.get();
                    entity.ndata = expect(Scanner.IDENTIFIER).value;
                }
            }
        } else {
            throw new DTDParseException(this.scanner.getUriId(), "Invalid entity definition", this.scanner.getLineNumber(), this.scanner.getColumn());
        }
        expect(Scanner.GT);
    }

    protected void parseNotation() throws IOException {
        DTDNotation notation = new DTDNotation();
        notation.name = expect(Scanner.IDENTIFIER).value;
        this.dtd.notations.put(notation.name, notation);
        this.dtd.items.addElement(notation);
        Token token = expect(Scanner.IDENTIFIER);
        if (token.value.equals("SYSTEM")) {
            DTDSystem sys = new DTDSystem();
            sys.system = expect(Scanner.STRING).value;
            notation.externalID = sys;
        } else if (token.value.equals("PUBLIC")) {
            DTDPublic pub = new DTDPublic();
            pub.pub = expect(Scanner.STRING).value;
            pub.system = null;
            if (this.scanner.peek().type == Scanner.STRING) {
                pub.system = this.scanner.get().value;
            }
            notation.externalID = pub;
        }
        expect(Scanner.GT);
    }

    @Override // com.wutka.dtd.EntityExpansion
    public DTDEntity expandEntity(String name) {
        return (DTDEntity) this.dtd.entities.get(name);
    }
}
