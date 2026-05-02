package org.mozilla.javascript.ast;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/ForLoop.class */
public class ForLoop extends Loop {
    private AstNode initializer;
    private AstNode condition;
    private AstNode increment;

    public ForLoop() {
        this.type = 119;
    }

    public ForLoop(int pos) {
        super(pos);
        this.type = 119;
    }

    public ForLoop(int pos, int len) {
        super(pos, len);
        this.type = 119;
    }

    public AstNode getInitializer() {
        return this.initializer;
    }

    public void setInitializer(AstNode initializer) {
        assertNotNull(initializer);
        this.initializer = initializer;
        initializer.setParent(this);
    }

    public AstNode getCondition() {
        return this.condition;
    }

    public void setCondition(AstNode condition) {
        assertNotNull(condition);
        this.condition = condition;
        condition.setParent(this);
    }

    public AstNode getIncrement() {
        return this.increment;
    }

    public void setIncrement(AstNode increment) {
        assertNotNull(increment);
        this.increment = increment;
        increment.setParent(this);
    }

    @Override // org.mozilla.javascript.ast.Scope, org.mozilla.javascript.ast.Jump, org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        StringBuilder sb = new StringBuilder();
        sb.append(makeIndent(depth));
        sb.append("for (");
        sb.append(this.initializer.toSource(0));
        sb.append("; ");
        sb.append(this.condition.toSource(0));
        sb.append("; ");
        sb.append(this.increment.toSource(0));
        sb.append(") ");
        if (this.body.getType() == 129) {
            sb.append(this.body.toSource(depth).trim()).append("\n");
        } else {
            sb.append("\n").append(this.body.toSource(depth + 1));
        }
        return sb.toString();
    }

    @Override // org.mozilla.javascript.ast.Scope, org.mozilla.javascript.ast.Jump, org.mozilla.javascript.ast.AstNode
    public void visit(NodeVisitor v) {
        if (v.visit(this)) {
            this.initializer.visit(v);
            this.condition.visit(v);
            this.increment.visit(v);
            this.body.visit(v);
        }
    }
}
