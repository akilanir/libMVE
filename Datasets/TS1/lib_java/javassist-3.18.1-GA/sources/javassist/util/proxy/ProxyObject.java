package javassist.util.proxy;

/* loaded from: javassist-3.18.1-GA.jar:javassist/util/proxy/ProxyObject.class */
public interface ProxyObject extends Proxy {
    @Override // javassist.util.proxy.Proxy
    void setHandler(MethodHandler methodHandler);

    MethodHandler getHandler();
}
