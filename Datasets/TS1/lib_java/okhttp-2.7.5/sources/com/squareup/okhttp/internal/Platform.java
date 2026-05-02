package com.squareup.okhttp.internal;

import android.util.Log;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.internal.tls.AndroidTrustRootIndex;
import com.squareup.okhttp.internal.tls.RealTrustRootIndex;
import com.squareup.okhttp.internal.tls.TrustRootIndex;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.X509TrustManager;
import okio.Buffer;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/Platform.class */
public class Platform {
    private static final Platform PLATFORM = findPlatform();

    public static Platform get() {
        return PLATFORM;
    }

    public String getPrefix() {
        return "OkHttp";
    }

    public void logW(String warning) {
        System.out.println(warning);
    }

    public void tagSocket(Socket socket) throws SocketException {
    }

    public void untagSocket(Socket socket) throws SocketException {
    }

    public X509TrustManager trustManager(SSLSocketFactory sslSocketFactory) {
        return null;
    }

    public TrustRootIndex trustRootIndex(X509TrustManager trustManager) {
        return new RealTrustRootIndex(trustManager.getAcceptedIssuers());
    }

    public void configureTlsExtensions(SSLSocket sslSocket, String hostname, List<Protocol> protocols) {
    }

    public void afterHandshake(SSLSocket sslSocket) {
    }

    public String getSelectedProtocol(SSLSocket socket) {
        return null;
    }

    public void connectSocket(Socket socket, InetSocketAddress address, int connectTimeout) throws IOException {
        socket.connect(address, connectTimeout);
    }

    public void log(String message) {
        System.out.println(message);
    }

    private static Platform findPlatform() {
        Class<?> sslParametersClass;
        try {
            try {
                sslParametersClass = Class.forName("com.android.org.conscrypt.SSLParametersImpl");
            } catch (ClassNotFoundException e) {
                sslParametersClass = Class.forName("org.apache.harmony.xnet.provider.jsse.SSLParametersImpl");
            }
            OptionalMethod<Socket> setUseSessionTickets = new OptionalMethod<>(null, "setUseSessionTickets", Boolean.TYPE);
            OptionalMethod<Socket> setHostname = new OptionalMethod<>(null, "setHostname", String.class);
            Method trafficStatsTagSocket = null;
            Method trafficStatsUntagSocket = null;
            OptionalMethod<Socket> getAlpnSelectedProtocol = null;
            OptionalMethod<Socket> setAlpnProtocols = null;
            try {
                Class<?> trafficStats = Class.forName("android.net.TrafficStats");
                trafficStatsTagSocket = trafficStats.getMethod("tagSocket", Socket.class);
                trafficStatsUntagSocket = trafficStats.getMethod("untagSocket", Socket.class);
                try {
                    Class.forName("android.net.Network");
                    getAlpnSelectedProtocol = new OptionalMethod<>(byte[].class, "getAlpnSelectedProtocol", new Class[0]);
                    setAlpnProtocols = new OptionalMethod<>(null, "setAlpnProtocols", byte[].class);
                } catch (ClassNotFoundException e2) {
                }
            } catch (ClassNotFoundException | NoSuchMethodException e3) {
            }
            return new Android(sslParametersClass, setUseSessionTickets, setHostname, trafficStatsTagSocket, trafficStatsUntagSocket, getAlpnSelectedProtocol, setAlpnProtocols);
        } catch (ClassNotFoundException e4) {
            try {
                Class<?> sslContextClass = Class.forName("sun.security.ssl.SSLContextImpl");
                try {
                    Class<?> negoClass = Class.forName("org.eclipse.jetty.alpn.ALPN");
                    Class<?> providerClass = Class.forName("org.eclipse.jetty.alpn.ALPN$Provider");
                    Class<?> clientProviderClass = Class.forName("org.eclipse.jetty.alpn.ALPN$ClientProvider");
                    Class<?> serverProviderClass = Class.forName("org.eclipse.jetty.alpn.ALPN$ServerProvider");
                    Method putMethod = negoClass.getMethod("put", SSLSocket.class, providerClass);
                    Method getMethod = negoClass.getMethod("get", SSLSocket.class);
                    Method removeMethod = negoClass.getMethod("remove", SSLSocket.class);
                    return new JdkWithJettyBootPlatform(sslContextClass, putMethod, getMethod, removeMethod, clientProviderClass, serverProviderClass);
                } catch (ClassNotFoundException | NoSuchMethodException e5) {
                    return new JdkPlatform(sslContextClass);
                }
            } catch (ClassNotFoundException e6) {
                return new Platform();
            }
        }
    }

