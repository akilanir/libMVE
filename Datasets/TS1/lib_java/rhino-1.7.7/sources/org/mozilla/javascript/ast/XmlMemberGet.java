package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/XmlMemberGet.class */
public class XmlMemberGet extends InfixExpression {
    public XmlMemberGet() {
        this.type = 143;
    }

    public XmlMemberGet(int pos) {
        super(pos);
        this.type = 143;
    }

    public XmlMemberGet(int pos, int len) {
        super(pos, len);
        this.type = 143;
    }

    public XmlMemberGet(int pos, int len, AstNode target, XmlRef ref) {
        super(pos, len, target, ref);
        this.type = 143;
    }

    public XmlMemberGet(AstNode target, XmlRef ref) {
        super(target, ref);
        this.type = 143;
    }

    public XmlMemberGet(AstNode target, XmlRef ref, int opPos) {
        super(143, target, ref, opPos);
        this.type = 143;
    }

    public AstNode getTarget() {
        return getLeft();
    }

    public void setTarget(AstNode target) {
        setLeft(target);
    }

    public XmlRef getMemberRef() {
        return (XmlRef) getRight();
    }

    public void setProperty(XmlRef ref) {
        setRight(ref);
    }

    @Override // org.mozilla.javascript.ast.InfixExpression, org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        return makeIndent(depth) + getLeft().toSource(0) + operatorToString(getType()) + getRight().toSource(0);
    }
}
