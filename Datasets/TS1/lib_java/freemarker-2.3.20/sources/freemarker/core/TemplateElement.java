package freemarker.core;

import freemarker.template.SimpleSequence;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNodeModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.Collections12;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import javax.swing.tree.TreeNode;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/TemplateElement.class */
public abstract class TemplateElement extends TemplateObject implements TreeNode {
    TemplateElement parent;
    TemplateElement nestedBlock;
    List nestedElements;

    abstract void accept(Environment environment) throws TemplateException, IOException;

    protected abstract String dump(boolean z);

    public final String getDescription() {
        return dump(false);
    }

    @Override // freemarker.core.TemplateObject
    public final String getCanonicalForm() {
        return dump(true);
    }

    boolean isShownInStackTrace() {
        return true;
    }

    public TemplateNodeModel getParentNode() {
        return null;
    }

    public String getNodeNamespace() {
        return null;
    }

    public String getNodeType() {
        return "element";
    }

    public TemplateSequenceModel getChildNodes() {
        if (this.nestedElements != null) {
            return new SimpleSequence(this.nestedElements);
        }
        SimpleSequence result = new SimpleSequence();
        if (this.nestedBlock != null) {
            result.add(this.nestedBlock);
        }
        return result;
    }

    public String getNodeName() {
        String classname = getClass().getName();
        int shortNameOffset = classname.lastIndexOf(46) + 1;
        return classname.substring(shortNameOffset);
    }

    public boolean isLeaf() {
        return this.nestedBlock == null && (this.nestedElements == null || this.nestedElements.isEmpty());
    }

    public boolean getAllowsChildren() {
        return !isLeaf();
    }

    public int getIndex(TreeNode node) {
        if (this.nestedBlock instanceof MixedContent) {
            return this.nestedBlock.getIndex(node);
        }
        if (this.nestedBlock != null) {
            if (node == this.nestedBlock) {
                return 0;
            }
            return -1;
        }
        if (this.nestedElements != null) {
            return this.nestedElements.indexOf(node);
        }
        return -1;
    }

    public int getChildCount() {
        if (this.nestedBlock instanceof MixedContent) {
            return this.nestedBlock.getChildCount();
        }
        if (this.nestedBlock != null) {
            return 1;
        }
        if (this.nestedElements != null) {
            return this.nestedElements.size();
        }
        return 0;
    }

    public Enumeration children() {
        if (this.nestedBlock instanceof MixedContent) {
            return this.nestedBlock.children();
        }
        if (this.nestedBlock != null) {
            return Collections.enumeration(Collections12.singletonList(this.nestedBlock));
        }
        if (this.nestedElements != null) {
            return Collections.enumeration(this.nestedElements);
        }
        return Collections.enumeration(Collections.EMPTY_LIST);
    }

    public TreeNode getChildAt(int index) {
        if (this.nestedBlock instanceof MixedContent) {
            return this.nestedBlock.getChildAt(index);
        }
        if (this.nestedBlock != null) {
            if (index == 0) {
                return this.nestedBlock;
            }
            throw new ArrayIndexOutOfBoundsException("invalid index");
        }
        if (this.nestedElements != null) {
            return (TreeNode) this.nestedElements.get(index);
        }
        throw new ArrayIndexOutOfBoundsException("element has no children");
    }

    public void setChildAt(int index, TemplateElement element) {
        if (this.nestedBlock instanceof MixedContent) {
            this.nestedBlock.setChildAt(index, element);
            return;
        }
        if (this.nestedBlock != null) {
            if (index == 0) {
                this.nestedBlock = element;
                element.parent = this;
                return;
            }
            throw new IndexOutOfBoundsException("invalid index");
        }
        if (this.nestedElements != null) {
            this.nestedElements.set(index, element);
            element.parent = this;
            return;
        }
        throw new IndexOutOfBoundsException("element has no children");
    }

    public TreeNode getParent() {
        return this.parent;
    }

