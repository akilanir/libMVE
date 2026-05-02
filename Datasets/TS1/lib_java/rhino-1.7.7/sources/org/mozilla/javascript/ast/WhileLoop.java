package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/WhileLoop.class */
public class WhileLoop extends Loop {
    private AstNode condition;

    public WhileLoop() {
        this.type = 117;
    }

    public WhileLoop(int pos) {
        super(pos);
        this.type = 117;
    }

    public WhileLoop(int pos, int len) {
        super(pos, len);
        this.type = 117;
    }

    public AstNode getCondition() {
        return this.condition;
    }

    public void setCondition(AstNode condition) {
        assertNotNull(condition);
        this.condition = condition;
        condition.setParent(this);
    }

    @Override // org.mozilla.javascript.ast.Scope, org.mozilla.javascript.ast.Jump, org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        StringBuilder sb = new StringBuilder();
        sb.append(makeIndent(depth));
        sb.append("while (");
        sb.append(this.condition.toSource(0));
        sb.append(") ");
        if (this.body.getType() == 129) {
            sb.append(this.body.toSource(depth).trim());
            sb.append("\n");
        } else {
            sb.append("\n").append(this.body.toSource(depth + 1));
        }
        return sb.toString();
    }

    @Override // org.mozilla.javascript.ast.Scope, org.mozilla.javascript.ast.Jump, org.mozilla.javascript.ast.AstNode
    public void visit(NodeVisitor v) {
        if (v.visit(this)) {
            this.condition.visit(v);
            this.body.visit(v);
        }
    }
}
