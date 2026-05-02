package org.msgpack.util;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.tools.DiagnosticCollector;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.StandardLocation;
import javax.tools.ToolProvider;
import org.msgpack.template.TemplateRegistry;
import org.msgpack.template.builder.JavassistTemplateBuilder;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/util/TemplatePrecompiler.class */
public class TemplatePrecompiler {
    private static final Logger LOG = Logger.getLogger(TemplatePrecompiler.class.getName());
    public static final String DEST = "msgpack.template.destdir";
    public static final String DEFAULT_DEST = ".";

    public static void saveTemplates(String[] classNames) throws IOException, ClassNotFoundException {
        TemplateRegistry registry = new TemplateRegistry(null);
        List<String> ret = new ArrayList<>();
        for (String className : classNames) {
            matchClassNames(ret, className);
        }
        List<Class<?>> ret0 = toClass(ret);
        for (Class<?> c : ret0) {
            saveTemplateClass(registry, c);
        }
    }

    private static void matchClassNames(List<String> ret, String className) throws IOException {
        String packageName = className.substring(0, className.lastIndexOf(46));
        String relativedName = className.substring(className.lastIndexOf(46) + 1, className.length());
        String patName = relativedName.replace("*", "(\\w+)");
        Pattern pat = Pattern.compile(patName);
        JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
        StandardJavaFileManager standardFileManager = compiler.getStandardFileManager(new DiagnosticCollector(), (Locale) null, (Charset) null);
        HashSet<JavaFileObject.Kind> kind = new HashSet<JavaFileObject.Kind>() { // from class: org.msgpack.util.TemplatePrecompiler.1
            {
                add(JavaFileObject.Kind.CLASS);
            }
        };
        for (JavaFileObject f : standardFileManager.list(StandardLocation.PLATFORM_CLASS_PATH, packageName, kind, false)) {
            String relatived0 = f.getName();
            String name0 = relatived0.substring(0, relatived0.length() - ".class".length());
            Matcher m = pat.matcher(name0);
            if (m.matches()) {
                String name = packageName + '.' + name0;
                if (!ret.contains(name)) {
                    ret.add(name);
                }
            }
        }
    }

    private static List<Class<?>> toClass(List<String> classNames) throws ClassNotFoundException {
        List<Class<?>> ret = new ArrayList<>(classNames.size());
        ClassLoader cl = TemplatePrecompiler.class.getClassLoader();
        for (String className : classNames) {
            Class<?> c = cl.loadClass(className);
            ret.add(c);
        }
        return ret;
    }

    public static void saveTemplateClasses(TemplateRegistry registry, Class<?>[] targetClasses) throws IOException {
        for (Class<?> c : targetClasses) {
            saveTemplateClass(registry, c);
        }
    }

    public static void saveTemplateClass(TemplateRegistry registry, Class<?> targetClass) throws IOException {
        LOG.info("Saving template of " + targetClass.getName() + "...");
        Properties props = System.getProperties();
        String distDirName = getDirName(props, DEST, DEFAULT_DEST);
        if (targetClass.isEnum()) {
            throw new UnsupportedOperationException("Not supported enum type yet: " + targetClass.getName());
        }
        new JavassistTemplateBuilder(registry).writeTemplate(targetClass, distDirName);
        LOG.info("Saved .class file of template class of " + targetClass.getName());
    }

    public static boolean deleteTemplateClass(Class<?> targetClass) throws IOException {
        LOG.info("Deleting template of " + targetClass.getName() + "...");
        Properties props = System.getProperties();
        String distDirName = getDirName(props, DEST, DEFAULT_DEST);
        String targetClassName = targetClass.getName();
        String targetClassFileName = targetClassName.replace('.', File.separatorChar) + "_$$_Template.class";
        File targetFile = new File(distDirName + File.separatorChar + targetClassFileName);
        boolean deleted = false;
        if (!targetFile.isDirectory() && targetFile.exists()) {
            deleted = targetFile.delete();
        }
        LOG.info("Deleted .class file of template class of " + targetClass.getName());
        return deleted;
    }

    private static String getDirName(Properties props, String dirName, String defaultDirName) throws IOException {
        String dName = props.getProperty(dirName, defaultDirName);
        File d = new File(dName);
        if (!d.isDirectory() && !d.exists()) {
            throw new IOException("Directory not exists: " + dName);
        }
        return d.getAbsolutePath();
    }

    public static void main(String[] args) throws Exception {
        saveTemplates(args);
    }
}
