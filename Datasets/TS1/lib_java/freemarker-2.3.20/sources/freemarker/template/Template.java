package freemarker.template;

import freemarker.core.Configurable;
import freemarker.core.Environment;
import freemarker.core.FMParser;
import freemarker.core.LibraryLoad;
import freemarker.core.Macro;
import freemarker.core.ParseException;
import freemarker.core.TemplateElement;
import freemarker.core.TextBlock;
import freemarker.core.TokenMgrError;
import freemarker.debug.DebugModel;
import freemarker.debug.impl.DebuggerService;
import java.io.BufferedReader;
import java.io.FilterReader;
import java.io.IOException;
import java.io.PrintStream;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.swing.tree.TreePath;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/Template.class */
public class Template extends Configurable {
    public static final String DEFAULT_NAMESPACE_PREFIX = "D";
    public static final String NO_NS_PREFIX = "N";
    private transient FMParser parser;
    private Map macros;
    private List imports;
    private TemplateElement rootElement;
    private String encoding;
    private String defaultNS;
    private int actualTagSyntax;
    private final String name;
    private final ArrayList lines;
    private Map prefixToNamespaceURILookup;
    private Map namespaceURIToPrefixLookup;

    private Template(String name, Configuration cfg) {
        super(cfg != null ? cfg : Configuration.getDefaultConfiguration());
        this.macros = new HashMap();
        this.imports = new Vector();
        this.lines = new ArrayList();
        this.prefixToNamespaceURILookup = new HashMap();
        this.namespaceURIToPrefixLookup = new HashMap();
        this.name = name;
    }

    public Template(String name, Reader reader, Configuration cfg) throws IOException {
        this(name, reader, cfg, null);
    }

    public Template(String name, String sourceCode, Configuration cfg) throws IOException {
        this(name, new StringReader(sourceCode), cfg, null);
    }

    public Template(String name, Reader reader, Configuration cfg, String encoding) throws IOException {
        this(name, cfg);
        this.encoding = encoding;
        try {
            try {
                try {
                    try {
                        this.parser = new FMParser(this, new LineTableBuilder(this, reader instanceof BufferedReader ? reader : new BufferedReader(reader, DebugModel.TYPE_TEMPLATE)), getConfiguration().getStrictSyntaxMode(), getConfiguration().getWhitespaceStripping(), getConfiguration().getTagSyntax(), getConfiguration().getIncompatibleImprovements().intValue());
                        this.rootElement = this.parser.Root();
                        this.actualTagSyntax = this.parser._getLastTagSyntax();
                        this.parser = null;
                        DebuggerService.registerTemplate(this);
                        this.namespaceURIToPrefixLookup = Collections.unmodifiableMap(this.namespaceURIToPrefixLookup);
                        this.prefixToNamespaceURILookup = Collections.unmodifiableMap(this.prefixToNamespaceURILookup);
                    } catch (Throwable th) {
                        this.parser = null;
                        throw th;
                    }
                } catch (TokenMgrError exc) {
                    throw exc.toParseException(this);
                }
            } finally {
                reader.close();
            }
        } catch (ParseException e) {
            e.setTemplateName(name);
            throw e;
        }
    }

    public Template(String name, Reader reader) throws IOException {
        this(name, reader, (Configuration) null);
    }

    Template(String name, TemplateElement root, Configuration config) {
        this(name, config);
        this.rootElement = root;
        DebuggerService.registerTemplate(this);
    }

    public static Template getPlainTextTemplate(String name, String content, Configuration config) {
        Template template = new Template(name, config);
        TextBlock block = new TextBlock(content);
        template.rootElement = block;
        DebuggerService.registerTemplate(template);
        return template;
    }

    public void process(Object dataModel, Writer out) throws TemplateException, IOException {
        createProcessingEnvironment(dataModel, out, null).process();
    }

    public void process(Object dataModel, Writer out, ObjectWrapper wrapper, TemplateNodeModel rootNode) throws TemplateException, IOException {
        Environment env = createProcessingEnvironment(dataModel, out, wrapper);
        if (rootNode != null) {
            env.setCurrentVisitorNode(rootNode);
        }
        env.process();
    }

    public void process(Object dataModel, Writer out, ObjectWrapper wrapper) throws TemplateException, IOException {
        createProcessingEnvironment(dataModel, out, wrapper).process();
    }

