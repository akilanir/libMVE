package freemarker.ext.ant;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.python.util.PythonInterpreter;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/ant/UnlinkedJythonOperationsImpl.class */
public class UnlinkedJythonOperationsImpl implements UnlinkedJythonOperations {
    @Override // freemarker.ext.ant.UnlinkedJythonOperations
    public void execute(String script, Map vars) throws BuildException {
        PythonInterpreter pi = createInterpreter(vars);
        pi.exec(script);
    }

    @Override // freemarker.ext.ant.UnlinkedJythonOperations
    public void execute(File file, Map vars) throws BuildException {
        PythonInterpreter pi = createInterpreter(vars);
        try {
            pi.execfile(file.getCanonicalPath());
        } catch (IOException e) {
            throw new BuildException(e);
        }
    }

    private PythonInterpreter createInterpreter(Map vars) {
        PythonInterpreter pi = new PythonInterpreter();
        for (Map.Entry ent : vars.entrySet()) {
            pi.set((String) ent.getKey(), ent.getValue());
        }
        return pi;
    }
}
