package freemarker.ext.ant;

import freemarker.template.utility.ClassUtil;
import java.io.File;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.Task;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/ant/JythonAntTask.class */
public class JythonAntTask extends Task {
    private File scriptFile;
    private String script = "";
    private UnlinkedJythonOperations jythonOps;

    public void setFile(File scriptFile) throws BuildException {
        ensureJythonOpsExists();
        this.scriptFile = scriptFile;
    }

    public void addText(String text) {
        this.script = new StringBuffer().append(this.script).append(text).toString();
    }

    public void execute(Map vars) throws BuildException {
        if (this.scriptFile != null) {
            ensureJythonOpsExists();
            this.jythonOps.execute(this.scriptFile, vars);
        }
        if (this.script.trim().length() > 0) {
            ensureJythonOpsExists();
            String finalScript = ProjectHelper.replaceProperties(this.project, this.script, this.project.getProperties());
            this.jythonOps.execute(finalScript, vars);
        }
    }

    private void ensureJythonOpsExists() {
        if (this.jythonOps == null) {
            try {
                Class clazz = ClassUtil.forName("freemarker.ext.ant.UnlinkedJythonOperationsImpl");
                try {
                    this.jythonOps = (UnlinkedJythonOperations) clazz.newInstance();
                } catch (Exception e) {
                    throw new RuntimeException(new StringBuffer().append("An exception has been thrown when trying to create a freemarker.ext.ant.JythonAntTask object. The exception was: ").append(e).toString());
                }
            } catch (ClassNotFoundException e2) {
                throw new RuntimeException(new StringBuffer().append("A ClassNotFoundException has been thrown when trying to get the freemarker.ext.ant.UnlinkedJythonOperationsImpl class. The error message was: ").append(e2.getMessage()).toString());
            }
        }
    }
}
