package com.bea.xml.stream.util;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/util/SymbolTable.class */
public class SymbolTable {
    private int depth = 0;
    private Stack table = new Stack();
    private Map values = new HashMap();

    public void clear() {
        this.depth = 0;
        this.table.clear();
        this.values.clear();
    }

    public int getDepth() {
        return this.depth;
    }

    public boolean withinElement() {
        return this.depth > 0;
    }

    public void put(String name, String value) {
        this.table.push(new Symbol(name, value, this.depth));
        if (!this.values.containsKey(name)) {
            Stack valueStack = new Stack();
            valueStack.push(value);
            this.values.put(name, valueStack);
            return;
        }
        ((Stack) this.values.get(name)).push(value);
    }

    public String get(String name) {
        Stack valueStack = (Stack) this.values.get(name);
        if (valueStack == null || valueStack.isEmpty()) {
            return null;
        }
        return (String) valueStack.peek();
    }

    public Set getAll(String name) {
        HashSet result = new HashSet();
        Iterator i = this.table.iterator();
        while (i.hasNext()) {
            Symbol s = (Symbol) i.next();
            if (name.equals(s.getName())) {
                result.add(s.getValue());
            }
        }
        return result;
    }

    public void openScope() {
        this.depth++;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0015 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void closeScope() {
        /*
            r4 = this;
            r0 = r4
            com.bea.xml.stream.util.Stack r0 = r0.table
            java.lang.Object r0 = r0.peek()
            com.bea.xml.stream.util.Symbol r0 = (com.bea.xml.stream.util.Symbol) r0
            r5 = r0
            r0 = r5
            int r0 = r0.depth
            r6 = r0
        L10:
            r0 = r6
            r1 = r4
            int r1 = r1.depth
            if (r0 != r1) goto L60
            r0 = r4
            com.bea.xml.stream.util.Stack r0 = r0.table
            boolean r0 = r0.isEmpty()
            if (r0 != 0) goto L60
            r0 = r4
            com.bea.xml.stream.util.Stack r0 = r0.table
            java.lang.Object r0 = r0.pop()
            com.bea.xml.stream.util.Symbol r0 = (com.bea.xml.stream.util.Symbol) r0
            r5 = r0
            r0 = r4
            java.util.Map r0 = r0.values
            r1 = r5
            java.lang.String r1 = r1.name
            java.lang.Object r0 = r0.get(r1)
            com.bea.xml.stream.util.Stack r0 = (com.bea.xml.stream.util.Stack) r0
            r7 = r0
            r0 = r7
            java.lang.Object r0 = r0.pop()
            r0 = r4
            com.bea.xml.stream.util.Stack r0 = r0.table
            boolean r0 = r0.isEmpty()
            if (r0 != 0) goto L60
            r0 = r4
            com.bea.xml.stream.util.Stack r0 = r0.table
            java.lang.Object r0 = r0.peek()
            com.bea.xml.stream.util.Symbol r0 = (com.bea.xml.stream.util.Symbol) r0
            r5 = r0
            r0 = r5
            int r0 = r0.depth
            r6 = r0
            goto L10
        L60:
            r0 = r4
            r1 = r0
            int r1 = r1.depth
            r2 = 1
            int r1 = r1 - r2
            r0.depth = r1
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bea.xml.stream.util.SymbolTable.closeScope():void");
    }

    public String toString() {
        Iterator i = this.table.iterator();
        String str = "";
        while (true) {
            String retVal = str;
            if (i.hasNext()) {
                Symbol symbol = (Symbol) i.next();
                str = new StringBuffer().append(retVal).append(symbol).append("\n").toString();
            } else {
                return retVal;
            }
        }
    }

    public static void main(String[] args) throws Exception {
        SymbolTable st = new SymbolTable();
        st.openScope();
        st.put("x", "foo");
        st.put("y", "bar");
        System.out.println(new StringBuffer().append("1 x:").append(st.get("x")).toString());
        System.out.println(new StringBuffer().append("1 y:").append(st.get("y")).toString());
        st.openScope();
        st.put("x", "bar");
        st.put("y", "foo");
        st.openScope();
        st.put("x", "barbie");
        st.openScope();
        st.closeScope();
        System.out.println(new StringBuffer().append("3 x:").append(st.get("x")).toString());
        st.closeScope();
        System.out.println(new StringBuffer().append("2 x:").append(st.get("x")).toString());
        System.out.println(new StringBuffer().append("2 y:").append(st.get("y")).toString());
        System.out.print(st);
        st.closeScope();
        System.out.println(new StringBuffer().append("1 x:").append(st.get("x")).toString());
        System.out.println(new StringBuffer().append("1 y:").append(st.get("y")).toString());
        st.closeScope();
        System.out.print(st);
    }
}
