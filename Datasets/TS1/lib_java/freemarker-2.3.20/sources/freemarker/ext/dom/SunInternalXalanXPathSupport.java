package freemarker.ext.dom;

import com.sun.org.apache.xml.internal.utils.PrefixResolver;
import com.sun.org.apache.xpath.internal.XPath;
import com.sun.org.apache.xpath.internal.XPathContext;
import com.sun.org.apache.xpath.internal.objects.XBoolean;
import com.sun.org.apache.xpath.internal.objects.XNodeSet;
import com.sun.org.apache.xpath.internal.objects.XNull;
import com.sun.org.apache.xpath.internal.objects.XNumber;
import com.sun.org.apache.xpath.internal.objects.XString;
import freemarker.core.Environment;
import freemarker.template.SimpleNumber;
import freemarker.template.SimpleScalar;
import freemarker.template.Template;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.util.List;
import javax.xml.transform.ErrorListener;
import javax.xml.transform.SourceLocator;
import javax.xml.transform.TransformerException;
import org.w3c.dom.Node;
import org.w3c.dom.traversal.NodeIterator;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/dom/SunInternalXalanXPathSupport.class */
class SunInternalXalanXPathSupport implements XPathSupport {
    private XPathContext xpathContext = new XPathContext();
    private static final String ERRMSG_RECOMMEND_JAXEN = "(Note that there is no such restriction if you configure FreeMarker to use Jaxen instead of Xalan.)";
    private static final String ERRMSG_EMPTY_NODE_SET = "Cannot perform an XPath query against an empty node set.(Note that there is no such restriction if you configure FreeMarker to use Jaxen instead of Xalan.)";
    private static PrefixResolver customPrefixResolver = new PrefixResolver() { // from class: freemarker.ext.dom.SunInternalXalanXPathSupport.1
        public String getNamespaceForPrefix(String prefix, Node node) {
            return getNamespaceForPrefix(prefix);
        }

        public String getNamespaceForPrefix(String prefix) {
            if (prefix.equals(Template.DEFAULT_NAMESPACE_PREFIX)) {
                return Environment.getCurrentEnvironment().getDefaultNS();
            }
            return Environment.getCurrentEnvironment().getNamespaceForPrefix(prefix);
        }

        public String getBaseIdentifier() {
            return null;
        }

        public boolean handlesNullPrefixes() {
            return false;
        }
    };

    SunInternalXalanXPathSupport() {
    }

    @Override // freemarker.ext.dom.XPathSupport
    public synchronized TemplateModel executeQuery(Object context, String xpathQuery) throws TemplateModelException {
        Node n;
        if (!(context instanceof Node)) {
            if (context != null) {
                if (isNodeList(context)) {
                    int cnt = ((List) context).size();
                    if (cnt != 0) {
                        throw new TemplateModelException("Cannot perform an XPath query against a node set of " + cnt + " nodes. Expecting a single node." + ERRMSG_RECOMMEND_JAXEN);
                    }
                    throw new TemplateModelException(ERRMSG_EMPTY_NODE_SET);
                }
                throw new TemplateModelException("Cannot perform an XPath query against a " + context.getClass().getName() + ". Expecting a single org.w3c.dom.Node.");
            }
            throw new TemplateModelException(ERRMSG_EMPTY_NODE_SET);
        }
        Node node = (Node) context;
        try {
            XPath xpath = new XPath(xpathQuery, (SourceLocator) null, customPrefixResolver, 0, (ErrorListener) null);
            int ctxtNode = this.xpathContext.getDTMHandleFromNode(node);
            XBoolean execute = xpath.execute(this.xpathContext, ctxtNode, customPrefixResolver);
            if (execute instanceof XNodeSet) {
                NodeListModel result = new NodeListModel(node);
                result.xpathSupport = this;
                NodeIterator nodeIterator = execute.nodeset();
                do {
                    n = nodeIterator.nextNode();
                    if (n != null) {
                        result.add(n);
                    }
                } while (n != null);
                return result.size() == 1 ? result.get(0) : result;
            }
            if (execute instanceof XBoolean) {
                return execute.bool() ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
            }
            if (execute instanceof XNull) {
                return null;
            }
            if (execute instanceof XString) {
                return new SimpleScalar(execute.toString());
            }
            if (execute instanceof XNumber) {
                return new SimpleNumber(new Double(((XNumber) execute).num()));
            }
            throw new TemplateModelException("Cannot deal with type: " + execute.getClass().getName());
        } catch (TransformerException te) {
            throw new TemplateModelException((Exception) te);
        }
    }

    private static boolean isNodeList(Object context) {
        if (context instanceof List) {
            List ls = (List) context;
            int ln = ls.size();
            for (int i = 0; i < ln; i++) {
                if (!(ls.get(i) instanceof Node)) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }
}
