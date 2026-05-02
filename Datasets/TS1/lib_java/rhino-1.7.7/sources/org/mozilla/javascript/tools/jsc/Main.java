package org.mozilla.javascript.tools.jsc;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import org.mozilla.javascript.CompilerEnvirons;
import org.mozilla.javascript.optimizer.ClassCompiler;
import org.mozilla.javascript.tools.SourceReader;
import org.mozilla.javascript.tools.ToolErrorReporter;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/jsc/Main.class */
public class Main {
    private boolean printHelp;
    private ToolErrorReporter reporter = new ToolErrorReporter(true);
    private CompilerEnvirons compilerEnv = new CompilerEnvirons();
    private ClassCompiler compiler;
    private String targetName;
    private String targetPackage;
    private String destinationDir;
    private String characterEncoding;

    public static void main(String[] args) {
        Main main = new Main();
        String[] args2 = main.processOptions(args);
        if (args2 == null) {
            if (main.printHelp) {
                System.out.println(ToolErrorReporter.getMessage("msg.jsc.usage", Main.class.getName()));
                System.exit(0);
            }
            System.exit(1);
        }
        if (!main.reporter.hasReportedError()) {
            main.processSource(args2);
        }
    }

    public Main() {
        this.compilerEnv.setErrorReporter(this.reporter);
        this.compiler = new ClassCompiler(this.compilerEnv);
    }

    /* JADX WARN: Removed duplicated region for block: B:116:0x0294 A[PHI: r8
      0x0294: PHI (r8v8 'i' int) = (r8v7 'i' int), (r8v14 'i' int) binds: [B:89:0x0205, B:91:0x020e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:126:0x02d0 A[PHI: r8
      0x02d0: PHI (r8v9 'i' int) = (r8v8 'i' int), (r8v13 'i' int) binds: [B:117:0x029a, B:119:0x02a3] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:140:0x0350 A[PHI: r8
      0x0350: PHI (r8v10 'i' int) = (r8v9 'i' int), (r8v12 'i' int) binds: [B:127:0x02d6, B:129:0x02df] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00af A[Catch: NumberFormatException -> 0x00e1, PHI: r8
      0x00af: PHI (r8v2 'i' int) = (r8v1 'i' int), (r8v20 'i' int) binds: [B:28:0x008f, B:30:0x0098] A[DONT_GENERATE, DONT_INLINE], TRY_ENTER, TryCatch #0 {NumberFormatException -> 0x00e1, blocks: (B:27:0x0089, B:29:0x0092, B:31:0x009b, B:32:0x00af, B:34:0x00b8, B:36:0x00c1, B:38:0x00ca), top: B:150:0x0089 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00eb A[PHI: r8
      0x00eb: PHI (r8v4 'i' int) = (r8v3 'i' int), (r8v2 'i' int) binds: [B:37:0x00c7, B:35:0x00be] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x013b A[PHI: r8
      0x013b: PHI (r8v5 'i' int) = (r8v4 'i' int), (r8v17 'i' int) binds: [B:52:0x0122, B:54:0x012b] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0157 A[PHI: r8
      0x0157: PHI (r8v6 'i' int) = (r8v5 'i' int), (r8v16 'i' int) binds: [B:57:0x0141, B:59:0x014a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01ee A[PHI: r8
      0x01ee: PHI (r8v7 'i' int) = (r8v6 'i' int), (r8v15 'i' int) binds: [B:62:0x015d, B:64:0x0166] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String[] processOptions(java.lang.String[] r7) {
        /*
            Method dump skipped, instructions count: 898
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.tools.jsc.Main.processOptions(java.lang.String[]):java.lang.String[]");
    }

    private static void badUsage(String s) {
        System.err.println(ToolErrorReporter.getMessage("msg.jsc.bad.usage", Main.class.getName(), s));
    }

    public void processSource(String[] filenames) {
        for (int i = 0; i != filenames.length; i++) {
            String filename = filenames[i];
            if (!filename.endsWith(".js")) {
                addError("msg.extension.not.js", filename);
                return;
            }
            File f = new File(filename);
            String source = readSource(f);
            if (source == null) {
                return;
            }
            String mainClassName = this.targetName;
            if (mainClassName == null) {
                String name = f.getName();
                String nojs = name.substring(0, name.length() - 3);
                mainClassName = getClassName(nojs);
            }
            if (this.targetPackage.length() != 0) {
                mainClassName = this.targetPackage + "." + mainClassName;
            }
            Object[] compiled = this.compiler.compileToClassFiles(source, filename, 1, mainClassName);
            if (compiled == null || compiled.length == 0) {
                return;
            }
            File targetTopDir = null;
            if (this.destinationDir != null) {
                targetTopDir = new File(this.destinationDir);
            } else {
                String parent = f.getParent();
                if (parent != null) {
                    targetTopDir = new File(parent);
                }
            }
            for (int j = 0; j != compiled.length; j += 2) {
                String className = (String) compiled[j];
                byte[] bytes = (byte[]) compiled[j + 1];
                File outfile = getOutputFile(targetTopDir, className);
                try {
                    FileOutputStream os = new FileOutputStream(outfile);
                    try {
                        os.write(bytes);
                        os.close();
                    } catch (Throwable th) {
                        os.close();
                        throw th;
                    }
                } catch (IOException ioe) {
                    addFormatedError(ioe.toString());
                }
            }
        }
    }

    private String readSource(File f) {
        String absPath = f.getAbsolutePath();
        if (!f.isFile()) {
            addError("msg.jsfile.not.found", absPath);
            return null;
        }
        try {
            return (String) SourceReader.readFileOrUrl(absPath, true, this.characterEncoding);
        } catch (FileNotFoundException e) {
            addError("msg.couldnt.open", absPath);
            return null;
        } catch (IOException ioe) {
            addFormatedError(ioe.toString());
            return null;
        }
    }

    private File getOutputFile(File parentDir, String className) {
        String path = className.replace('.', File.separatorChar);
        File f = new File(parentDir, path.concat(".class"));
        String dirPath = f.getParent();
        if (dirPath != null) {
            File dir = new File(dirPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
        }
        return f;
    }

    String getClassName(String name) {
        char[] s = new char[name.length() + 1];
        int j = 0;
        if (!Character.isJavaIdentifierStart(name.charAt(0))) {
            j = 0 + 1;
            s[0] = '_';
        }
        int i = 0;
        while (i < name.length()) {
            char c = name.charAt(i);
            if (Character.isJavaIdentifierPart(c)) {
                s[j] = c;
            } else {
                s[j] = '_';
            }
            i++;
            j++;
        }
        return new String(s).trim();
    }

    private static void p(String s) {
        System.out.println(s);
    }

    private void addError(String messageId, String arg) {
        String msg;
        if (arg == null) {
            msg = ToolErrorReporter.getMessage(messageId);
        } else {
            msg = ToolErrorReporter.getMessage(messageId, arg);
        }
        addFormatedError(msg);
    }

    private void addFormatedError(String message) {
        this.reporter.error(message, null, -1, null, -1);
    }
}
