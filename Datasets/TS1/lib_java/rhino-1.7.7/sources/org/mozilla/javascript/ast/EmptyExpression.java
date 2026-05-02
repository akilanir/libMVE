package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/EmptyExpression.class */
public class EmptyExpression extends AstNode {
    public EmptyExpression() {
        this.type = 128;
    }

    public EmptyExpression(int pos) {
        super(pos);
        this.type = 128;
    }

    public EmptyExpression(int pos, int len) {
        super(pos, len);
        this.type = 128;
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        return makeIndent(depth);
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public void visit(NodeVisitor v) {
        v.visit(this);
    }
}
