package org.simpleframework.xml.core;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.stream.Format;
import org.simpleframework.xml.stream.Style;
import org.simpleframework.xml.util.Cache;
import org.simpleframework.xml.util.ConcurrentCache;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/PathParser.class */
class PathParser implements Expression {
    protected Cache<String> attributes = new ConcurrentCache();
    protected Cache<String> elements = new ConcurrentCache();
    protected List<Integer> indexes = new ArrayList();
    protected List<String> prefixes = new ArrayList();
    protected List<String> names = new ArrayList();
    protected StringBuilder builder = new StringBuilder();
    protected String location;
    protected String cache;
    protected String path;
    protected Style style;
    protected Type type;
    protected boolean attribute;
    protected char[] data;
    protected int count;
    protected int start;
    protected int off;

    public PathParser(String path, Type type, Format format) throws Exception {
        this.style = format.getStyle();
        this.type = type;
        this.path = path;
        parse(path);
    }

    @Override // org.simpleframework.xml.core.Expression
    public boolean isEmpty() {
        return isEmpty(this.location);
    }

    @Override // org.simpleframework.xml.core.Expression
    public boolean isPath() {
        return this.names.size() > 1;
    }

    @Override // org.simpleframework.xml.core.Expression
    public boolean isAttribute() {
        return this.attribute;
    }

    @Override // org.simpleframework.xml.core.Expression
    public int getIndex() {
        return this.indexes.get(0).intValue();
    }

    @Override // org.simpleframework.xml.core.Expression
    public String getPrefix() {
        return this.prefixes.get(0);
    }

    @Override // org.simpleframework.xml.core.Expression
    public String getFirst() {
        return this.names.get(0);
    }

    @Override // org.simpleframework.xml.core.Expression
    public String getLast() {
        int count = this.names.size();
        int index = count - 1;
        return this.names.get(index);
    }

    @Override // org.simpleframework.xml.core.Expression
    public String getPath() {
        return this.location;
    }

    @Override // org.simpleframework.xml.core.Expression
    public String getElement(String name) {
        if (!isEmpty(this.location)) {
            String path = this.elements.fetch(name);
            if (path == null) {
                path = getElementPath(this.location, name);
                if (path != null) {
                    this.elements.cache(name, path);
                }
            }
            return path;
        }
        return this.style.getElement(name);
    }

    protected String getElementPath(String path, String name) {
        String element = this.style.getElement(name);
        if (isEmpty(element)) {
            return path;
        }
        if (isEmpty(path)) {
            return element;
        }
        return path + "/" + element + "[1]";
    }

    @Override // org.simpleframework.xml.core.Expression
    public String getAttribute(String name) {
        if (!isEmpty(this.location)) {
            String path = this.attributes.fetch(name);
            if (path == null) {
                path = getAttributePath(this.location, name);
                if (path != null) {
                    this.attributes.cache(name, path);
                }
            }
            return path;
        }
        return this.style.getAttribute(name);
    }

    protected String getAttributePath(String path, String name) {
        String attribute = this.style.getAttribute(name);
        if (isEmpty(path)) {
            return attribute;
        }
        return path + "/@" + attribute;
    }

    @Override // java.lang.Iterable
    public Iterator<String> iterator() {
        return this.names.iterator();
    }

    @Override // org.simpleframework.xml.core.Expression
    public Expression getPath(int from) {
        return getPath(from, 0);
    }

    @Override // org.simpleframework.xml.core.Expression
    public Expression getPath(int from, int trim) {
        int last = this.names.size() - 1;
        if (last - trim >= from) {
            return new PathSection(from, last - trim);
        }
        return new PathSection(from, from);
    }

    private void parse(String path) throws Exception {
        if (path != null) {
            this.count = path.length();
            this.data = new char[this.count];
            path.getChars(0, this.count, this.data, 0);
        }
        path();
    }

    private void path() throws Exception {
        if (this.data[this.off] == '/') {
            throw new PathException("Path '%s' in %s references document root", this.path, this.type);
        }
        if (this.data[this.off] == '.') {
            skip();
        }
        while (this.off < this.count) {
            if (this.attribute) {
                throw new PathException("Path '%s' in %s references an invalid attribute", this.path, this.type);
            }
            segment();
        }
        truncate();
        build();
    }

    private void build() {
        int count = this.names.size();
        int last = count - 1;
        for (int i = 0; i < count; i++) {
            String prefix = this.prefixes.get(i);
            String segment = this.names.get(i);
            int index = this.indexes.get(i).intValue();
            if (i > 0) {
                this.builder.append('/');
            }
            if (this.attribute && i == last) {
                this.builder.append('@');
                this.builder.append(segment);
            } else {
                if (prefix != null) {
                    this.builder.append(prefix);
                    this.builder.append(':');
                }
                this.builder.append(segment);
                this.builder.append('[');
                this.builder.append(index);
                this.builder.append(']');
            }
        }
        this.location = this.builder.toString();
    }

