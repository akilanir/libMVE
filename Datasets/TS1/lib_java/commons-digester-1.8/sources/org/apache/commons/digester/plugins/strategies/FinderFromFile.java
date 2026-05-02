package org.apache.commons.digester.plugins.strategies;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.apache.commons.digester.Digester;
import org.apache.commons.digester.plugins.PluginException;
import org.apache.commons.digester.plugins.RuleFinder;
import org.apache.commons.digester.plugins.RuleLoader;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/strategies/FinderFromFile.class */
public class FinderFromFile extends RuleFinder {
    public static String DFLT_FILENAME_ATTR = "file";
    private String filenameAttr;

    public FinderFromFile() {
        this(DFLT_FILENAME_ATTR);
    }

    public FinderFromFile(String filenameAttr) {
        this.filenameAttr = filenameAttr;
    }

    @Override // org.apache.commons.digester.plugins.RuleFinder
    public RuleLoader findLoader(Digester d, Class pluginClass, Properties p) throws PluginException {
        String rulesFileName = p.getProperty(this.filenameAttr);
        if (rulesFileName == null) {
            return null;
        }
        try {
            InputStream is = new FileInputStream(rulesFileName);
            try {
                try {
                    try {
                        RuleLoader loader = new LoaderFromStream(is);
                        return loader;
                    } catch (Exception e) {
                        throw new PluginException(new StringBuffer().append("Unable to load xmlrules from file [").append(rulesFileName).append("]").toString(), e);
                    }
                } finally {
                    is.close();
                }
            } catch (IOException ioe) {
                throw new PluginException(new StringBuffer().append("Unable to close stream for file [").append(rulesFileName).append("]").toString(), ioe);
            }
        } catch (IOException ioe2) {
            throw new PluginException(new StringBuffer().append("Unable to process file [").append(rulesFileName).append("]").toString(), ioe2);
        }
    }
}
