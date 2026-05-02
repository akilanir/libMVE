package javassist.compiler;

import java.util.HashMap;
import javassist.compiler.ast.Declarator;

/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/SymbolTable.class */
public final class SymbolTable extends HashMap {
    private SymbolTable parent;

    public SymbolTable() {
        this(null);
    }

    public SymbolTable(SymbolTable p) {
        this.parent = p;
    }

    public SymbolTable getParent() {
        return this.parent;
    }

    public Declarator lookup(String name) {
        Declarator found = (Declarator) get(name);
        if (found == null && this.parent != null) {
            return this.parent.lookup(name);
        }
        return found;
    }

    public void append(String name, Declarator value) {
        put(name, value);
    }
}