    private void skip() throws Exception {
        if (this.data.length > 1) {
            if (this.data[this.off + 1] != '/') {
                throw new PathException("Path '%s' in %s has an illegal syntax", this.path, this.type);
            }
            this.off++;
        }
        int i = this.off + 1;
        this.off = i;
        this.start = i;
    }

    private void segment() throws Exception {
        char first = this.data[this.off];
        if (first == '/') {
            throw new PathException("Invalid path expression '%s' in %s", this.path, this.type);
        }
        if (first == '@') {
            attribute();
        } else {
            element();
        }
        align();
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x007a, code lost:
    
        element(r0, r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0080, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void element() throws java.lang.Exception {
        /*
            r8 = this;
            r0 = r8
            int r0 = r0.off
            r9 = r0
            r0 = 0
            r10 = r0
        L7:
            r0 = r8
            int r0 = r0.off
            r1 = r8
            int r1 = r1.count
            if (r0 >= r1) goto L7a
            r0 = r8
            char[] r0 = r0.data
            r1 = r8
            r2 = r1
            int r2 = r2.off
            r3 = r2; r2 = r1; r1 = r3; 
            r4 = 1
            int r3 = r3 + r4
            r2.off = r3
            char r0 = r0[r1]
            r11 = r0
            r0 = r8
            r1 = r11
            boolean r0 = r0.isValid(r1)
            if (r0 != 0) goto L74
            r0 = r11
            r1 = 64
            if (r0 != r1) goto L3e
            r0 = r8
            r1 = r0
            int r1 = r1.off
            r2 = 1
            int r1 = r1 - r2
            r0.off = r1
            goto L7a
        L3e:
            r0 = r11
            r1 = 91
            if (r0 != r1) goto L4b
            r0 = r8
            r0.index()
            goto L7a
        L4b:
            r0 = r11
            r1 = 47
            if (r0 == r1) goto L7a
            org.simpleframework.xml.core.PathException r0 = new org.simpleframework.xml.core.PathException
            r1 = r0
            java.lang.String r2 = "Illegal character '%s' in element for '%s' in %s"
            r3 = 3
            java.lang.Object[] r3 = new java.lang.Object[r3]
            r4 = r3
            r5 = 0
            r6 = r11
            java.lang.Character r6 = java.lang.Character.valueOf(r6)
            r4[r5] = r6
            r4 = r3
            r5 = 1
            r6 = r8
            java.lang.String r6 = r6.path
            r4[r5] = r6
            r4 = r3
            r5 = 2
            r6 = r8
            org.simpleframework.xml.strategy.Type r6 = r6.type
            r4[r5] = r6
            r1.<init>(r2, r3)
            throw r0
        L74:
            int r10 = r10 + 1
            goto L7
        L7a:
            r0 = r8
            r1 = r9
            r2 = r10
            r0.element(r1, r2)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: org.simpleframework.xml.core.PathParser.element():void");
    }

    private void attribute() throws Exception {
        int mark = this.off + 1;
        this.off = mark;
        while (this.off < this.count) {
            char[] cArr = this.data;
            int i = this.off;
            this.off = i + 1;
            char value = cArr[i];
            if (!isValid(value)) {
                throw new PathException("Illegal character '%s' in attribute for '%s' in %s", Character.valueOf(value), this.path, this.type);
            }
        }
        if (this.off <= mark) {
            throw new PathException("Attribute reference in '%s' for %s is empty", this.path, this.type);
        }
        this.attribute = true;
        attribute(mark, this.off - mark);
    }

    private void index() throws Exception {
        int value = 0;
        if (this.data[this.off - 1] == '[') {
            while (this.off < this.count) {
                char[] cArr = this.data;
                int i = this.off;
                this.off = i + 1;
                char digit = cArr[i];
                if (!isDigit(digit)) {
                    break;
                } else {
                    value = ((value * 10) + digit) - 48;
                }
            }
        }
        char[] cArr2 = this.data;
        int i2 = this.off;
        this.off = i2 + 1;
        if (cArr2[i2 - 1] != ']') {
            throw new PathException("Invalid index for path '%s' in %s", this.path, this.type);
        }
        this.indexes.add(Integer.valueOf(value));
    }

    private void truncate() throws Exception {
        if (this.off - 1 >= this.data.length) {
            this.off--;
        } else if (this.data[this.off - 1] == '/') {
            this.off--;
        }
    }

    private void align() throws Exception {
        int require = this.names.size();
        int size = this.indexes.size();
        if (require > size) {
            this.indexes.add(1);
        }
    }

    private boolean isEmpty(String text) {
        return text == null || text.length() == 0;
    }

    private boolean isDigit(char value) {
        return Character.isDigit(value);
    }

    private boolean isValid(char value) {
        return isLetter(value) || isSpecial(value);
    }

    private boolean isSpecial(char value) {
        return value == '_' || value == '-' || value == ':';
    }

    private boolean isLetter(char value) {
        return Character.isLetterOrDigit(value);
    }

    private void element(int start, int count) {
        String segment = new String(this.data, start, count);
        if (count > 0) {
            element(segment);
        }
    }

    private void attribute(int start, int count) {
        String segment = new String(this.data, start, count);
        if (count > 0) {
            attribute(segment);
        }
    }

    private void element(String segment) {
        int index = segment.indexOf(58);
        String prefix = null;
        if (index > 0) {
            prefix = segment.substring(0, index);
            segment = segment.substring(index + 1);
        }
        String element = this.style.getElement(segment);
        this.prefixes.add(prefix);
        this.names.add(element);
    }

    private void attribute(String segment) {
        String attribute = this.style.getAttribute(segment);
        this.prefixes.add(null);
        this.names.add(attribute);
    }

    @Override // org.simpleframework.xml.core.Expression
    public String toString() {
        int size = this.off - this.start;
        if (this.cache == null) {
            this.cache = new String(this.data, this.start, size);
        }
        return this.cache;
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/PathParser$PathSection.class */
    private class PathSection implements Expression {
        private List<String> cache = new ArrayList();
        private String section;
        private String path;
        private int begin;
        private int end;

        public PathSection(int index, int end) {
            this.begin = index;
            this.end = end;
        }

        @Override // org.simpleframework.xml.core.Expression
        public boolean isEmpty() {
            return this.begin == this.end;
        }

        @Override // org.simpleframework.xml.core.Expression
        public boolean isPath() {
            return this.end - this.begin >= 1;
        }

        @Override // org.simpleframework.xml.core.Expression
        public boolean isAttribute() {
            return PathParser.this.attribute && this.end >= PathParser.this.names.size() - 1;
        }

        @Override // org.simpleframework.xml.core.Expression
        public String getPath() {
            if (this.section == null) {
                this.section = getCanonicalPath();
            }
            return this.section;
        }

        @Override // org.simpleframework.xml.core.Expression
        public String getElement(String name) {
            String path = getPath();
            if (path != null) {
                return PathParser.this.getElementPath(path, name);
            }
            return name;
        }

        @Override // org.simpleframework.xml.core.Expression
        public String getAttribute(String name) {
            String path = getPath();
            if (path != null) {
                return PathParser.this.getAttributePath(path, name);
            }
            return name;
        }

        @Override // org.simpleframework.xml.core.Expression
        public int getIndex() {
            return PathParser.this.indexes.get(this.begin).intValue();
        }

        @Override // org.simpleframework.xml.core.Expression
        public String getPrefix() {
            return PathParser.this.prefixes.get(this.begin);
        }

        @Override // org.simpleframework.xml.core.Expression
        public String getFirst() {
            return PathParser.this.names.get(this.begin);
        }

        @Override // org.simpleframework.xml.core.Expression
        public String getLast() {
            return PathParser.this.names.get(this.end);
        }

        @Override // org.simpleframework.xml.core.Expression
        public Expression getPath(int from) {
            return getPath(from, 0);
        }

        @Override // org.simpleframework.xml.core.Expression
        public Expression getPath(int from, int trim) {
            return PathParser.this.new PathSection(this.begin + from, this.end - trim);
        }

        @Override // java.lang.Iterable
        public Iterator<String> iterator() {
            if (this.cache.isEmpty()) {
                for (int i = this.begin; i <= this.end; i++) {
                    String segment = PathParser.this.names.get(i);
                    if (segment != null) {
                        this.cache.add(segment);
                    }
                }
            }
            return this.cache.iterator();
        }

        private String getCanonicalPath() {
            int start = 0;
            int pos = 0;
            while (pos < this.begin) {
                start = PathParser.this.location.indexOf(47, start + 1);
                pos++;
            }
            int last = start;
            while (pos <= this.end) {
                last = PathParser.this.location.indexOf(47, last + 1);
                if (last == -1) {
                    last = PathParser.this.location.length();
                }
                pos++;
            }
            return PathParser.this.location.substring(start + 1, last);
        }

        private String getFragment() {
            int last = PathParser.this.start;
            int pos = 0;
            int i = 0;
            while (true) {
                if (i > this.end) {
                    break;
                }
                if (last >= PathParser.this.count) {
                    last++;
                    break;
                }
                int i2 = last;
                last++;
                if (PathParser.this.data[i2] == '/') {
                    i++;
                    if (i == this.begin) {
                        pos = last;
                    }
                }
            }
            return new String(PathParser.this.data, pos, (last - 1) - pos);
        }

        @Override // org.simpleframework.xml.core.Expression
        public String toString() {
            if (this.path == null) {
                this.path = getFragment();
            }
            return this.path;
        }
    }
}
