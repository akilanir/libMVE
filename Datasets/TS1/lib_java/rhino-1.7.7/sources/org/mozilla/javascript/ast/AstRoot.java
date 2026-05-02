package org.mozilla.javascript.ast;

import java.util.Iterator;
import java.util.SortedSet;
import java.util.TreeSet;
import org.mozilla.javascript.Node;
import org.mozilla.javascript.ast.AstNode;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/AstRoot.class */
public class AstRoot extends ScriptNode {
    private SortedSet<Comment> comments;
    private boolean inStrictMode;

    public AstRoot() {
        this.type = 136;
    }

    public AstRoot(int pos) {
        super(pos);
        this.type = 136;
    }

    public SortedSet<Comment> getComments() {
        return this.comments;
    }

    public void setComments(SortedSet<Comment> comments) {
        if (comments == null) {
            this.comments = null;
            return;
        }
        if (this.comments != null) {
            this.comments.clear();
        }
        for (Comment c : comments) {
            addComment(c);
        }
    }

    public void addComment(Comment comment) {
        assertNotNull(comment);
        if (this.comments == null) {
            this.comments = new TreeSet(new AstNode.PositionComparator());
        }
        this.comments.add(comment);
        comment.setParent(this);
    }

    public void setInStrictMode(boolean inStrictMode) {
        this.inStrictMode = inStrictMode;
    }

    public boolean isInStrictMode() {
        return this.inStrictMode;
    }

    public void visitComments(NodeVisitor visitor) {
        if (this.comments != null) {
            for (Comment c : this.comments) {
                visitor.visit(c);
            }
        }
    }

    public void visitAll(NodeVisitor visitor) {
        visit(visitor);
        visitComments(visitor);
    }

    @Override // org.mozilla.javascript.ast.Scope, org.mozilla.javascript.ast.Jump, org.mozilla.javascript.ast.AstNode
    public String toSource(int depth) {
        StringBuilder sb = new StringBuilder();
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Node node = i$.next();
            sb.append(((AstNode) node).toSource(depth));
        }
        return sb.toString();
    }

    @Override // org.mozilla.javascript.ast.AstNode
    public String debugPrint() {
        AstNode.DebugPrintVisitor dpv = new AstNode.DebugPrintVisitor(new StringBuilder(1000));
        visitAll(dpv);
        return dpv.toString();
    }

    public void checkParentLinks() {
        visit(new NodeVisitor() { // from class: org.mozilla.javascript.ast.AstRoot.1
            @Override // org.mozilla.javascript.ast.NodeVisitor
            public boolean visit(AstNode node) {
                int type = node.getType();
                if (type != 136 && node.getParent() == null) {
                    throw new IllegalStateException("No parent for node: " + node + "\n" + node.toSource(0));
                }
                return true;
            }
        });
    }
}
