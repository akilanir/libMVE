package freemarker.debug.impl;

import freemarker.core.Environment;
import freemarker.template.Template;
import freemarker.template.utility.SecurityUtilities;
import java.rmi.RemoteException;
import java.util.Collections;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/DebuggerService.class */
public abstract class DebuggerService {
    private static final DebuggerService instance = createInstance();

    /* renamed from: freemarker.debug.impl.DebuggerService$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/DebuggerService$1.class */
    static class AnonymousClass1 {
    }

    abstract List getBreakpointsSpi(String str);

    abstract void registerTemplateSpi(Template template);

    abstract boolean suspendEnvironmentSpi(Environment environment, String str, int i) throws RemoteException;

    abstract void shutdownSpi();

    private static DebuggerService createInstance() {
        return SecurityUtilities.getSystemProperty("freemarker.debug.password") == null ? new NoOpDebuggerService(null) : new RmiDebuggerService();
    }

    public static List getBreakpoints(String templateName) {
        return instance.getBreakpointsSpi(templateName);
    }

    public static void registerTemplate(Template template) {
        instance.registerTemplateSpi(template);
    }

    public static boolean suspendEnvironment(Environment env, String templateName, int line) throws RemoteException {
        return instance.suspendEnvironmentSpi(env, templateName, line);
    }

    public static void shutdown() {
        instance.shutdownSpi();
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/DebuggerService$NoOpDebuggerService.class */
    private static class NoOpDebuggerService extends DebuggerService {
        private NoOpDebuggerService() {
        }

        NoOpDebuggerService(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.debug.impl.DebuggerService
        List getBreakpointsSpi(String templateName) {
            return Collections.EMPTY_LIST;
        }

        @Override // freemarker.debug.impl.DebuggerService
        boolean suspendEnvironmentSpi(Environment env, String templateName, int line) {
            throw new UnsupportedOperationException();
        }

        @Override // freemarker.debug.impl.DebuggerService
        void registerTemplateSpi(Template template) {
        }

        @Override // freemarker.debug.impl.DebuggerService
        void shutdownSpi() {
        }
    }
}
