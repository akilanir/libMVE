package freemarker.core;

import freemarker.template.utility.StringUtil;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/TextBlock.class */
public final class TextBlock extends TemplateElement {
    private static final char[] EMPTY_CHAR_ARRAY = new char[0];
    static final TextBlock EMPTY_BLOCK = new TextBlock(EMPTY_CHAR_ARRAY, false);
    private char[] text;
    private final boolean unparsed;

    public TextBlock(String text) {
        this(text, false);
    }

    public TextBlock(String text, boolean unparsed) {
        this(text.toCharArray(), unparsed);
    }

    private TextBlock(char[] text, boolean unparsed) {
        this.text = text;
        this.unparsed = unparsed;
    }

    @Override // freemarker.core.TemplateElement
    public void accept(Environment env) throws IOException {
        env.getOut().write(this.text);
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        if (canonical) {
            String text = new String(this.text);
            if (this.unparsed) {
                return new StringBuffer().append("<#noparse>").append(text).append("</#noparse>").toString();
            }
            return text;
        }
        return new StringBuffer().append("text ").append(StringUtil.jQuote(new String(this.text))).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#text";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 1;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return new String(this.text);
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return ParameterRole.CONTENT;
    }

    @Override // freemarker.core.TemplateElement
    TemplateElement postParseCleanup(boolean stripWhitespace) {
        if (this.text.length == 0) {
            return this;
        }
        int openingCharsToStrip = 0;
        int trailingCharsToStrip = 0;
        boolean deliberateLeftTrim = deliberateLeftTrim();
        boolean deliberateRightTrim = deliberateRightTrim();
        if (!stripWhitespace || this.text.length == 0) {
            return this;
        }
        if (this.parent.parent == null && previousSibling() == null) {
            return this;
        }
        if (!deliberateLeftTrim) {
            trailingCharsToStrip = trailingCharsToStrip();
        }
        if (!deliberateRightTrim) {
            openingCharsToStrip = openingCharsToStrip();
        }
        if (openingCharsToStrip == 0 && trailingCharsToStrip == 0) {
            return this;
        }
        this.text = substring(this.text, openingCharsToStrip, this.text.length - trailingCharsToStrip);
        if (openingCharsToStrip > 0) {
            this.beginLine++;
            this.beginColumn = 1;
        }
        if (trailingCharsToStrip > 0) {
            this.endColumn = 0;
        }
        return this;
    }

    private boolean deliberateLeftTrim() {
        boolean result = false;
        TemplateElement nextTerminalNode = nextTerminalNode();
        while (true) {
            TemplateElement elem = nextTerminalNode;
            if (elem == null || elem.beginLine != this.endLine) {
                break;
            }
            if (elem instanceof TrimInstruction) {
                TrimInstruction ti = (TrimInstruction) elem;
                if (!ti.left && !ti.right) {
                    result = true;
                }
                if (ti.left) {
                    result = true;
                    int lastNewLineIndex = lastNewLineIndex();
                    if (lastNewLineIndex >= 0 || this.beginColumn == 1) {
                        char[] firstPart = substring(this.text, 0, lastNewLineIndex + 1);
                        char[] lastLine = substring(this.text, 1 + lastNewLineIndex);
                        if (trim(lastLine).length == 0) {
                            this.text = firstPart;
                            this.endColumn = 0;
                        } else {
                            int i = 0;
                            while (Character.isWhitespace(lastLine[i])) {
                                i++;
                            }
                            char[] printablePart = substring(lastLine, i);
                            this.text = concat(firstPart, printablePart);
                        }
                    }
                }
            }
            nextTerminalNode = elem.nextTerminalNode();
        }
        if (result) {
        }
        return result;
    }

