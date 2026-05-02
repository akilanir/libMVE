package ch.qos.logback.classic.util;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.android.CommonPathUtil;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.status.InfoStatus;
import ch.qos.logback.core.status.StatusManager;
import ch.qos.logback.core.util.Loader;
import ch.qos.logback.core.util.OptionHelper;
import java.io.File;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/util/ContextInitializer.class */
public class ContextInitializer {
    public static final String AUTOCONFIG_FILE = "logback.xml";
    public static final String CONFIG_FILE_PROPERTY = "logback.configurationFile";
    public static final String STATUS_LISTENER_CLASS = "logback.statusListenerClass";
    private static final String ASSETS_DIR = CommonPathUtil.getAssetsDirectoryPath();
    final ClassLoader classLoader = Loader.getClassLoaderOfObject(this);
    final LoggerContext loggerContext;

    public ContextInitializer(LoggerContext loggerContext) {
        this.loggerContext = loggerContext;
    }

    private URL findConfigFileFromSystemProperties(boolean z) {
        URL url;
        String systemProperty = OptionHelper.getSystemProperty(CONFIG_FILE_PROPERTY);
        if (systemProperty == null) {
            return null;
        }
        URL url2 = null;
        try {
            try {
                File file = new File(systemProperty);
                if (file.exists() && file.isFile()) {
                    if (z) {
                        statusOnResourceSearch(systemProperty, this.classLoader, systemProperty);
                    }
                    url = file.toURI().toURL();
                } else {
                    url = new URL(systemProperty);
                }
                URL url3 = url;
                if (z) {
                    statusOnResourceSearch(systemProperty, this.classLoader, url != null ? url.toString() : null);
                }
                return url3;
            } catch (MalformedURLException e) {
                URL resource = Loader.getResource(systemProperty, this.classLoader);
                if (resource != null) {
                    if (z) {
                        statusOnResourceSearch(systemProperty, this.classLoader, resource != null ? resource.toString() : null);
                    }
                    return resource;
                }
                if (!z) {
                    return null;
                }
                statusOnResourceSearch(systemProperty, this.classLoader, resource != null ? resource.toString() : null);
                return null;
            }
        } catch (Throwable th) {
            if (z) {
                statusOnResourceSearch(systemProperty, this.classLoader, 0 != 0 ? url2.toString() : null);
            }
            throw th;
        }
    }

    private InputStream findConfigFileURLFromAssets(boolean z) {
        return getResource(ASSETS_DIR + "/" + AUTOCONFIG_FILE, this.classLoader, z);
    }

    private InputStream getResource(String str, ClassLoader classLoader, boolean z) {
        InputStream resourceAsStream = classLoader.getResourceAsStream(str);
        if (z) {
            String str2 = null;
            if (resourceAsStream != null) {
                str2 = str;
            }
            statusOnResourceSearch(str, classLoader, str2);
        }
        return resourceAsStream;
    }

    public void autoConfig() throws JoranException {
        InputStream findConfigFileURLFromAssets;
        URL findConfigFileFromSystemProperties;
        StatusListenerConfigHelper.installIfAsked(this.loggerContext);
        boolean z = false;
        JoranConfigurator joranConfigurator = new JoranConfigurator();
        joranConfigurator.setContext(this.loggerContext);
        if (0 == 0 && (findConfigFileFromSystemProperties = findConfigFileFromSystemProperties(true)) != null) {
            joranConfigurator.doConfigure(findConfigFileFromSystemProperties);
            z = true;
        }
        if (z || (findConfigFileURLFromAssets = findConfigFileURLFromAssets(true)) == null) {
            return;
        }
        joranConfigurator.doConfigure(findConfigFileURLFromAssets);
    }

    private void statusOnResourceSearch(String str, ClassLoader classLoader, String str2) {
        StatusManager statusManager = this.loggerContext.getStatusManager();
        if (str2 == null) {
            statusManager.add(new InfoStatus("Could NOT find resource [" + str + "]", this.loggerContext));
        } else {
            statusManager.add(new InfoStatus("Found resource [" + str + "] at [" + str2 + "]", this.loggerContext));
        }
    }
}
