package freemarker.cache;

import freemarker.template.utility.SecurityUtilities;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.security.PrivilegedActionException;
import java.security.PrivilegedExceptionAction;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/FileTemplateLoader.class */
public class FileTemplateLoader implements TemplateLoader {
    private static final boolean SEP_IS_SLASH;
    public final File baseDir;
    private final String canonicalPath;

    static {
        SEP_IS_SLASH = File.separatorChar == '/';
    }

    public FileTemplateLoader() throws IOException {
        this(new File(SecurityUtilities.getSystemProperty("user.dir")));
    }

    public FileTemplateLoader(File baseDir) throws IOException {
        this(baseDir, false);
    }

    public FileTemplateLoader(File baseDir, boolean allowLinking) throws IOException {
        try {
            Object[] retval = (Object[]) AccessController.doPrivileged(new PrivilegedExceptionAction(this, baseDir, allowLinking) { // from class: freemarker.cache.FileTemplateLoader.1
                private final File val$baseDir;
                private final boolean val$allowLinking;
                private final FileTemplateLoader this$0;

                {
                    this.this$0 = this;
                    this.val$baseDir = baseDir;
                    this.val$allowLinking = allowLinking;
                }

                @Override // java.security.PrivilegedExceptionAction
                public Object run() throws IOException {
                    if (!this.val$baseDir.exists()) {
                        throw new FileNotFoundException(new StringBuffer().append(this.val$baseDir).append(" does not exist.").toString());
                    }
                    if (!this.val$baseDir.isDirectory()) {
                        throw new IOException(new StringBuffer().append(this.val$baseDir).append(" is not a directory.").toString());
                    }
                    Object[] retval2 = new Object[2];
                    if (this.val$allowLinking) {
                        retval2[0] = this.val$baseDir;
                        retval2[1] = null;
                    } else {
                        retval2[0] = this.val$baseDir.getCanonicalFile();
                        String basePath = ((File) retval2[0]).getPath();
                        if (!basePath.endsWith(File.separator)) {
                            basePath = new StringBuffer().append(basePath).append(File.separatorChar).toString();
                        }
                        retval2[1] = basePath;
                    }
                    return retval2;
                }
            });
            this.baseDir = (File) retval[0];
            this.canonicalPath = (String) retval[1];
        } catch (PrivilegedActionException e) {
            throw ((IOException) e.getException());
        }
    }

    @Override // freemarker.cache.TemplateLoader
    public Object findTemplateSource(String name) throws IOException {
        try {
            return AccessController.doPrivileged(new PrivilegedExceptionAction(this, name) { // from class: freemarker.cache.FileTemplateLoader.2
                private final String val$name;
                private final FileTemplateLoader this$0;

                {
                    this.this$0 = this;
                    this.val$name = name;
                }

                @Override // java.security.PrivilegedExceptionAction
                public Object run() throws IOException {
                    File source = new File(this.this$0.baseDir, FileTemplateLoader.SEP_IS_SLASH ? this.val$name : this.val$name.replace('/', File.separatorChar));
                    if (source.isFile()) {
                        if (this.this$0.canonicalPath != null) {
                            String normalized = source.getCanonicalPath();
                            if (!normalized.startsWith(this.this$0.canonicalPath)) {
                                throw new SecurityException(new StringBuffer().append(source.getAbsolutePath()).append(" resolves to ").append(normalized).append(" which ").append(" doesn't start with ").append(this.this$0.canonicalPath).toString());
                            }
                        }
                        return source;
                    }
                    return null;
                }
            });
        } catch (PrivilegedActionException e) {
            throw ((IOException) e.getException());
        }
    }

    @Override // freemarker.cache.TemplateLoader
    public long getLastModified(Object templateSource) {
        return ((Long) AccessController.doPrivileged(new PrivilegedAction(this, templateSource) { // from class: freemarker.cache.FileTemplateLoader.3
            private final Object val$templateSource;
            private final FileTemplateLoader this$0;

            {
                this.this$0 = this;
                this.val$templateSource = templateSource;
            }

            @Override // java.security.PrivilegedAction
            public Object run() {
                return new Long(((File) this.val$templateSource).lastModified());
            }
        })).longValue();
    }

    @Override // freemarker.cache.TemplateLoader
    public Reader getReader(Object templateSource, String encoding) throws IOException {
        try {
            return (Reader) AccessController.doPrivileged(new PrivilegedExceptionAction(this, templateSource, encoding) { // from class: freemarker.cache.FileTemplateLoader.4
                private final Object val$templateSource;
                private final String val$encoding;
                private final FileTemplateLoader this$0;

                {
                    this.this$0 = this;
                    this.val$templateSource = templateSource;
                    this.val$encoding = encoding;
                }

                @Override // java.security.PrivilegedExceptionAction
                public Object run() throws IOException {
                    if (!(this.val$templateSource instanceof File)) {
                        throw new IllegalArgumentException(new StringBuffer().append("templateSource is a: ").append(this.val$templateSource.getClass().getName()).toString());
                    }
                    return new InputStreamReader(new FileInputStream((File) this.val$templateSource), this.val$encoding);
                }
            });
        } catch (PrivilegedActionException e) {
            throw ((IOException) e.getException());
        }
    }

    @Override // freemarker.cache.TemplateLoader
    public void closeTemplateSource(Object templateSource) {
    }
}
