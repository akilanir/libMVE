package org.mozilla.javascript.ast;

import java.util.Iterator;
import org.mozilla.javascript.Node;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/Block.class */
public class Block extends AstNode {
    public Block() {
        this.type = 129;
    }

    public Block(int pos) {
        super(pos);
        this.type = 129;
    }

    public Block(int pos, int len) {
        super(pos, len);
        this.type = 129;
    }

    public void addStatement(AstNode statement) {
        addChild(statement);
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        StringBuilder sb = new StringBuilder();
        sb.append(makeIndent(depth));
        sb.append("{\n");
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Node kid = i$.next();
            sb.append(((AstNode) kid).toSource(depth + 1));
        }
        sb.append(makeIndent(depth));
        sb.append("}\n");
        return sb.toString();
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public void visit(NodeVisitor v) {
        if (v.visit(this)) {
            Iterator i$ = iterator();
            while (i$.hasNext()) {
                Node kid = i$.next();
                ((AstNode) kid).visit(v);
            }
        }
    }
}
