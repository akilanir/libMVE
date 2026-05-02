package korex.activation;

import com.sun.activation.registries.LogSupport;
import com.sun.activation.registries.MimeTypeFile;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Vector;

/* loaded from: kore-javamail-1.0.2.jar:korex/activation/MimetypesFileTypeMap.class */
public class MimetypesFileTypeMap extends FileTypeMap {
    private MimeTypeFile[] DB;
    private static final int PROG = 0;
    private static MimeTypeFile defDB = null;
    private static String defaultType = "application/octet-stream";

    public MimetypesFileTypeMap() {
        Vector dbv = new Vector(5);
        dbv.addElement(null);
        LogSupport.log("MimetypesFileTypeMap: load HOME");
        try {
            String user_home = System.getProperty("user.home");
            if (user_home != null) {
                String path = user_home + File.separator + ".mime.types";
                MimeTypeFile mf = loadFile(path);
                if (mf != null) {
                    dbv.addElement(mf);
                }
            }
        } catch (SecurityException e) {
        }
        LogSupport.log("MimetypesFileTypeMap: load SYS");
        try {
            String system_mimetypes = System.getProperty("java.home") + File.separator + "lib" + File.separator + "mime.types";
            MimeTypeFile mf2 = loadFile(system_mimetypes);
            if (mf2 != null) {
                dbv.addElement(mf2);
            }
        } catch (SecurityException e2) {
        }
        LogSupport.log("MimetypesFileTypeMap: load JAR");
        loadAllResources(dbv, "META-INF/mime.types");
        LogSupport.log("MimetypesFileTypeMap: load DEF");
        synchronized (MimetypesFileTypeMap.class) {
            if (defDB == null) {
                defDB = loadResource("/META-INF/mimetypes.default");
            }
        }
        if (defDB != null) {
            dbv.addElement(defDB);
        }
        this.DB = new MimeTypeFile[dbv.size()];
        dbv.copyInto(this.DB);
    }

    private MimeTypeFile loadResource(String name) {
        InputStream clis = null;
        try {
            try {
                InputStream clis2 = SecuritySupport.getResourceAsStream(getClass(), name);
                if (clis2 != null) {
                    MimeTypeFile mf = new MimeTypeFile(clis2);
                    if (LogSupport.isLoggable()) {
                        LogSupport.log("MimetypesFileTypeMap: successfully loaded mime types file: " + name);
                    }
                    if (clis2 != null) {
                        try {
                            clis2.close();
                        } catch (IOException e) {
                        }
                    }
                    return mf;
                }
                if (LogSupport.isLoggable()) {
                    LogSupport.log("MimetypesFileTypeMap: not loading mime types file: " + name);
                }
                if (clis2 != null) {
                    try {
                        clis2.close();
                    } catch (IOException e2) {
                        return null;
                    }
                }
                return null;
            } catch (Throwable th) {
                if (0 != 0) {
                    try {
                        clis.close();
                    } catch (IOException e3) {
                        throw th;
                    }
                }
                throw th;
            }
        } catch (IOException e4) {
            if (LogSupport.isLoggable()) {
                LogSupport.log("MimetypesFileTypeMap: can't load " + name, e4);
            }
            if (0 != 0) {
                try {
                    clis.close();
                } catch (IOException e5) {
                    return null;
                }
            }
            return null;
        } catch (SecurityException sex) {
            if (LogSupport.isLoggable()) {
                LogSupport.log("MimetypesFileTypeMap: can't load " + name, sex);
            }
            if (0 != 0) {
                try {
                    clis.close();
                } catch (IOException e6) {
                    return null;
                }
            }
            return null;
        }
    }

    private void loadAllResources(Vector v, String name) {
        boolean anyLoaded = false;
        try {
            ClassLoader cld = SecuritySupport.getContextClassLoader();
            if (cld == null) {
                cld = getClass().getClassLoader();
            }
            URL[] urls = cld != null ? SecuritySupport.getResources(cld, name) : SecuritySupport.getSystemResources(name);
            if (urls != null) {
                if (LogSupport.isLoggable()) {
                    LogSupport.log("MimetypesFileTypeMap: getResources");
                }
                for (URL url : urls) {
                    InputStream clis = null;
                    if (LogSupport.isLoggable()) {
                        LogSupport.log("MimetypesFileTypeMap: URL " + url);
                    }
                    try {
                        try {
                            clis = SecuritySupport.openStream(url);
                            if (clis != null) {
                                v.addElement(new MimeTypeFile(clis));
                                anyLoaded = true;
                                if (LogSupport.isLoggable()) {
                                    LogSupport.log("MimetypesFileTypeMap: successfully loaded mime types from URL: " + url);
                                }
                            } else if (LogSupport.isLoggable()) {
                                LogSupport.log("MimetypesFileTypeMap: not loading mime types from URL: " + url);
                            }
                            if (clis != null) {
                                try {
                                    clis.close();
                                } catch (IOException e) {
                                }
                            }
                        } catch (Throwable th) {
                            if (clis != null) {
                                try {
                                    clis.close();
                                } catch (IOException e2) {
                                    throw th;
                                }
                            }
                            throw th;
                        }
                    } catch (IOException ioex) {
                        if (LogSupport.isLoggable()) {
                            LogSupport.log("MimetypesFileTypeMap: can't load " + url, ioex);
                        }
                        if (clis != null) {
                            try {
                                clis.close();
                            } catch (IOException e3) {
                            }
                        }
                    } catch (SecurityException sex) {
                        if (LogSupport.isLoggable()) {
                            LogSupport.log("MimetypesFileTypeMap: can't load " + url, sex);
                        }
                        if (clis != null) {
                            try {
                                clis.close();
                            } catch (IOException e4) {
                            }
                        }
                    }
                }
            }
        } catch (Exception ex) {
            if (LogSupport.isLoggable()) {
                LogSupport.log("MimetypesFileTypeMap: can't load " + name, ex);
            }
        }
        if (anyLoaded) {
            return;
        }
        LogSupport.log("MimetypesFileTypeMap: !anyLoaded");
        MimeTypeFile mf = loadResource("/" + name);
        if (mf != null) {
            v.addElement(mf);
        }
    }

    private MimeTypeFile loadFile(String name) {
        MimeTypeFile mtf = null;
        try {
            mtf = new MimeTypeFile(name);
        } catch (IOException e) {
        }
        return mtf;
    }

    public MimetypesFileTypeMap(String mimeTypeFileName) throws IOException {
        this();
        this.DB[0] = new MimeTypeFile(mimeTypeFileName);
    }

    public MimetypesFileTypeMap(InputStream is) {
        this();
        try {
            this.DB[0] = new MimeTypeFile(is);
        } catch (IOException e) {
        }
    }

    public synchronized void addMimeTypes(String mime_types) {
        if (this.DB[0] == null) {
            this.DB[0] = new MimeTypeFile();
        }
        this.DB[0].appendToRegistry(mime_types);
    }

    @Override // korex.activation.FileTypeMap
    public String getContentType(File f) {
        return getContentType(f.getName());
    }

    @Override // korex.activation.FileTypeMap
    public synchronized String getContentType(String filename) {
        String result;
        int dot_pos = filename.lastIndexOf(".");
        if (dot_pos < 0) {
            return defaultType;
        }
        String file_ext = filename.substring(dot_pos + 1);
        if (file_ext.length() == 0) {
            return defaultType;
        }
        for (int i = 0; i < this.DB.length; i++) {
            if (this.DB[i] != null && (result = this.DB[i].getMIMETypeString(file_ext)) != null) {
                return result;
            }
        }
        return defaultType;
    }
}
