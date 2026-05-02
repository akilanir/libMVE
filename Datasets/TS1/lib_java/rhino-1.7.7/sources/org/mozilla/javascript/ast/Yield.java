package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/Yield.class */
public class Yield extends AstNode {
    private AstNode value;

    public Yield() {
        this.type = 72;
    }

    public Yield(int pos) {
        super(pos);
        this.type = 72;
    }

    public Yield(int pos, int len) {
        super(pos, len);
        this.type = 72;
    }

    public Yield(int pos, int len, AstNode value) {
        super(pos, len);
        this.type = 72;
        setValue(value);
    }

    public AstNode getValue() {
        return this.value;
    }

    public void setValue(AstNode expr) {
        this.value = expr;
        if (expr != null) {
            expr.setParent(this);
        }
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        return this.value == null ? "yield" : "yield " + this.value.toSource(0);
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public void visit(NodeVisitor v) {
        if (v.visit(this) && this.value != null) {
            this.value.visit(v);
        }
    }
}