    public Environment createProcessingEnvironment(Object dataModel, Writer out, ObjectWrapper wrapper) throws TemplateException, IOException {
        TemplateHashModel dataModelHash;
        if (dataModel instanceof TemplateHashModel) {
            dataModelHash = (TemplateHashModel) dataModel;
        } else {
            if (wrapper == null) {
                wrapper = getObjectWrapper();
            }
            if (dataModel == null) {
                dataModelHash = new SimpleHash(wrapper);
            } else {
                TemplateModel wrappedDataModel = wrapper.wrap(dataModel);
                if (wrappedDataModel instanceof TemplateHashModel) {
                    dataModelHash = (TemplateHashModel) wrappedDataModel;
                } else {
                    if (wrappedDataModel == null) {
                        throw new IllegalArgumentException(new StringBuffer().append(wrapper.getClass().getName()).append(" converted ").append(dataModel.getClass().getName()).append(" to null.").toString());
                    }
                    throw new IllegalArgumentException(new StringBuffer().append(wrapper.getClass().getName()).append(" didn't convert ").append(dataModel.getClass().getName()).append(" to a TemplateHashModel. Generally, you want to use a Map<String, Object> or a ").append("JavaBean as the root-map (aka. data-model) parameter. The Map key-s or JavaBean ").append("property names will be the variable names in the template.").toString());
                }
            }
        }
        return new Environment(this, dataModelHash, out);
    }

    public Environment createProcessingEnvironment(Object dataModel, Writer out) throws TemplateException, IOException {
        return createProcessingEnvironment(dataModel, out, null);
    }

    public String toString() {
        StringWriter sw = new StringWriter();
        try {
            dump(sw);
            return sw.toString();
        } catch (IOException ioe) {
            throw new RuntimeException(ioe.getMessage());
        }
    }

    public String getName() {
        return this.name;
    }

    public Configuration getConfiguration() {
        return (Configuration) getParent();
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }

    public String getEncoding() {
        return this.encoding;
    }

    public int getActualTagSyntax() {
        return this.actualTagSyntax;
    }

    public void dump(PrintStream ps) {
        ps.print(this.rootElement.getCanonicalForm());
    }

    public void dump(Writer out) throws IOException {
        out.write(this.rootElement.getCanonicalForm());
    }

    public void addMacro(Macro macro) {
        this.macros.put(macro.getName(), macro);
    }

    public void addImport(LibraryLoad ll) {
        this.imports.add(ll);
    }

    public String getSource(int beginColumn, int beginLine, int endColumn, int endLine) {
        if (beginLine < 1 || endLine < 1) {
            return null;
        }
        int beginColumn2 = beginColumn - 1;
        int endColumn2 = endColumn - 1;
        int endLine2 = endLine - 1;
        StringBuffer buf = new StringBuffer();
        for (int i = beginLine - 1; i <= endLine2; i++) {
            if (i < this.lines.size()) {
                buf.append(this.lines.get(i));
            }
        }
        int lastLineLength = this.lines.get(endLine2).toString().length();
        int trailingCharsToDelete = (lastLineLength - endColumn2) - 1;
        buf.delete(0, beginColumn2);
        buf.delete(buf.length() - trailingCharsToDelete, buf.length());
        return buf.toString();
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/Template$LineTableBuilder.class */
    private class LineTableBuilder extends FilterReader {
        StringBuffer lineBuf;
        int lastChar;
        private final Template this$0;

        LineTableBuilder(Template template, Reader r) {
            super(r);
            this.this$0 = template;
            this.lineBuf = new StringBuffer();
        }

        @Override // java.io.FilterReader, java.io.Reader
        public int read() throws IOException {
            int c = this.in.read();
            handleChar(c);
            return c;
        }

        @Override // java.io.FilterReader, java.io.Reader
        public int read(char[] cbuf, int off, int len) throws IOException {
            int numchars = this.in.read(cbuf, off, len);
            for (int i = off; i < off + numchars; i++) {
                char c = cbuf[i];
                handleChar(c);
            }
            return numchars;
        }

        @Override // java.io.FilterReader, java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.lineBuf.length() > 0) {
                this.this$0.lines.add(this.lineBuf.toString());
                this.lineBuf.setLength(0);
            }
            super.close();
        }

