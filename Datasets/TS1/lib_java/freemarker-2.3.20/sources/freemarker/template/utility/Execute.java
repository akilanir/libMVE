package freemarker.template.utility;

import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/Execute.class */
public class Execute implements TemplateMethodModel {
    private static final int OUTPUT_BUFFER_SIZE = 1024;

    @Override // freemarker.template.TemplateMethodModel
    public Object exec(List arguments) throws TemplateModelException {
        StringBuffer aOutputBuffer = new StringBuffer();
        if (arguments.size() < 1) {
            throw new TemplateModelException("Need an argument to execute");
        }
        String aExecute = (String) arguments.get(0);
        try {
            Process exec = Runtime.getRuntime().exec(aExecute);
            InputStream execOut = exec.getInputStream();
            Reader execReader = new InputStreamReader(execOut);
            char[] buffer = new char[1024];
            for (int bytes_read = execReader.read(buffer); bytes_read > 0; bytes_read = execReader.read(buffer)) {
                aOutputBuffer.append(buffer, 0, bytes_read);
            }
            return aOutputBuffer.toString();
        } catch (IOException ioe) {
            throw new TemplateModelException(ioe.getMessage());
        }
    }
}
