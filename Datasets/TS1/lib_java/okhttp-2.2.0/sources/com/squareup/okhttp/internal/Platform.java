package com.squareup.okhttp.internal;

import com.squareup.okhttp.Protocol;
import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import javax.net.ssl.SSLSocket;
import okio.Buffer;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/Platform.class */
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

    public URI toUriLenient(URL url) throws URISyntaxException {
        return url.toURI();
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

    private static Platform findPlatform() {
        try {
            try {
                Class.forName("com.android.org.conscrypt.OpenSSLSocketImpl");
            } catch (ClassNotFoundException e) {
                Class.forName("org.apache.harmony.xnet.provider.jsse.OpenSSLSocketImpl");
            }
            Method trafficStatsTagSocket = null;
            Method trafficStatsUntagSocket = null;
            try {
                Class<?> trafficStats = Class.forName("android.net.TrafficStats");
                trafficStatsTagSocket = trafficStats.getMethod("tagSocket", Socket.class);
                trafficStatsUntagSocket = trafficStats.getMethod("untagSocket", Socket.class);
            } catch (ClassNotFoundException e2) {
            } catch (NoSuchMethodException e3) {
            }
            return new Android(trafficStatsTagSocket, trafficStatsUntagSocket);
        } catch (ClassNotFoundException e4) {
            try {
                Class<?> negoClass = Class.forName("org.eclipse.jetty.alpn.ALPN");
                Class<?> providerClass = Class.forName("org.eclipse.jetty.alpn.ALPN$Provider");
                Class<?> clientProviderClass = Class.forName("org.eclipse.jetty.alpn.ALPN$ClientProvider");
                Class<?> serverProviderClass = Class.forName("org.eclipse.jetty.alpn.ALPN$ServerProvider");
                Method putMethod = negoClass.getMethod("put", SSLSocket.class, providerClass);
                Method getMethod = negoClass.getMethod("get", SSLSocket.class);
                Method removeMethod = negoClass.getMethod("remove", SSLSocket.class);
                return new JdkWithJettyBootPlatform(putMethod, getMethod, removeMethod, clientProviderClass, serverProviderClass);
            } catch (ClassNotFoundException | NoSuchMethodException e5) {
                return new Platform();
            }
        }
    }

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/Platform$Android.class */
    private static class Android extends Platform {
        private static final OptionalMethod<Socket> SET_USE_SESSION_TICKETS = new OptionalMethod<>(null, "setUseSessionTickets", Boolean.TYPE);
        private static final OptionalMethod<Socket> SET_HOSTNAME = new OptionalMethod<>(null, "setHostname", String.class);
        private static final OptionalMethod<Socket> GET_ALPN_SELECTED_PROTOCOL = new OptionalMethod<>(byte[].class, "getAlpnSelectedProtocol", new Class[0]);
        private static final OptionalMethod<Socket> SET_ALPN_PROTOCOLS = new OptionalMethod<>(null, "setAlpnProtocols", byte[].class);
        private final Method trafficStatsTagSocket;
        private final Method trafficStatsUntagSocket;

        private Android(Method trafficStatsTagSocket, Method trafficStatsUntagSocket) {
            this.trafficStatsTagSocket = trafficStatsTagSocket;
            this.trafficStatsUntagSocket = trafficStatsUntagSocket;
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void connectSocket(Socket socket, InetSocketAddress address, int connectTimeout) throws IOException {
            try {
                socket.connect(address, connectTimeout);
            } catch (SecurityException se) {
                IOException ioException = new IOException("Exception in connect");
                ioException.initCause(se);
                throw ioException;
            }
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void configureTlsExtensions(SSLSocket sslSocket, String hostname, List<Protocol> protocols) {
            if (hostname != null) {
                SET_USE_SESSION_TICKETS.invokeOptionalWithoutCheckedException(sslSocket, true);
                SET_HOSTNAME.invokeOptionalWithoutCheckedException(sslSocket, hostname);
            }
            boolean alpnSupported = SET_ALPN_PROTOCOLS.isSupported(sslSocket);
            if (!alpnSupported) {
                return;
            }
            Object[] parameters = {concatLengthPrefixed(protocols)};
            SET_ALPN_PROTOCOLS.invokeWithoutCheckedException(sslSocket, parameters);
        }

        @Override // com.squareup.okhttp.internal.Platform
        public String getSelectedProtocol(SSLSocket socket) {
            byte[] alpnResult;
            boolean alpnSupported = GET_ALPN_SELECTED_PROTOCOL.isSupported(socket);
            if (alpnSupported && (alpnResult = (byte[]) GET_ALPN_SELECTED_PROTOCOL.invokeWithoutCheckedException(socket, new Object[0])) != null) {
                return new String(alpnResult, Util.UTF_8);
            }
            return null;
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
    }

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform.class */
    private static class JdkWithJettyBootPlatform extends Platform {
        private final Method putMethod;
        private final Method getMethod;
        private final Method removeMethod;
        private final Class<?> clientProviderClass;
        private final Class<?> serverProviderClass;

        public JdkWithJettyBootPlatform(Method putMethod, Method getMethod, Method removeMethod, Class<?> clientProviderClass, Class<?> serverProviderClass) {
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
            } catch (IllegalAccessException e) {
                throw new AssertionError(e);
            } catch (InvocationTargetException e2) {
                throw new AssertionError(e2);
            }
        }

        @Override // com.squareup.okhttp.internal.Platform
        public void afterHandshake(SSLSocket sslSocket) {
            try {
                this.removeMethod.invoke(null, sslSocket);
            } catch (IllegalAccessException e) {
                throw new AssertionError();
            } catch (InvocationTargetException e2) {
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
            } catch (IllegalAccessException e) {
                throw new AssertionError();
            } catch (InvocationTargetException e2) {
                throw new AssertionError();
            }
        }
    }

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/Platform$JettyNegoProvider.class */
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
}
