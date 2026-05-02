package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/XmlFragment.class */
public abstract class XmlFragment extends AstNode {
    public XmlFragment() {
        this.type = 145;
    }

    public XmlFragment(int pos) {
        super(pos);
        this.type = 145;
    }

    public XmlFragment(int pos, int len) {
        super(pos, len);
        this.type = 145;
    }
}