    /* JADX WARN: Code restructure failed: missing block: B:56:0x0140, code lost:
    
        return r6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean deliberateRightTrim() {
        /*
            Method dump skipped, instructions count: 321
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.core.TextBlock.deliberateRightTrim():boolean");
    }

    private int firstNewLineIndex() {
        String content = new String(this.text);
        int newlineIndex1 = content.indexOf(10);
        int newlineIndex2 = content.indexOf(13);
        int result = newlineIndex1 >= 0 ? newlineIndex1 : newlineIndex2;
        if (newlineIndex1 >= 0 && newlineIndex2 >= 0) {
            result = Math.min(newlineIndex1, newlineIndex2);
        }
        return result;
    }

    private int lastNewLineIndex() {
        String content = new String(this.text);
        return Math.max(content.lastIndexOf(13), content.lastIndexOf(10));
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x0080, code lost:
    
        return r5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int openingCharsToStrip() {
        /*
            r4 = this;
            r0 = r4
            int r0 = r0.firstNewLineIndex()
            r5 = r0
            r0 = r5
            r1 = -1
            if (r0 != r1) goto L14
            r0 = r4
            int r0 = r0.beginColumn
            r1 = 1
            if (r0 == r1) goto L14
            r0 = 0
            return r0
        L14:
            int r5 = r5 + 1
            r0 = r4
            char[] r0 = r0.text
            int r0 = r0.length
            r1 = r5
            if (r0 <= r1) goto L3f
            r0 = r5
            if (r0 <= 0) goto L3f
            r0 = r4
            char[] r0 = r0.text
            r1 = r5
            r2 = 1
            int r1 = r1 - r2
            char r0 = r0[r1]
            r1 = 13
            if (r0 != r1) goto L3f
            r0 = r4
            char[] r0 = r0.text
            r1 = r5
            char r0 = r0[r1]
            r1 = 10
            if (r0 != r1) goto L3f
            int r5 = r5 + 1
        L3f:
            java.lang.String r0 = new java.lang.String
            r1 = r0
            r2 = r4
            char[] r2 = r2.text
            r1.<init>(r2)
            r1 = 0
            r2 = r5
            java.lang.String r0 = r0.substring(r1, r2)
            java.lang.String r0 = r0.trim()
            int r0 = r0.length()
            if (r0 <= 0) goto L5a
            r0 = 0
            return r0
        L5a:
            r0 = r4
            freemarker.core.TemplateElement r0 = r0.prevTerminalNode()
            r6 = r0
        L5f:
            r0 = r6
            if (r0 == 0) goto L7f
            r0 = r6
            int r0 = r0.endLine
            r1 = r4
            int r1 = r1.beginLine
            if (r0 != r1) goto L7f
            r0 = r6
            boolean r0 = r0.heedsOpeningWhitespace()
            if (r0 == 0) goto L77
            r0 = 0
            return r0
        L77:
            r0 = r6
            freemarker.core.TemplateElement r0 = r0.prevTerminalNode()
            r6 = r0
            goto L5f
        L7f:
            r0 = r5
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.core.TextBlock.openingCharsToStrip():int");
    }

    private int trailingCharsToStrip() {
        String content = new String(this.text);
        int lastNewlineIndex = lastNewLineIndex();
        if (lastNewlineIndex == -1 && this.beginColumn != 1) {
            return 0;
        }
        String substring = content.substring(lastNewlineIndex + 1);
        if (substring.trim().length() > 0) {
            return 0;
        }
        TemplateElement nextTerminalNode = nextTerminalNode();
        while (true) {
            TemplateElement elem = nextTerminalNode;
            if (elem == null || elem.beginLine != this.endLine) {
                break;
            }
            if (!elem.heedsTrailingWhitespace()) {
                nextTerminalNode = elem.nextTerminalNode();
            } else {
                return 0;
            }
        }
        return substring.length();
    }

    @Override // freemarker.core.TemplateElement
    boolean heedsTrailingWhitespace() {
        if (isIgnorable()) {
            return false;
        }
        for (int i = 0; i < this.text.length; i++) {
            char c = this.text[i];
            if (c == '\n' || c == '\r') {
                return false;
            }
            if (!Character.isWhitespace(c)) {
                return true;
            }
        }
        return true;
    }

    @Override // freemarker.core.TemplateElement
    boolean heedsOpeningWhitespace() {
        if (isIgnorable()) {
            return false;
        }
        for (int i = this.text.length - 1; i >= 0; i--) {
            char c = this.text[i];
            if (c == '\n' || c == '\r') {
                return false;
            }
            if (!Character.isWhitespace(c)) {
                return true;
            }
        }
        return true;
    }

    @Override // freemarker.core.TemplateElement
    boolean isIgnorable() {
        if (this.text == null || this.text.length == 0) {
            return true;
        }
        if (!isWhitespace()) {
            return false;
        }
        boolean atTopLevel = getParent().getParent() == null;
        TemplateElement prevSibling = previousSibling();
        TemplateElement nextSibling = nextSibling();
        return ((prevSibling == null && atTopLevel) || nonOutputtingType(prevSibling)) && ((nextSibling == null && atTopLevel) || nonOutputtingType(nextSibling));
    }

    private boolean nonOutputtingType(TemplateElement element) {
        return (element instanceof Macro) || (element instanceof Assignment) || (element instanceof AssignmentInstruction) || (element instanceof PropertySetting) || (element instanceof LibraryLoad) || (element instanceof Comment);
    }

    private static char[] substring(char[] c, int from, int to) {
        char[] c2 = new char[to - from];
        System.arraycopy(c, from, c2, 0, c2.length);
        return c2;
    }

    private static char[] substring(char[] c, int from) {
        return substring(c, from, c.length);
    }

    private static char[] trim(char[] c) {
        if (c.length == 0) {
            return c;
        }
        return new String(c).trim().toCharArray();
    }

    private static char[] concat(char[] c1, char[] c2) {
        char[] c = new char[c1.length + c2.length];
        System.arraycopy(c1, 0, c, 0, c1.length);
        System.arraycopy(c2, 0, c, c1.length, c2.length);
        return c;
    }

    boolean isWhitespace() {
        return this.text == null || trim(this.text).length == 0;
    }
}