    void setParentRecursively(TemplateElement parent) {
        this.parent = parent;
        int nestedSize = this.nestedElements == null ? 0 : this.nestedElements.size();
        for (int i = 0; i < nestedSize; i++) {
            ((TemplateElement) this.nestedElements.get(i)).setParentRecursively(this);
        }
        if (this.nestedBlock != null) {
            this.nestedBlock.setParentRecursively(this);
        }
    }

    TemplateElement postParseCleanup(boolean stripWhitespace) throws ParseException {
        if (this.nestedElements != null) {
            for (int i = 0; i < this.nestedElements.size(); i++) {
                TemplateElement te = (TemplateElement) this.nestedElements.get(i);
                TemplateElement te2 = te.postParseCleanup(stripWhitespace);
                this.nestedElements.set(i, te2);
                te2.parent = this;
            }
            if (stripWhitespace) {
                Iterator it = this.nestedElements.iterator();
                while (it.hasNext()) {
                    TemplateElement te3 = (TemplateElement) it.next();
                    if (te3.isIgnorable()) {
                        it.remove();
                    }
                }
            }
            if (this.nestedElements instanceof ArrayList) {
                ((ArrayList) this.nestedElements).trimToSize();
            }
        }
        if (this.nestedBlock != null) {
            this.nestedBlock = this.nestedBlock.postParseCleanup(stripWhitespace);
            if (this.nestedBlock.isIgnorable()) {
                this.nestedBlock = null;
            } else {
                this.nestedBlock.parent = this;
            }
        }
        return this;
    }

    boolean isIgnorable() {
        return false;
    }

    TemplateElement prevTerminalNode() {
        TemplateElement prev = previousSibling();
        if (prev != null) {
            return prev.getLastLeaf();
        }
        if (this.parent != null) {
            return this.parent.prevTerminalNode();
        }
        return null;
    }

    TemplateElement nextTerminalNode() {
        TemplateElement next = nextSibling();
        if (next != null) {
            return next.getFirstLeaf();
        }
        if (this.parent != null) {
            return this.parent.nextTerminalNode();
        }
        return null;
    }

    TemplateElement previousSibling() {
        List siblings;
        if (this.parent == null || (siblings = this.parent.nestedElements) == null) {
            return null;
        }
        for (int i = siblings.size() - 1; i >= 0; i--) {
            if (siblings.get(i) == this) {
                if (i > 0) {
                    return (TemplateElement) siblings.get(i - 1);
                }
                return null;
            }
        }
        return null;
    }

    TemplateElement nextSibling() {
        List siblings;
        if (this.parent == null || (siblings = this.parent.nestedElements) == null) {
            return null;
        }
        for (int i = 0; i < siblings.size(); i++) {
            if (siblings.get(i) == this) {
                if (i + 1 < siblings.size()) {
                    return (TemplateElement) siblings.get(i + 1);
                }
                return null;
            }
        }
        return null;
    }

    private TemplateElement getFirstChild() {
        if (this.nestedBlock != null) {
            return this.nestedBlock;
        }
        if (this.nestedElements != null && this.nestedElements.size() > 0) {
            return (TemplateElement) this.nestedElements.get(0);
        }
        return null;
    }

    private TemplateElement getLastChild() {
        if (this.nestedBlock != null) {
            return this.nestedBlock;
        }
        if (this.nestedElements != null && this.nestedElements.size() > 0) {
            return (TemplateElement) this.nestedElements.get(this.nestedElements.size() - 1);
        }
        return null;
    }

    private TemplateElement getFirstLeaf() {
        TemplateElement te;
        TemplateElement templateElement = this;
        while (true) {
            te = templateElement;
            if (te.isLeaf() || (te instanceof Macro) || (te instanceof BlockAssignment)) {
                break;
            }
            templateElement = te.getFirstChild();
        }
        return te;
    }

    private TemplateElement getLastLeaf() {
        TemplateElement te;
        TemplateElement templateElement = this;
        while (true) {
            te = templateElement;
            if (te.isLeaf() || (te instanceof Macro) || (te instanceof BlockAssignment)) {
                break;
            }
            templateElement = te.getLastChild();
        }
        return te;
    }

    boolean heedsOpeningWhitespace() {
        return false;
    }

    boolean heedsTrailingWhitespace() {
        return false;
    }
}
