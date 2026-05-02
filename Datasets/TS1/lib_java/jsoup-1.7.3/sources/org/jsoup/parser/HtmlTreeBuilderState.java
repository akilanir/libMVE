package org.jsoup.parser;

import java.util.Iterator;
import org.jsoup.helper.DescendableLinkedList;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.DocumentType;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Token;

/* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/HtmlTreeBuilderState.class */
enum HtmlTreeBuilderState {
    Initial { // from class: org.jsoup.parser.HtmlTreeBuilderState.1
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (HtmlTreeBuilderState.isWhitespace(t)) {
                return true;
            }
            if (t.isComment()) {
                tb.insert(t.asComment());
                return true;
            }
            if (t.isDoctype()) {
                Token.Doctype d = t.asDoctype();
                DocumentType doctype = new DocumentType(d.getName(), d.getPublicIdentifier(), d.getSystemIdentifier(), tb.getBaseUri());
                tb.getDocument().appendChild(doctype);
                if (d.isForceQuirks()) {
                    tb.getDocument().quirksMode(Document.QuirksMode.quirks);
                }
                tb.transition(BeforeHtml);
                return true;
            }
            tb.transition(BeforeHtml);
            return tb.process(t);
        }
    },
    BeforeHtml { // from class: org.jsoup.parser.HtmlTreeBuilderState.2
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (t.isDoctype()) {
                tb.error(this);
                return false;
            }
            if (!t.isComment()) {
                if (HtmlTreeBuilderState.isWhitespace(t)) {
                    return true;
                }
                if (t.isStartTag() && t.asStartTag().name().equals("html")) {
                    tb.insert(t.asStartTag());
                    tb.transition(BeforeHead);
                    return true;
                }
                if (t.isEndTag() && StringUtil.in(t.asEndTag().name(), "head", "body", "html", "br")) {
                    return anythingElse(t, tb);
                }
                if (t.isEndTag()) {
                    tb.error(this);
                    return false;
                }
                return anythingElse(t, tb);
            }
            tb.insert(t.asComment());
            return true;
        }

        private boolean anythingElse(Token t, HtmlTreeBuilder tb) {
            tb.insert("html");
            tb.transition(BeforeHead);
            return tb.process(t);
        }
    },
    BeforeHead { // from class: org.jsoup.parser.HtmlTreeBuilderState.3
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (HtmlTreeBuilderState.isWhitespace(t)) {
                return true;
            }
            if (t.isComment()) {
                tb.insert(t.asComment());
                return true;
            }
            if (t.isDoctype()) {
                tb.error(this);
                return false;
            }
            if (t.isStartTag() && t.asStartTag().name().equals("html")) {
                return InBody.process(t, tb);
            }
            if (t.isStartTag() && t.asStartTag().name().equals("head")) {
                Element head = tb.insert(t.asStartTag());
                tb.setHeadElement(head);
                tb.transition(InHead);
                return true;
            }
            if (t.isEndTag() && StringUtil.in(t.asEndTag().name(), "head", "body", "html", "br")) {
                tb.process(new Token.StartTag("head"));
                return tb.process(t);
            }
            if (t.isEndTag()) {
                tb.error(this);
                return false;
            }
            tb.process(new Token.StartTag("head"));
            return tb.process(t);
        }
    },
    InHead { // from class: org.jsoup.parser.HtmlTreeBuilderState.4
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (HtmlTreeBuilderState.isWhitespace(t)) {
                tb.insert(t.asCharacter());
                return true;
            }
            switch (t.type) {
                case Comment:
                    tb.insert(t.asComment());
                    break;
                case Doctype:
                    tb.error(this);
                    break;
                case StartTag:
                    Token.StartTag start = t.asStartTag();
                    String name = start.name();
                    if (!name.equals("html")) {
                        if (!StringUtil.in(name, "base", "basefont", "bgsound", "command", "link")) {
                            if (!name.equals("meta")) {
                                if (name.equals("title")) {
                                    HtmlTreeBuilderState.handleRcData(start, tb);
                                    break;
                                } else if (StringUtil.in(name, "noframes", "style")) {
                                    HtmlTreeBuilderState.handleRawtext(start, tb);
                                    break;
                                } else if (name.equals("noscript")) {
                                    tb.insert(start);
                                    tb.transition(InHeadNoscript);
                                    break;
                                } else if (name.equals("script")) {
                                    tb.tokeniser.transition(TokeniserState.ScriptData);
                                    tb.markInsertionMode();
                                    tb.transition(Text);
                                    tb.insert(start);
                                    break;
                                } else if (!name.equals("head")) {
                                    break;
                                } else {
                                    tb.error(this);
                                    break;
                                }
                            } else {
                                tb.insertEmpty(start);
                                break;
                            }
                        } else {
                            Element el = tb.insertEmpty(start);
                            if (name.equals("base") && el.hasAttr("href")) {
                                tb.maybeSetBaseUri(el);
                                break;
                            }
                        }
                    } else {
                        break;
                    }
                    break;
                case EndTag:
                    Token.EndTag end = t.asEndTag();
                    String name2 = end.name();
                    if (name2.equals("head")) {
                        tb.pop();
                        tb.transition(AfterHead);
                        break;
                    } else if (!StringUtil.in(name2, "body", "html", "br")) {
                        tb.error(this);
                        break;
                    } else {
                        break;
                    }
            }
            return true;
        }

        private boolean anythingElse(Token t, TreeBuilder tb) {
            tb.process(new Token.EndTag("head"));
            return tb.process(t);
        }
    },
    InHeadNoscript { // from class: org.jsoup.parser.HtmlTreeBuilderState.5
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (t.isDoctype()) {
                tb.error(this);
                return true;
            }
            if (t.isStartTag() && t.asStartTag().name().equals("html")) {
                return tb.process(t, InBody);
            }
            if (!t.isEndTag() || !t.asEndTag().name().equals("noscript")) {
                if (HtmlTreeBuilderState.isWhitespace(t) || t.isComment() || (t.isStartTag() && StringUtil.in(t.asStartTag().name(), "basefont", "bgsound", "link", "meta", "noframes", "style"))) {
                    return tb.process(t, InHead);
                }
                if (t.isEndTag() && t.asEndTag().name().equals("br")) {
                    return anythingElse(t, tb);
                }
                if ((t.isStartTag() && StringUtil.in(t.asStartTag().name(), "head", "noscript")) || t.isEndTag()) {
                    tb.error(this);
                    return false;
                }
                return anythingElse(t, tb);
            }
            tb.pop();
            tb.transition(InHead);
            return true;
        }

        private boolean anythingElse(Token t, HtmlTreeBuilder tb) {
            tb.error(this);
            tb.process(new Token.EndTag("noscript"));
            return tb.process(t);
        }
    },
    AfterHead { // from class: org.jsoup.parser.HtmlTreeBuilderState.6
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (HtmlTreeBuilderState.isWhitespace(t)) {
                tb.insert(t.asCharacter());
                return true;
            }
            if (t.isComment()) {
                tb.insert(t.asComment());
                return true;
            }
            if (t.isDoctype()) {
                tb.error(this);
                return true;
            }
            if (!t.isStartTag()) {
                if (!t.isEndTag()) {
                    anythingElse(t, tb);
                    return true;
                }
                if (StringUtil.in(t.asEndTag().name(), "body", "html")) {
                    anythingElse(t, tb);
                    return true;
                }
                tb.error(this);
                return false;
            }
            Token.StartTag startTag = t.asStartTag();
            String name = startTag.name();
            if (name.equals("html")) {
                return tb.process(t, InBody);
            }
            if (name.equals("body")) {
                tb.insert(startTag);
                tb.framesetOk(false);
                tb.transition(InBody);
                return true;
            }
            if (name.equals("frameset")) {
                tb.insert(startTag);
                tb.transition(InFrameset);
                return true;
            }
            if (!StringUtil.in(name, "base", "basefont", "bgsound", "link", "meta", "noframes", "script", "style", "title")) {
                if (name.equals("head")) {
                    tb.error(this);
                    return false;
                }
                anythingElse(t, tb);
                return true;
            }
            tb.error(this);
            Element head = tb.getHeadElement();
            tb.push(head);
            tb.process(t, InHead);
            tb.removeFromStack(head);
            return true;
        }

        private boolean anythingElse(Token t, HtmlTreeBuilder tb) {
            tb.process(new Token.StartTag("body"));
            tb.framesetOk(true);
            return tb.process(t);
        }
    },
    InBody { // from class: org.jsoup.parser.HtmlTreeBuilderState.7
        /* JADX WARN: Removed duplicated region for block: B:412:0x0c74  */
        /* JADX WARN: Removed duplicated region for block: B:416:0x0c8a  */
        /* JADX WARN: Removed duplicated region for block: B:423:0x0ce8 A[LOOP:9: B:421:0x0ce1->B:423:0x0ce8, LOOP_END] */
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        boolean process(org.jsoup.parser.Token r7, org.jsoup.parser.HtmlTreeBuilder r8) {
            /*
                Method dump skipped, instructions count: 3476
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: org.jsoup.parser.HtmlTreeBuilderState.AnonymousClass7.process(org.jsoup.parser.Token, org.jsoup.parser.HtmlTreeBuilder):boolean");
        }

        boolean anyOtherEndTag(Token t, HtmlTreeBuilder tb) {
            String name = t.asEndTag().name();
            DescendableLinkedList<Element> stack = tb.getStack();
            Iterator<Element> it = stack.descendingIterator();
            while (it.hasNext()) {
                Element node = it.next();
                if (node.nodeName().equals(name)) {
                    tb.generateImpliedEndTags(name);
                    if (!name.equals(tb.currentElement().nodeName())) {
                        tb.error(this);
                    }
                    tb.popStackToClose(name);
                    return true;
                }
                if (tb.isSpecial(node)) {
                    tb.error(this);
                    return false;
                }
            }
            return true;
        }
    },
    Text { // from class: org.jsoup.parser.HtmlTreeBuilderState.8
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (t.isCharacter()) {
                tb.insert(t.asCharacter());
                return true;
            }
            if (t.isEOF()) {
                tb.error(this);
                tb.pop();
                tb.transition(tb.originalState());
                return tb.process(t);
            }
            if (t.isEndTag()) {
                tb.pop();
                tb.transition(tb.originalState());
                return true;
            }
            return true;
        }
    },
    InTable { // from class: org.jsoup.parser.HtmlTreeBuilderState.9
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (t.isCharacter()) {
                tb.newPendingTableCharacters();
                tb.markInsertionMode();
                tb.transition(InTableText);
                return tb.process(t);
            }
            if (t.isComment()) {
                tb.insert(t.asComment());
                return true;
            }
            if (t.isDoctype()) {
                tb.error(this);
                return false;
            }
            if (t.isStartTag()) {
                Token.StartTag startTag = t.asStartTag();
                String name = startTag.name();
                if (name.equals("caption")) {
                    tb.clearStackToTableContext();
                    tb.insertMarkerToFormattingElements();
                    tb.insert(startTag);
                    tb.transition(InCaption);
                    return true;
                }
                if (name.equals("colgroup")) {
                    tb.clearStackToTableContext();
                    tb.insert(startTag);
                    tb.transition(InColumnGroup);
                    return true;
                }
                if (name.equals("col")) {
                    tb.process(new Token.StartTag("colgroup"));
                    return tb.process(t);
                }
                if (StringUtil.in(name, "tbody", "tfoot", "thead")) {
                    tb.clearStackToTableContext();
                    tb.insert(startTag);
                    tb.transition(InTableBody);
                    return true;
                }
                if (StringUtil.in(name, "td", "th", "tr")) {
                    tb.process(new Token.StartTag("tbody"));
                    return tb.process(t);
                }
                if (name.equals("table")) {
                    tb.error(this);
                    boolean processed = tb.process(new Token.EndTag("table"));
                    if (processed) {
                        return tb.process(t);
                    }
                    return true;
                }
                if (StringUtil.in(name, "style", "script")) {
                    return tb.process(t, InHead);
                }
                if (name.equals("input")) {
                    if (!startTag.attributes.get("type").equalsIgnoreCase("hidden")) {
                        return anythingElse(t, tb);
                    }
                    tb.insertEmpty(startTag);
                    return true;
                }
                if (name.equals("form")) {
                    tb.error(this);
                    if (tb.getFormElement() != null) {
                        return false;
                    }
                    tb.insertForm(startTag, false);
                    return true;
                }
                return anythingElse(t, tb);
            }
            if (t.isEndTag()) {
                Token.EndTag endTag = t.asEndTag();
                String name2 = endTag.name();
                if (name2.equals("table")) {
                    if (!tb.inTableScope(name2)) {
                        tb.error(this);
                        return false;
                    }
                    tb.popStackToClose("table");
                    tb.resetInsertionMode();
                    return true;
                }
                if (StringUtil.in(name2, "body", "caption", "col", "colgroup", "html", "tbody", "td", "tfoot", "th", "thead", "tr")) {
                    tb.error(this);
                    return false;
                }
                return anythingElse(t, tb);
            }
            if (t.isEOF()) {
                if (tb.currentElement().nodeName().equals("html")) {
                    tb.error(this);
                    return true;
                }
                return true;
            }
            return anythingElse(t, tb);
        }

        boolean anythingElse(Token t, HtmlTreeBuilder tb) {
            boolean processed;
            tb.error(this);
            if (StringUtil.in(tb.currentElement().nodeName(), "table", "tbody", "tfoot", "thead", "tr")) {
                tb.setFosterInserts(true);
                processed = tb.process(t, InBody);
                tb.setFosterInserts(false);
            } else {
                processed = tb.process(t, InBody);
            }
            return processed;
        }
    },
    InTableText { // from class: org.jsoup.parser.HtmlTreeBuilderState.10
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            switch (AnonymousClass24.$SwitchMap$org$jsoup$parser$Token$TokenType[t.type.ordinal()]) {
                case 5:
                    Token.Character c = t.asCharacter();
                    if (c.getData().equals(HtmlTreeBuilderState.nullString)) {
                        tb.error(this);
                        return false;
                    }
                    tb.getPendingTableCharacters().add(c);
                    return true;
                default:
                    if (tb.getPendingTableCharacters().size() > 0) {
                        for (Token.Character character : tb.getPendingTableCharacters()) {
                            if (!HtmlTreeBuilderState.isWhitespace(character)) {
                                tb.error(this);
                                if (StringUtil.in(tb.currentElement().nodeName(), "table", "tbody", "tfoot", "thead", "tr")) {
                                    tb.setFosterInserts(true);
                                    tb.process(character, InBody);
                                    tb.setFosterInserts(false);
                                } else {
                                    tb.process(character, InBody);
                                }
                            } else {
                                tb.insert(character);
                            }
                        }
                        tb.newPendingTableCharacters();
                    }
                    tb.transition(tb.originalState());
                    return tb.process(t);
            }
        }
    },
    InCaption { // from class: org.jsoup.parser.HtmlTreeBuilderState.11
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (t.isEndTag() && t.asEndTag().name().equals("caption")) {
                Token.EndTag endTag = t.asEndTag();
                String name = endTag.name();
                if (!tb.inTableScope(name)) {
                    tb.error(this);
                    return false;
                }
                tb.generateImpliedEndTags();
                if (!tb.currentElement().nodeName().equals("caption")) {
                    tb.error(this);
                }
                tb.popStackToClose("caption");
                tb.clearFormattingElementsToLastMarker();
                tb.transition(InTable);
                return true;
            }
            if ((t.isStartTag() && StringUtil.in(t.asStartTag().name(), "caption", "col", "colgroup", "tbody", "td", "tfoot", "th", "thead", "tr")) || (t.isEndTag() && t.asEndTag().name().equals("table"))) {
                tb.error(this);
                boolean processed = tb.process(new Token.EndTag("caption"));
                if (processed) {
                    return tb.process(t);
                }
                return true;
            }
            if (t.isEndTag() && StringUtil.in(t.asEndTag().name(), "body", "col", "colgroup", "html", "tbody", "td", "tfoot", "th", "thead", "tr")) {
                tb.error(this);
                return false;
            }
            return tb.process(t, InBody);
        }
    },
    InColumnGroup { // from class: org.jsoup.parser.HtmlTreeBuilderState.12
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (HtmlTreeBuilderState.isWhitespace(t)) {
                tb.insert(t.asCharacter());
                return true;
            }
            switch (AnonymousClass24.$SwitchMap$org$jsoup$parser$Token$TokenType[t.type.ordinal()]) {
                case 1:
                    tb.insert(t.asComment());
                    break;
                case 2:
                    tb.error(this);
                    break;
                case 3:
                    Token.StartTag startTag = t.asStartTag();
                    String name = startTag.name();
                    if (!name.equals("html")) {
                        if (!name.equals("col")) {
                            break;
                        } else {
                            tb.insertEmpty(startTag);
                            break;
                        }
                    } else {
                        break;
                    }
                case 4:
                    Token.EndTag endTag = t.asEndTag();
                    if (!endTag.name().equals("colgroup")) {
                        break;
                    } else if (tb.currentElement().nodeName().equals("html")) {
                        tb.error(this);
                        break;
                    } else {
                        tb.pop();
                        tb.transition(InTable);
                        break;
                    }
                case 6:
                    if (!tb.currentElement().nodeName().equals("html")) {
                        break;
                    }
                    break;
            }
            return true;
        }

        private boolean anythingElse(Token t, TreeBuilder tb) {
            boolean processed = tb.process(new Token.EndTag("colgroup"));
            if (processed) {
                return tb.process(t);
            }
            return true;
        }
    },
    InTableBody { // from class: org.jsoup.parser.HtmlTreeBuilderState.13
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            switch (AnonymousClass24.$SwitchMap$org$jsoup$parser$Token$TokenType[t.type.ordinal()]) {
                case 3:
                    Token.StartTag startTag = t.asStartTag();
                    String name = startTag.name();
                    if (name.equals("tr")) {
                        tb.clearStackToTableBodyContext();
                        tb.insert(startTag);
                        tb.transition(InRow);
                        return true;
                    }
                    if (StringUtil.in(name, "th", "td")) {
                        tb.error(this);
                        tb.process(new Token.StartTag("tr"));
                        return tb.process(startTag);
                    }
                    if (StringUtil.in(name, "caption", "col", "colgroup", "tbody", "tfoot", "thead")) {
                        return exitTableBody(t, tb);
                    }
                    return anythingElse(t, tb);
                case 4:
                    Token.EndTag endTag = t.asEndTag();
                    String name2 = endTag.name();
                    if (StringUtil.in(name2, "tbody", "tfoot", "thead")) {
                        if (!tb.inTableScope(name2)) {
                            tb.error(this);
                            return false;
                        }
                        tb.clearStackToTableBodyContext();
                        tb.pop();
                        tb.transition(InTable);
                        return true;
                    }
                    if (name2.equals("table")) {
                        return exitTableBody(t, tb);
                    }
                    if (StringUtil.in(name2, "body", "caption", "col", "colgroup", "html", "td", "th", "tr")) {
                        tb.error(this);
                        return false;
                    }
                    return anythingElse(t, tb);
                default:
                    return anythingElse(t, tb);
            }
        }

        private boolean exitTableBody(Token t, HtmlTreeBuilder tb) {
            if (!tb.inTableScope("tbody") && !tb.inTableScope("thead") && !tb.inScope("tfoot")) {
                tb.error(this);
                return false;
            }
            tb.clearStackToTableBodyContext();
            tb.process(new Token.EndTag(tb.currentElement().nodeName()));
            return tb.process(t);
        }

        private boolean anythingElse(Token t, HtmlTreeBuilder tb) {
            return tb.process(t, InTable);
        }
    },
    InRow { // from class: org.jsoup.parser.HtmlTreeBuilderState.14
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (t.isStartTag()) {
                Token.StartTag startTag = t.asStartTag();
                String name = startTag.name();
                if (StringUtil.in(name, "th", "td")) {
                    tb.clearStackToTableRowContext();
                    tb.insert(startTag);
                    tb.transition(InCell);
                    tb.insertMarkerToFormattingElements();
                    return true;
                }
                if (StringUtil.in(name, "caption", "col", "colgroup", "tbody", "tfoot", "thead", "tr")) {
                    return handleMissingTr(t, tb);
                }
                return anythingElse(t, tb);
            }
            if (t.isEndTag()) {
                Token.EndTag endTag = t.asEndTag();
                String name2 = endTag.name();
                if (name2.equals("tr")) {
                    if (!tb.inTableScope(name2)) {
                        tb.error(this);
                        return false;
                    }
                    tb.clearStackToTableRowContext();
                    tb.pop();
                    tb.transition(InTableBody);
                    return true;
                }
                if (name2.equals("table")) {
                    return handleMissingTr(t, tb);
                }
                if (StringUtil.in(name2, "tbody", "tfoot", "thead")) {
                    if (!tb.inTableScope(name2)) {
                        tb.error(this);
                        return false;
                    }
                    tb.process(new Token.EndTag("tr"));
                    return tb.process(t);
                }
                if (StringUtil.in(name2, "body", "caption", "col", "colgroup", "html", "td", "th")) {
                    tb.error(this);
                    return false;
                }
                return anythingElse(t, tb);
            }
            return anythingElse(t, tb);
        }

        private boolean anythingElse(Token t, HtmlTreeBuilder tb) {
            return tb.process(t, InTable);
        }

        private boolean handleMissingTr(Token t, TreeBuilder tb) {
            boolean processed = tb.process(new Token.EndTag("tr"));
            if (processed) {
                return tb.process(t);
            }
            return false;
        }
    },
    InCell { // from class: org.jsoup.parser.HtmlTreeBuilderState.15
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (!t.isEndTag()) {
                if (t.isStartTag() && StringUtil.in(t.asStartTag().name(), "caption", "col", "colgroup", "tbody", "td", "tfoot", "th", "thead", "tr")) {
                    if (!tb.inTableScope("td") && !tb.inTableScope("th")) {
                        tb.error(this);
                        return false;
                    }
                    closeCell(tb);
                    return tb.process(t);
                }
                return anythingElse(t, tb);
            }
            Token.EndTag endTag = t.asEndTag();
            String name = endTag.name();
            if (StringUtil.in(name, "td", "th")) {
                if (!tb.inTableScope(name)) {
                    tb.error(this);
                    tb.transition(InRow);
                    return false;
                }
                tb.generateImpliedEndTags();
                if (!tb.currentElement().nodeName().equals(name)) {
                    tb.error(this);
                }
                tb.popStackToClose(name);
                tb.clearFormattingElementsToLastMarker();
                tb.transition(InRow);
                return true;
            }
            if (StringUtil.in(name, "body", "caption", "col", "colgroup", "html")) {
                tb.error(this);
                return false;
            }
            if (StringUtil.in(name, "table", "tbody", "tfoot", "thead", "tr")) {
                if (!tb.inTableScope(name)) {
                    tb.error(this);
                    return false;
                }
                closeCell(tb);
                return tb.process(t);
            }
            return anythingElse(t, tb);
        }

        private boolean anythingElse(Token t, HtmlTreeBuilder tb) {
            return tb.process(t, InBody);
        }

        private void closeCell(HtmlTreeBuilder tb) {
            if (tb.inTableScope("td")) {
                tb.process(new Token.EndTag("td"));
            } else {
                tb.process(new Token.EndTag("th"));
            }
        }
    },
    InSelect { // from class: org.jsoup.parser.HtmlTreeBuilderState.16
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            switch (AnonymousClass24.$SwitchMap$org$jsoup$parser$Token$TokenType[t.type.ordinal()]) {
                case 1:
                    tb.insert(t.asComment());
                    return true;
                case 2:
                    tb.error(this);
                    return false;
                case 3:
                    Token.StartTag start = t.asStartTag();
                    String name = start.name();
                    if (name.equals("html")) {
                        return tb.process(start, InBody);
                    }
                    if (name.equals("option")) {
                        tb.process(new Token.EndTag("option"));
                        tb.insert(start);
                        return true;
                    }
                    if (name.equals("optgroup")) {
                        if (tb.currentElement().nodeName().equals("option")) {
                            tb.process(new Token.EndTag("option"));
                        } else if (tb.currentElement().nodeName().equals("optgroup")) {
                            tb.process(new Token.EndTag("optgroup"));
                        }
                        tb.insert(start);
                        return true;
                    }
                    if (name.equals("select")) {
                        tb.error(this);
                        return tb.process(new Token.EndTag("select"));
                    }
                    if (StringUtil.in(name, "input", "keygen", "textarea")) {
                        tb.error(this);
                        if (!tb.inSelectScope("select")) {
                            return false;
                        }
                        tb.process(new Token.EndTag("select"));
                        return tb.process(start);
                    }
                    if (name.equals("script")) {
                        return tb.process(t, InHead);
                    }
                    return anythingElse(t, tb);
                case 4:
                    Token.EndTag end = t.asEndTag();
                    String name2 = end.name();
                    if (name2.equals("optgroup")) {
                        if (tb.currentElement().nodeName().equals("option") && tb.aboveOnStack(tb.currentElement()) != null && tb.aboveOnStack(tb.currentElement()).nodeName().equals("optgroup")) {
                            tb.process(new Token.EndTag("option"));
                        }
                        if (tb.currentElement().nodeName().equals("optgroup")) {
                            tb.pop();
                            return true;
                        }
                        tb.error(this);
                        return true;
                    }
                    if (name2.equals("option")) {
                        if (tb.currentElement().nodeName().equals("option")) {
                            tb.pop();
                            return true;
                        }
                        tb.error(this);
                        return true;
                    }
                    if (name2.equals("select")) {
                        if (!tb.inSelectScope(name2)) {
                            tb.error(this);
                            return false;
                        }
                        tb.popStackToClose(name2);
                        tb.resetInsertionMode();
                        return true;
                    }
                    return anythingElse(t, tb);
                case 5:
                    Token.Character c = t.asCharacter();
                    if (c.getData().equals(HtmlTreeBuilderState.nullString)) {
                        tb.error(this);
                        return false;
                    }
                    tb.insert(c);
                    return true;
                case 6:
                    if (!tb.currentElement().nodeName().equals("html")) {
                        tb.error(this);
                        return true;
                    }
                    return true;
                default:
                    return anythingElse(t, tb);
            }
        }

        private boolean anythingElse(Token t, HtmlTreeBuilder tb) {
            tb.error(this);
            return false;
        }
    },
    InSelectInTable { // from class: org.jsoup.parser.HtmlTreeBuilderState.17
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (t.isStartTag() && StringUtil.in(t.asStartTag().name(), "caption", "table", "tbody", "tfoot", "thead", "tr", "td", "th")) {
                tb.error(this);
                tb.process(new Token.EndTag("select"));
                return tb.process(t);
            }
            if (t.isEndTag() && StringUtil.in(t.asEndTag().name(), "caption", "table", "tbody", "tfoot", "thead", "tr", "td", "th")) {
                tb.error(this);
                if (tb.inTableScope(t.asEndTag().name())) {
                    tb.process(new Token.EndTag("select"));
                    return tb.process(t);
                }
                return false;
            }
            return tb.process(t, InSelect);
        }
    },
    AfterBody { // from class: org.jsoup.parser.HtmlTreeBuilderState.18
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (HtmlTreeBuilderState.isWhitespace(t)) {
                return tb.process(t, InBody);
            }
            if (t.isComment()) {
                tb.insert(t.asComment());
                return true;
            }
            if (t.isDoctype()) {
                tb.error(this);
                return false;
            }
            if (t.isStartTag() && t.asStartTag().name().equals("html")) {
                return tb.process(t, InBody);
            }
            if (t.isEndTag() && t.asEndTag().name().equals("html")) {
                if (tb.isFragmentParsing()) {
                    tb.error(this);
                    return false;
                }
                tb.transition(AfterAfterBody);
                return true;
            }
            if (!t.isEOF()) {
                tb.error(this);
                tb.transition(InBody);
                return tb.process(t);
            }
            return true;
        }
    },
    InFrameset { // from class: org.jsoup.parser.HtmlTreeBuilderState.19
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (HtmlTreeBuilderState.isWhitespace(t)) {
                tb.insert(t.asCharacter());
                return true;
            }
            if (t.isComment()) {
                tb.insert(t.asComment());
                return true;
            }
            if (t.isDoctype()) {
                tb.error(this);
                return false;
            }
            if (t.isStartTag()) {
                Token.StartTag start = t.asStartTag();
                String name = start.name();
                if (name.equals("html")) {
                    return tb.process(start, InBody);
                }
                if (name.equals("frameset")) {
                    tb.insert(start);
                    return true;
                }
                if (name.equals("frame")) {
                    tb.insertEmpty(start);
                    return true;
                }
                if (name.equals("noframes")) {
                    return tb.process(start, InHead);
                }
                tb.error(this);
                return false;
            }
            if (t.isEndTag() && t.asEndTag().name().equals("frameset")) {
                if (tb.currentElement().nodeName().equals("html")) {
                    tb.error(this);
                    return false;
                }
                tb.pop();
                if (!tb.isFragmentParsing() && !tb.currentElement().nodeName().equals("frameset")) {
                    tb.transition(AfterFrameset);
                    return true;
                }
                return true;
            }
            if (t.isEOF()) {
                if (!tb.currentElement().nodeName().equals("html")) {
                    tb.error(this);
                    return true;
                }
                return true;
            }
            tb.error(this);
            return false;
        }
    },
    AfterFrameset { // from class: org.jsoup.parser.HtmlTreeBuilderState.20
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (HtmlTreeBuilderState.isWhitespace(t)) {
                tb.insert(t.asCharacter());
                return true;
            }
            if (t.isComment()) {
                tb.insert(t.asComment());
                return true;
            }
            if (t.isDoctype()) {
                tb.error(this);
                return false;
            }
            if (t.isStartTag() && t.asStartTag().name().equals("html")) {
                return tb.process(t, InBody);
            }
            if (t.isEndTag() && t.asEndTag().name().equals("html")) {
                tb.transition(AfterAfterFrameset);
                return true;
            }
            if (t.isStartTag() && t.asStartTag().name().equals("noframes")) {
                return tb.process(t, InHead);
            }
            if (!t.isEOF()) {
                tb.error(this);
                return false;
            }
            return true;
        }
    },
    AfterAfterBody { // from class: org.jsoup.parser.HtmlTreeBuilderState.21
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (t.isComment()) {
                tb.insert(t.asComment());
                return true;
            }
            if (t.isDoctype() || HtmlTreeBuilderState.isWhitespace(t) || (t.isStartTag() && t.asStartTag().name().equals("html"))) {
                return tb.process(t, InBody);
            }
            if (!t.isEOF()) {
                tb.error(this);
                tb.transition(InBody);
                return tb.process(t);
            }
            return true;
        }
    },
    AfterAfterFrameset { // from class: org.jsoup.parser.HtmlTreeBuilderState.22
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            if (t.isComment()) {
                tb.insert(t.asComment());
                return true;
            }
            if (t.isDoctype() || HtmlTreeBuilderState.isWhitespace(t) || (t.isStartTag() && t.asStartTag().name().equals("html"))) {
                return tb.process(t, InBody);
            }
            if (!t.isEOF()) {
                if (t.isStartTag() && t.asStartTag().name().equals("noframes")) {
                    return tb.process(t, InHead);
                }
                tb.error(this);
                return false;
            }
            return true;
        }
    },
    ForeignContent { // from class: org.jsoup.parser.HtmlTreeBuilderState.23
        @Override // org.jsoup.parser.HtmlTreeBuilderState
        boolean process(Token t, HtmlTreeBuilder tb) {
            return true;
        }
    };

    private static String nullString = String.valueOf((char) 0);

    abstract boolean process(Token token, HtmlTreeBuilder htmlTreeBuilder);

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isWhitespace(Token t) {
        if (t.isCharacter()) {
            String data = t.asCharacter().getData();
            for (int i = 0; i < data.length(); i++) {
                char c = data.charAt(i);
                if (!StringUtil.isWhitespace(c)) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void handleRcData(Token.StartTag startTag, HtmlTreeBuilder tb) {
        tb.insert(startTag);
        tb.tokeniser.transition(TokeniserState.Rcdata);
        tb.markInsertionMode();
        tb.transition(Text);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void handleRawtext(Token.StartTag startTag, HtmlTreeBuilder tb) {
        tb.insert(startTag);
        tb.tokeniser.transition(TokeniserState.Rawtext);
        tb.markInsertionMode();
        tb.transition(Text);
    }

    /* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/HtmlTreeBuilderState$Constants.class */
    private static final class Constants {
        private static final String[] InBodyStartToHead = {"base", "basefont", "bgsound", "command", "link", "meta", "noframes", "script", "style", "title"};
        private static final String[] InBodyStartPClosers = {"address", "article", "aside", "blockquote", "center", "details", "dir", "div", "dl", "fieldset", "figcaption", "figure", "footer", "header", "hgroup", "menu", "nav", "ol", "p", "section", "summary", "ul"};
        private static final String[] Headings = {"h1", "h2", "h3", "h4", "h5", "h6"};
        private static final String[] InBodyStartPreListing = {"pre", "listing"};
        private static final String[] InBodyStartLiBreakers = {"address", "div", "p"};
        private static final String[] DdDt = {"dd", "dt"};
        private static final String[] Formatters = {"b", "big", "code", "em", "font", "i", "s", "small", "strike", "strong", "tt", "u"};
        private static final String[] InBodyStartApplets = {"applet", "marquee", "object"};
        private static final String[] InBodyStartEmptyFormatters = {"area", "br", "embed", "img", "keygen", "wbr"};
        private static final String[] InBodyStartMedia = {"param", "source", "track"};
        private static final String[] InBodyStartInputAttribs = {"name", "action", "prompt"};
        private static final String[] InBodyStartOptions = {"optgroup", "option"};
        private static final String[] InBodyStartRuby = {"rp", "rt"};
        private static final String[] InBodyStartDrop = {"caption", "col", "colgroup", "frame", "head", "tbody", "td", "tfoot", "th", "thead", "tr"};
        private static final String[] InBodyEndClosers = {"address", "article", "aside", "blockquote", "button", "center", "details", "dir", "div", "dl", "fieldset", "figcaption", "figure", "footer", "header", "hgroup", "listing", "menu", "nav", "ol", "pre", "section", "summary", "ul"};
        private static final String[] InBodyEndAdoptionFormatters = {"a", "b", "big", "code", "em", "font", "i", "nobr", "s", "small", "strike", "strong", "tt", "u"};
        private static final String[] InBodyEndTableFosters = {"table", "tbody", "tfoot", "thead", "tr"};

        private Constants() {
        }
    }
}