    /* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/Platform$Android.class */
    private static class Android extends Platform {
        private static final int MAX_LOG_LENGTH = 4000;
        private final Class<?> sslParametersClass;
        private final OptionalMethod<Socket> setUseSessionTickets;
        private final OptionalMethod<Socket> setHostname;
        private final Method trafficStatsTagSocket;
        private final Method trafficStatsUntagSocket;
        private final OptionalMethod<Socket> getAlpnSelectedProtocol;
        private final OptionalMethod<Socket> setAlpnProtocols;

        public Android(Class<?> sslParametersClass, OptionalMethod<Socket> setUseSessionTickets, OptionalMethod<Socket> setHostname, Method trafficStatsTagSocket, Method trafficStatsUntagSocket, OptionalMethod<Socket> getAlpnSelectedProtocol, OptionalMethod<Socket> setAlpnProtocols) {
            this.sslParametersClass = sslParametersClass;
            this.setUseSessionTickets = setUseSessionTickets;
            this.setHostname = setHostname;
            this.trafficStatsTagSocket = trafficStatsTagSocket;
            this.trafficStatsUntagSocket = trafficStatsUntagSocket;
            this.getAlpnSelectedProtocol = getAlpnSelectedProtocol;
            this.setAlpnProtocols = setAlpnProtocols;
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void connectSocket(Socket socket, InetSocketAddress address, int connectTimeout) throws IOException {
            try {
                socket.connect(address, connectTimeout);
            } catch (AssertionError e) {
                if (!Util.isAndroidGetsocknameError(e)) {
                    throw e;
                }
                throw new IOException(e);
            } catch (SecurityException e2) {
                IOException ioException = new IOException("Exception in connect");
                ioException.initCause(e2);
                throw ioException;
            }
        }

        @Override // com.squareup.okhttp.internal.Platform
        public X509TrustManager trustManager(SSLSocketFactory sslSocketFactory) {
            Object context = readFieldOrNull(sslSocketFactory, this.sslParametersClass, "sslParameters");
            if (context == null) {
                try {
                    Class<?> gmsSslParametersClass = Class.forName("com.google.android.gms.org.conscrypt.SSLParametersImpl", false, sslSocketFactory.getClass().getClassLoader());
                    context = readFieldOrNull(sslSocketFactory, gmsSslParametersClass, "sslParameters");
                } catch (ClassNotFoundException e) {
                    return null;
                }
            }
            X509TrustManager x509TrustManager = (X509TrustManager) readFieldOrNull(context, X509TrustManager.class, "x509TrustManager");
            return x509TrustManager != null ? x509TrustManager : (X509TrustManager) readFieldOrNull(context, X509TrustManager.class, "trustManager");
        }

        @Override // com.squareup.okhttp.internal.Platform
        public TrustRootIndex trustRootIndex(X509TrustManager trustManager) {
            TrustRootIndex result = AndroidTrustRootIndex.get(trustManager);
            return result != null ? result : super.trustRootIndex(trustManager);
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void configureTlsExtensions(SSLSocket sslSocket, String hostname, List<Protocol> protocols) {
            if (hostname != null) {
                this.setUseSessionTickets.invokeOptionalWithoutCheckedException(sslSocket, true);
                this.setHostname.invokeOptionalWithoutCheckedException(sslSocket, hostname);
            }
            if (this.setAlpnProtocols != null && this.setAlpnProtocols.isSupported(sslSocket)) {
                Object[] parameters = {concatLengthPrefixed(protocols)};
                this.setAlpnProtocols.invokeWithoutCheckedException(sslSocket, parameters);
            }
        }

        @Override // com.squareup.okhttp.internal.Platform
        public String getSelectedProtocol(SSLSocket socket) {
            byte[] alpnResult;
            if (this.getAlpnSelectedProtocol == null || !this.getAlpnSelectedProtocol.isSupported(socket) || (alpnResult = (byte[]) this.getAlpnSelectedProtocol.invokeWithoutCheckedException(socket, new Object[0])) == null) {
                return null;
            }
            return new String(alpnResult, Util.UTF_8);
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void tagSocket(Socket socket) throws SocketException {
            if (this.trafficStatsTagSocket == null) {
                return;
            }
            try {
                this.trafficStatsTagSocket.invoke(null, socket);
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            } catch (InvocationTargetException e2) {
                throw new RuntimeException(e2.getCause());
            }
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void untagSocket(Socket socket) throws SocketException {
            if (this.trafficStatsUntagSocket == null) {
                return;
            }
            try {
                this.trafficStatsUntagSocket.invoke(null, socket);
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            } catch (InvocationTargetException e2) {
                throw new RuntimeException(e2.getCause());
            }
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void log(String message) {
            int i = 0;
            int length = message.length();
            while (i < length) {
                int newline = message.indexOf(10, i);
                int newline2 = newline != -1 ? newline : length;
                do {
                    int end = Math.min(newline2, i + MAX_LOG_LENGTH);
                    Log.d("OkHttp", message.substring(i, end));
                    i = end;
                } while (i < newline2);
                i++;
            }
        }
    }

    /* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/Platform$JdkPlatform.class */
    private static class JdkPlatform extends Platform {
        private final Class<?> sslContextClass;

        public JdkPlatform(Class<?> sslContextClass) {
            this.sslContextClass = sslContextClass;
        }

        @Override // com.squareup.okhttp.internal.Platform
        public X509TrustManager trustManager(SSLSocketFactory sslSocketFactory) {
            Object context = readFieldOrNull(sslSocketFactory, this.sslContextClass, "context");
            if (context == null) {
                return null;
            }
            return (X509TrustManager) readFieldOrNull(context, X509TrustManager.class, "trustManager");
        }
    }

    /* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform.class */
    private static class JdkWithJettyBootPlatform extends JdkPlatform {
        private final Method putMethod;
        private final Method getMethod;
        private final Method removeMethod;
        private final Class<?> clientProviderClass;
        private final Class<?> serverProviderClass;

        public JdkWithJettyBootPlatform(Class<?> sslContextClass, Method putMethod, Method getMethod, Method removeMethod, Class<?> clientProviderClass, Class<?> serverProviderClass) {
            super(sslContextClass);
            this.putMethod = putMethod;
            this.getMethod = getMethod;
            this.removeMethod = removeMethod;
            this.clientProviderClass = clientProviderClass;
            this.serverProviderClass = serverProviderClass;
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void configureTlsExtensions(SSLSocket sslSocket, String hostname, List<Protocol> protocols) {
            List<String> names = new ArrayList<>(protocols.size());
            int size = protocols.size();
            for (int i = 0; i < size; i++) {
                Protocol protocol = protocols.get(i);
                if (protocol != Protocol.HTTP_1_0) {
                    names.add(protocol.toString());
                }
            }
            try {
                Object provider = Proxy.newProxyInstance(Platform.class.getClassLoader(), new Class[]{this.clientProviderClass, this.serverProviderClass}, new JettyNegoProvider(names));
                this.putMethod.invoke(null, sslSocket, provider);
            } catch (IllegalAccessException | InvocationTargetException e) {
                throw new AssertionError(e);
            }
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void afterHandshake(SSLSocket sslSocket) {
            try {
                this.removeMethod.invoke(null, sslSocket);
            } catch (IllegalAccessException | InvocationTargetException e) {
                throw new AssertionError();
            }
        }

        @Override // com.squareup.okhttp.internal.Platform
        public String getSelectedProtocol(SSLSocket socket) {
            try {
                JettyNegoProvider provider = (JettyNegoProvider) Proxy.getInvocationHandler(this.getMethod.invoke(null, socket));
                if (!provider.unsupported && provider.selected == null) {
                    Internal.logger.log(Level.INFO, "ALPN callback dropped: SPDY and HTTP/2 are disabled. Is alpn-boot on the boot class path?");
                    return null;
                }
                if (provider.unsupported) {
                    return null;
                }
                return provider.selected;
            } catch (IllegalAccessException | InvocationTargetException e) {
                throw new AssertionError();
            }
        }
    }

    /* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/Platform$JettyNegoProvider.class */
    private static class JettyNegoProvider implements InvocationHandler {
        private final List<String> protocols;
        private boolean unsupported;
        private String selected;

        public JettyNegoProvider(List<String> protocols) {
            this.protocols = protocols;
        }

        @Override // java.lang.reflect.InvocationHandler
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            String methodName = method.getName();
            Class<?> returnType = method.getReturnType();
            if (args == null) {
                args = Util.EMPTY_STRING_ARRAY;
            }
            if (methodName.equals("supports") && Boolean.TYPE == returnType) {
                return true;
            }
            if (methodName.equals("unsupported") && Void.TYPE == returnType) {
                this.unsupported = true;
                return null;
            }
            if (methodName.equals("protocols") && args.length == 0) {
                return this.protocols;
            }
            if ((methodName.equals("selectProtocol") || methodName.equals("select")) && String.class == returnType && args.length == 1 && (args[0] instanceof List)) {
                List<String> peerProtocols = (List) args[0];
                int size = peerProtocols.size();
                for (int i = 0; i < size; i++) {
                    if (this.protocols.contains(peerProtocols.get(i))) {
                        String str = peerProtocols.get(i);
                        this.selected = str;
                        return str;
                    }
                }
                String str2 = this.protocols.get(0);
                this.selected = str2;
                return str2;
            }
            if ((methodName.equals("protocolSelected") || methodName.equals("selected")) && args.length == 1) {
                this.selected = (String) args[0];
                return null;
            }
            return method.invoke(this, args);
        }
    }

    static byte[] concatLengthPrefixed(List<Protocol> protocols) {
        Buffer result = new Buffer();
        int size = protocols.size();
        for (int i = 0; i < size; i++) {
            Protocol protocol = protocols.get(i);
            if (protocol != Protocol.HTTP_1_0) {
                result.writeByte(protocol.toString().length());
                result.writeUtf8(protocol.toString());
            }
        }
        return result.readByteArray();
    }

    static <T> T readFieldOrNull(Object obj, Class<T> cls, String str) {
        Object readFieldOrNull;
        Class<?> cls2 = obj.getClass();
        while (true) {
            Class<?> cls3 = cls2;
            if (cls3 != Object.class) {
                try {
                    Field declaredField = cls3.getDeclaredField(str);
                    declaredField.setAccessible(true);
                    Object obj2 = declaredField.get(obj);
                    if (obj2 == null || !cls.isInstance(obj2)) {
                        return null;
                    }
                    return cls.cast(obj2);
                } catch (IllegalAccessException e) {
                    throw new AssertionError();
                } catch (NoSuchFieldException e2) {
                    cls2 = cls3.getSuperclass();
                }
            } else {
                if (str.equals("delegate") || (readFieldOrNull = readFieldOrNull(obj, Object.class, "delegate")) == null) {
                    return null;
                }
                return (T) readFieldOrNull(readFieldOrNull, cls, str);
            }
        }
    }
}
