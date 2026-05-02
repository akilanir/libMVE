package org.jivesoftware.smack.provider;

import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.PacketExtension;
import org.xmlpull.mxp1.MXParser;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/provider/ProviderManager.class */
public class ProviderManager {
    private static ProviderManager instance;
    private Map<String, Object> extensionProviders = new ConcurrentHashMap();
    private Map<String, Object> iqProviders = new ConcurrentHashMap();

    public static synchronized ProviderManager getInstance() {
        if (instance == null) {
            instance = new ProviderManager();
        }
        return instance;
    }

    public static synchronized void setInstance(ProviderManager providerManager) {
        if (instance != null) {
            throw new IllegalStateException("ProviderManager singleton already set");
        }
        instance = providerManager;
    }

    protected void initialize() {
        try {
            ClassLoader[] classLoaders = getClassLoaders();
            for (ClassLoader classLoader : classLoaders) {
                Enumeration providerEnum = classLoader.getResources("META-INF/smack.providers");
                while (providerEnum.hasMoreElements()) {
                    URL url = providerEnum.nextElement();
                    InputStream providerStream = null;
                    try {
                        providerStream = url.openStream();
                        XmlPullParser parser = new MXParser();
                        parser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, true);
                        parser.setInput(providerStream, "UTF-8");
                        int eventType = parser.getEventType();
                        do {
                            if (eventType == 2) {
                                if (parser.getName().equals("iqProvider")) {
                                    parser.next();
                                    parser.next();
                                    String elementName = parser.nextText();
                                    parser.next();
                                    parser.next();
                                    String namespace = parser.nextText();
                                    parser.next();
                                    parser.next();
                                    String className = parser.nextText();
                                    String key = getProviderKey(elementName, namespace);
                                    if (!this.iqProviders.containsKey(key)) {
                                        try {
                                            Class provider = Class.forName(className);
                                            if (IQProvider.class.isAssignableFrom(provider)) {
                                                this.iqProviders.put(key, provider.newInstance());
                                            } else if (IQ.class.isAssignableFrom(provider)) {
                                                this.iqProviders.put(key, provider);
                                            }
                                        } catch (ClassNotFoundException cnfe) {
                                            cnfe.printStackTrace();
                                        }
                                    }
                                } else if (parser.getName().equals("extensionProvider")) {
                                    parser.next();
                                    parser.next();
                                    String elementName2 = parser.nextText();
                                    parser.next();
                                    parser.next();
                                    String namespace2 = parser.nextText();
                                    parser.next();
                                    parser.next();
                                    String className2 = parser.nextText();
                                    String key2 = getProviderKey(elementName2, namespace2);
                                    if (!this.extensionProviders.containsKey(key2)) {
                                        try {
                                            Class provider2 = Class.forName(className2);
                                            if (PacketExtensionProvider.class.isAssignableFrom(provider2)) {
                                                this.extensionProviders.put(key2, provider2.newInstance());
                                            } else if (PacketExtension.class.isAssignableFrom(provider2)) {
                                                this.extensionProviders.put(key2, provider2);
                                            }
                                        } catch (ClassNotFoundException cnfe2) {
                                            cnfe2.printStackTrace();
                                        }
                                    }
                                }
                            }
                            eventType = parser.next();
                        } while (eventType != 1);
                        providerStream.close();
                    } catch (Throwable th) {
                        try {
                            providerStream.close();
                        } catch (Exception e) {
                        }
                        throw th;
                    }
                }
            }
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public Object getIQProvider(String elementName, String namespace) {
        String key = getProviderKey(elementName, namespace);
        return this.iqProviders.get(key);
    }

    public Collection<Object> getIQProviders() {
        return Collections.unmodifiableCollection(this.iqProviders.values());
    }

    public void addIQProvider(String elementName, String namespace, Object provider) {
        if (!(provider instanceof IQProvider) && (!(provider instanceof Class) || !IQ.class.isAssignableFrom((Class) provider))) {
            throw new IllegalArgumentException("Provider must be an IQProvider or a Class instance.");
        }
        String key = getProviderKey(elementName, namespace);
        this.iqProviders.put(key, provider);
    }

    public void removeIQProvider(String elementName, String namespace) {
        String key = getProviderKey(elementName, namespace);
        this.iqProviders.remove(key);
    }

    public Object getExtensionProvider(String elementName, String namespace) {
        String key = getProviderKey(elementName, namespace);
        return this.extensionProviders.get(key);
    }

    public void addExtensionProvider(String elementName, String namespace, Object provider) {
        if (!(provider instanceof PacketExtensionProvider) && !(provider instanceof Class)) {
            throw new IllegalArgumentException("Provider must be a PacketExtensionProvider or a Class instance.");
        }
        String key = getProviderKey(elementName, namespace);
        this.extensionProviders.put(key, provider);
    }

    public void removeExtensionProvider(String elementName, String namespace) {
        String key = getProviderKey(elementName, namespace);
        this.extensionProviders.remove(key);
    }

    public Collection<Object> getExtensionProviders() {
        return Collections.unmodifiableCollection(this.extensionProviders.values());
    }

    private String getProviderKey(String elementName, String namespace) {
        StringBuilder buf = new StringBuilder();
        buf.append("<").append(elementName).append("/><").append(namespace).append("/>");
        return buf.toString();
    }

    private ClassLoader[] getClassLoaders() {
        ClassLoader[] classLoaders = {ProviderManager.class.getClassLoader(), Thread.currentThread().getContextClassLoader()};
        List<ClassLoader> loaders = new ArrayList<>();
        for (ClassLoader classLoader : classLoaders) {
            if (classLoader != null) {
                loaders.add(classLoader);
            }
        }
        return (ClassLoader[]) loaders.toArray(new ClassLoader[loaders.size()]);
    }

    private ProviderManager() {
        initialize();
    }
}
