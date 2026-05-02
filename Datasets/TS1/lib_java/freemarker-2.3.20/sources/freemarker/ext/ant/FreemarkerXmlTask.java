package freemarker.ext.ant;

import freemarker.core.Environment;
import freemarker.ext.dom.NodeModel;
import freemarker.ext.xml.NodeListModel;
import freemarker.template.Configuration;
import freemarker.template.SimpleHash;
import freemarker.template.SimpleScalar;
import freemarker.template.Template;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateNodeModel;
import freemarker.template.utility.ClassUtil;
import freemarker.template.utility.SecurityUtilities;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.w3c.dom.Document;
import org.xml.sax.SAXParseException;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/ant/FreemarkerXmlTask.class */
public class FreemarkerXmlTask extends MatchingTask {
    private JythonAntTask prepareModel;
    private JythonAntTask prepareEnvironment;
    private DocumentBuilder builder;
    private File destDir;
    private File baseDir;
    private File templateDir;
    private String templateName;
    private Template parsedTemplate;
    private TemplateModel projectTemplate;
    private TemplateNodeModel projectNode;
    private TemplateModel propertiesTemplate;
    private TemplateModel userPropertiesTemplate;
    private Configuration cfg = new Configuration();
    private long templateFileLastModified = 0;
    private String projectAttribute = null;
    private File projectFile = null;
    private long projectFileLastModified = 0;
    private boolean incremental = true;
    private String extension = ".html";
    private String encoding = SecurityUtilities.getSystemProperty("file.encoding");
    private String templateEncoding = this.encoding;
    private boolean validation = false;
    private String models = "";
    private final Map modelsMap = new HashMap();
    private final DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();

    public FreemarkerXmlTask() {
        this.builderFactory.setNamespaceAware(true);
    }

    public void setBasedir(File dir) {
        this.baseDir = dir;
    }

