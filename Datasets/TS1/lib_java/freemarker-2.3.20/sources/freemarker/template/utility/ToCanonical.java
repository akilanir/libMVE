package freemarker.template.utility;

import freemarker.template.Configuration;
import freemarker.template.Template;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/ToCanonical.class */
public class ToCanonical {
    static Configuration config = Configuration.getDefaultConfiguration();

    public static void main(String[] args) {
        config.setWhitespaceStripping(false);
        if (args.length == 0) {
            usage();
        }
        for (String str : args) {
            File f = new File(str);
            if (!f.exists()) {
                System.err.println(new StringBuffer().append("File ").append(f).append(" doesn't exist.").toString());
            }
            try {
                convertFile(f);
            } catch (Exception e) {
                System.err.println(new StringBuffer().append("Error converting file: ").append(f).toString());
                e.printStackTrace();
            }
        }
    }

    static void convertFile(File f) throws IOException {
        File fullPath = f.getAbsoluteFile();
        File dir = fullPath.getParentFile();
        String filename = fullPath.getName();
        File convertedFile = new File(dir, new StringBuffer().append(filename).append(".canonical").toString());
        config.setDirectoryForTemplateLoading(dir);
        Template template = config.getTemplate(filename);
        FileWriter output = new FileWriter(convertedFile);
        try {
            template.dump(output);
            output.close();
        } catch (Throwable th) {
            output.close();
            throw th;
        }
    }

    static void usage() {
        System.err.println("Usage: java freemarker.template.utility.ToCanonical <filename(s)>");
    }
}