        private void handleChar(int c) {
            if (c == 10 || c == 13) {
                if (this.lastChar == 13 && c == 10) {
                    int lastIndex = this.this$0.lines.size() - 1;
                    String lastLine = (String) this.this$0.lines.get(lastIndex);
                    this.this$0.lines.set(lastIndex, new StringBuffer().append(lastLine).append('\n').toString());
                } else {
                    this.lineBuf.append((char) c);
                    this.this$0.lines.add(this.lineBuf.toString());
                    this.lineBuf.setLength(0);
                }
            } else if (c == 9) {
                int numSpaces = 8 - (this.lineBuf.length() % 8);
                for (int i = 0; i < numSpaces; i++) {
                    this.lineBuf.append(' ');
                }
            } else {
                this.lineBuf.append((char) c);
            }
            this.lastChar = c;
        }
    }

    public TemplateElement getRootTreeNode() {
        return this.rootElement;
    }

    public Map getMacros() {
        return this.macros;
    }

    public List getImports() {
        return this.imports;
    }

    public void addPrefixNSMapping(String prefix, String nsURI) {
        if (nsURI.length() == 0) {
            throw new IllegalArgumentException("Cannot map empty string URI");
        }
        if (prefix.length() == 0) {
            throw new IllegalArgumentException("Cannot map empty string prefix");
        }
        if (prefix.equals(NO_NS_PREFIX)) {
            throw new IllegalArgumentException(new StringBuffer().append("The prefix: ").append(prefix).append(" cannot be registered, it's reserved for special internal use.").toString());
        }
        if (this.prefixToNamespaceURILookup.containsKey(prefix)) {
            throw new IllegalArgumentException(new StringBuffer().append("The prefix: '").append(prefix).append("' was repeated. This is illegal.").toString());
        }
        if (this.namespaceURIToPrefixLookup.containsKey(nsURI)) {
            throw new IllegalArgumentException(new StringBuffer().append("The namespace URI: ").append(nsURI).append(" cannot be mapped to 2 different prefixes.").toString());
        }
        if (prefix.equals(DEFAULT_NAMESPACE_PREFIX)) {
            this.defaultNS = nsURI;
        } else {
            this.prefixToNamespaceURILookup.put(prefix, nsURI);
            this.namespaceURIToPrefixLookup.put(nsURI, prefix);
        }
    }

    public String getDefaultNS() {
        return this.defaultNS;
    }

    public String getNamespaceForPrefix(String prefix) {
        if (prefix.equals("")) {
            return this.defaultNS == null ? "" : this.defaultNS;
        }
        return (String) this.prefixToNamespaceURILookup.get(prefix);
    }

    public String getPrefixForNamespace(String nsURI) {
        if (nsURI == null) {
            return null;
        }
        if (nsURI.length() == 0) {
            return this.defaultNS == null ? "" : NO_NS_PREFIX;
        }
        if (nsURI.equals(this.defaultNS)) {
            return "";
        }
        return (String) this.namespaceURIToPrefixLookup.get(nsURI);
    }

    public String getPrefixedName(String localName, String nsURI) {
        if (nsURI == null || nsURI.length() == 0) {
            if (this.defaultNS != null) {
                return new StringBuffer().append("N:").append(localName).toString();
            }
            return localName;
        }
        if (nsURI.equals(this.defaultNS)) {
            return localName;
        }
        String prefix = getPrefixForNamespace(nsURI);
        if (prefix == null) {
            return null;
        }
        return new StringBuffer().append(prefix).append(":").append(localName).toString();
    }

    public TreePath containingElements(int column, int line) {
        TemplateElement elem;
        ArrayList elements = new ArrayList();
        TemplateElement templateElement = this.rootElement;
        loop0: while (true) {
            TemplateElement element = templateElement;
            if (!element.contains(column, line)) {
                break;
            }
            elements.add(element);
            Enumeration enumeration = element.children();
            while (enumeration.hasMoreElements()) {
                elem = (TemplateElement) enumeration.nextElement();
                if (elem.contains(column, line)) {
                    break;
                }
            }
            break loop0;
            templateElement = elem;
        }
        if (elements == null || elements.isEmpty()) {
            return null;
        }
        return new TreePath(elements.toArray());
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/Template$WrongEncodingException.class */
    public static class WrongEncodingException extends ParseException {
        public String specifiedEncoding;

        public WrongEncodingException(String specifiedEncoding) {
            this.specifiedEncoding = specifiedEncoding;
        }
    }
}