    public void setDestdir(File dir) {
        this.destDir = dir;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public void setTemplate(String templateName) {
        this.templateName = templateName;
    }

    public void setTemplateDir(File templateDir) throws BuildException {
        this.templateDir = templateDir;
        try {
            this.cfg.setDirectoryForTemplateLoading(templateDir);
        } catch (Exception e) {
            throw new BuildException(e);
        }
    }

    public void setProjectfile(String projectAttribute) {
        this.projectAttribute = projectAttribute;
    }

    public void setIncremental(String incremental) {
        this.incremental = (incremental.equalsIgnoreCase("false") || incremental.equalsIgnoreCase("no") || incremental.equalsIgnoreCase("off")) ? false : true;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }

    public void setTemplateEncoding(String inputEncoding) {
        this.templateEncoding = inputEncoding;
    }

    public void setValidation(boolean validation) {
        this.validation = validation;
    }

    public void setModels(String models) {
        this.models = models;
    }

    public void execute() throws BuildException {
        if (this.baseDir == null) {
            this.baseDir = getProject().getBaseDir();
        }
        if (this.destDir == null) {
            throw new BuildException("destdir attribute must be set!", getLocation());
        }
        File templateFile = null;
        if (this.templateDir == null) {
            if (this.templateName != null) {
                templateFile = new File(this.templateName);
                if (!templateFile.isAbsolute()) {
                    templateFile = new File(getProject().getBaseDir(), this.templateName);
                }
                this.templateDir = templateFile.getParentFile();
                this.templateName = templateFile.getName();
            } else {
                this.templateDir = this.baseDir;
            }
            setTemplateDir(this.templateDir);
        } else if (this.templateName != null) {
            if (new File(this.templateName).isAbsolute()) {
                throw new BuildException("Do not specify an absolute location for the template as well as a templateDir");
            }
            templateFile = new File(this.templateDir, this.templateName);
        }
        if (templateFile != null) {
            this.templateFileLastModified = templateFile.lastModified();
        }
        try {
            if (this.templateName != null) {
                this.parsedTemplate = this.cfg.getTemplate(this.templateName, this.templateEncoding);
            }
            log(new StringBuffer().append("Transforming into: ").append(this.destDir.getAbsolutePath()).toString(), 2);
            if (this.projectAttribute != null && this.projectAttribute.length() > 0) {
                this.projectFile = new File(this.baseDir, this.projectAttribute);
                if (this.projectFile.isFile()) {
                    this.projectFileLastModified = this.projectFile.lastModified();
                } else {
                    log(new StringBuffer().append("Project file is defined, but could not be located: ").append(this.projectFile.getAbsolutePath()).toString(), 2);
                    this.projectFile = null;
                }
            }
            generateModels();
            DirectoryScanner scanner = getDirectoryScanner(this.baseDir);
            this.propertiesTemplate = wrapMap(this.project.getProperties());
            this.userPropertiesTemplate = wrapMap(this.project.getUserProperties());
            this.builderFactory.setValidating(this.validation);
            try {
                this.builder = this.builderFactory.newDocumentBuilder();
                String[] list = scanner.getIncludedFiles();
                for (String str : list) {
                    process(this.baseDir, str, this.destDir);
                }
            } catch (ParserConfigurationException e) {
                throw new BuildException("Could not create document builder", e, getLocation());
            }
        } catch (IOException ioe) {
            throw new BuildException(ioe.toString());
        }
    }

    public void addConfiguredJython(JythonAntTask jythonAntTask) {
        this.prepareEnvironment = jythonAntTask;
    }

    public void addConfiguredPrepareModel(JythonAntTask prepareModel) {
        this.prepareModel = prepareModel;
    }

    public void addConfiguredPrepareEnvironment(JythonAntTask prepareEnvironment) {
        this.prepareEnvironment = prepareEnvironment;
    }

    private void process(File baseDir, String xmlFile, File destDir) throws BuildException {
        File outFile = null;
        File inFile = null;
        try {
            inFile = new File(baseDir, xmlFile);
            outFile = new File(destDir, new StringBuffer().append(xmlFile.substring(0, xmlFile.lastIndexOf(46))).append(this.extension).toString());
            if (!this.incremental || inFile.lastModified() > outFile.lastModified() || this.templateFileLastModified > outFile.lastModified() || this.projectFileLastModified > outFile.lastModified()) {
                ensureDirectoryFor(outFile);
                log(new StringBuffer().append("Input:  ").append(xmlFile).toString(), 2);
                if (this.projectTemplate == null && this.projectFile != null) {
                    Document doc = this.builder.parse(this.projectFile);
                    this.projectTemplate = new NodeListModel(this.builder.parse(this.projectFile));
                    this.projectNode = NodeModel.wrap(doc);
                }
                Document docNode = this.builder.parse(inFile);
                NodeListModel nodeListModel = new NodeListModel(docNode);
                TemplateNodeModel docNodeModel = NodeModel.wrap(docNode);
                HashMap root = new HashMap();
                root.put("document", nodeListModel);
                insertDefaults(root);
                Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), this.encoding));
                try {
                    if (this.parsedTemplate == null) {
                        throw new BuildException("No template file specified in build script or in XML file");
                    }
                    if (this.prepareModel != null) {
                        Map vars = new HashMap();
                        vars.put("model", root);
                        vars.put("doc", docNode);
                        if (this.projectNode != null) {
                            vars.put("project", ((NodeModel) this.projectNode).getNode());
                        }
                        this.prepareModel.execute(vars);
                    }
                    Environment env = this.parsedTemplate.createProcessingEnvironment(root, writer);
                    env.setCurrentVisitorNode(docNodeModel);
                    if (this.prepareEnvironment != null) {
                        Map vars2 = new HashMap();
                        vars2.put("env", env);
                        vars2.put("doc", docNode);
                        if (this.projectNode != null) {
                            vars2.put("project", ((NodeModel) this.projectNode).getNode());
                        }
                        this.prepareEnvironment.execute(vars2);
                    }
                    env.process();
                    writer.flush();
                    writer.close();
                    log(new StringBuffer().append("Output: ").append(outFile).toString(), 2);
                } catch (Throwable th) {
                    writer.close();
                    throw th;
                }
            }
        } catch (SAXParseException spe) {
            Throwable rootCause = spe;
            if (spe.getException() != null) {
                rootCause = spe.getException();
            }
            log(new StringBuffer().append("XML parsing error in ").append(inFile.getAbsolutePath()).toString(), 0);
            log(new StringBuffer().append("Line number ").append(spe.getLineNumber()).toString());
            log(new StringBuffer().append("Column number ").append(spe.getColumnNumber()).toString());
            throw new BuildException(rootCause, getLocation());
        } catch (Throwable e) {
            if (outFile != null && !outFile.delete() && outFile.exists()) {
                log(new StringBuffer().append("Failed to delete ").append(outFile).toString(), 1);
            }
            e.printStackTrace();
            throw new BuildException(e, getLocation());
        }
    }

    private void generateModels() {
        String name;
        String clazz;
        StringTokenizer modelTokenizer = new StringTokenizer(this.models, ",; ");
        while (modelTokenizer.hasMoreTokens()) {
            String modelSpec = modelTokenizer.nextToken();
            int sep = modelSpec.indexOf(61);
            if (sep == -1) {
                clazz = modelSpec;
                int dot = clazz.lastIndexOf(46);
                if (dot == -1) {
                    name = clazz;
                } else {
                    name = clazz.substring(dot + 1);
                }
            } else {
                name = modelSpec.substring(0, sep);
                clazz = modelSpec.substring(sep + 1);
            }
            try {
                this.modelsMap.put(name, ClassUtil.forName(clazz).newInstance());
            } catch (Exception e) {
                throw new BuildException(e);
            }
        }
    }

    private void ensureDirectoryFor(File targetFile) throws BuildException {
        File directory = new File(targetFile.getParent());
        if (!directory.exists() && !directory.mkdirs()) {
            throw new BuildException(new StringBuffer().append("Unable to create directory: ").append(directory.getAbsolutePath()).toString(), getLocation());
        }
    }

    private static TemplateModel wrapMap(Map table) {
        SimpleHash model = new SimpleHash();
        for (Map.Entry entry : table.entrySet()) {
            model.put(String.valueOf(entry.getKey()), new SimpleScalar(String.valueOf(entry.getValue())));
        }
        return model;
    }

    protected void insertDefaults(Map root) {
        root.put("properties", this.propertiesTemplate);
        root.put("userProperties", this.userPropertiesTemplate);
        if (this.projectTemplate != null) {
            root.put("project", this.projectTemplate);
            root.put("project_node", this.projectNode);
        }
        if (this.modelsMap.size() > 0) {
            for (Map.Entry entry : this.modelsMap.entrySet()) {
                root.put(entry.getKey(), entry.getValue());
            }
        }
    }
}
