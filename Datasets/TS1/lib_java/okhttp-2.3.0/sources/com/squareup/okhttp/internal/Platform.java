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

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/Platform.class */
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
            return new Android(setUseSessionTickets, setHostname, trafficStatsTagSocket, trafficStatsUntagSocket, getAlpnSelectedProtocol, setAlpnProtocols);
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

    /* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/Platform$Android.class */
    private static class Android extends Platform {
        private final OptionalMethod<Socket> setUseSessionTickets;
        private final OptionalMethod<Socket> setHostname;
        private final Method trafficStatsTagSocket;
        private final Method trafficStatsUntagSocket;
        private final OptionalMethod<Socket> getAlpnSelectedProtocol;
        private final OptionalMethod<Socket> setAlpnProtocols;

        public Android(OptionalMethod<Socket> setUseSessionTickets, OptionalMethod<Socket> setHostname, Method trafficStatsTagSocket, Method trafficStatsUntagSocket, OptionalMethod<Socket> getAlpnSelectedProtocol, OptionalMethod<Socket> setAlpnProtocols) {
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
            } catch (SecurityException se) {
                IOException ioException = new IOException("Exception in connect");
                ioException.initCause(se);
                throw ioException;
            }
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
    }

    /* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform.class */
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

    /* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/Platform$JettyNegoProvider.class */
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
