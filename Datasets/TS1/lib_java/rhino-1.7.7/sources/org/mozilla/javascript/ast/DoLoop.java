package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/DoLoop.class */
public class DoLoop extends Loop {
    private AstNode condition;
    private int whilePosition;

    public DoLoop() {
        this.whilePosition = -1;
        this.type = 118;
    }

    public DoLoop(int pos) {
        super(pos);
        this.whilePosition = -1;
        this.type = 118;
    }

    public DoLoop(int pos, int len) {
        super(pos, len);
        this.whilePosition = -1;
        this.type = 118;
    }

    public AstNode getCondition() {
        return this.condition;
    }

    public void setCondition(AstNode condition) {
        assertNotNull(condition);
        this.condition = condition;
        condition.setParent(this);
    }

    public int getWhilePosition() {
        return this.whilePosition;
    }

    public void setWhilePosition(int whilePosition) {
        this.whilePosition = whilePosition;
    }

    @Override // org.mozilla.javascript.ast.Scope, org.mozilla.javascript.ast.Jump, org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        return makeIndent(depth) + "do " + this.body.toSource(depth).trim() + " while (" + this.condition.toSource(0) + ");\n";
    }

    @Override // org.mozilla.javascript.ast.Scope, org.mozilla.javascript.ast.Jump, org.mozilla.javascript.ast.AstNode
    public void visit(NodeVisitor v) {
        if (v.visit(this)) {
            this.body.visit(v);
            this.condition.visit(v);
        }
    }
}
