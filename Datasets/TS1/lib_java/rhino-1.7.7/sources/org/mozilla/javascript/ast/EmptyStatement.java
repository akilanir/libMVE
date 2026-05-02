package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/EmptyStatement.class */
public class EmptyStatement extends AstNode {
    public EmptyStatement() {
        this.type = 128;
    }

    public EmptyStatement(int pos) {
        super(pos);
        this.type = 128;
    }

    public EmptyStatement(int pos, int len) {
        super(pos, len);
        this.type = 128;
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        StringBuilder sb = new StringBuilder();
        sb.append(makeIndent(depth)).append(";\n");
        return sb.toString();
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public void visit(NodeVisitor v) {
        v.visit(this);
    }
}
