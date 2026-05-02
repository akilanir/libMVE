package freemarker.debug.impl;

import freemarker.debug.Breakpoint;
import freemarker.debug.Debugger;
import freemarker.debug.DebuggerListener;
import java.lang.reflect.Method;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.rmi.UnexpectedException;
import java.rmi.server.RemoteObject;
import java.rmi.server.RemoteRef;
import java.rmi.server.RemoteStub;
import java.util.Collection;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebuggerImpl_Stub.class */
public final class RmiDebuggerImpl_Stub extends RemoteStub implements Debugger, Remote {
    private static final long serialVersionUID = 2;
    private static Method $method_addBreakpoint_0;
    private static Method $method_addDebuggerListener_1;
    private static Method $method_getBreakpoints_2;
    private static Method $method_getBreakpoints_3;
    private static Method $method_getSuspendedEnvironments_4;
    private static Method $method_removeBreakpoint_5;
    private static Method $method_removeBreakpoints_6;
    private static Method $method_removeBreakpoints_7;
    private static Method $method_removeDebuggerListener_8;
    static Class class$freemarker$debug$Debugger;
    static Class class$freemarker$debug$Breakpoint;
    static Class class$freemarker$debug$DebuggerListener;
    static Class class$java$lang$String;
    static Class class$java$lang$Object;

    static {
        Class class$;
        Class<?> class$2;
        Class class$3;
        Class<?> class$4;
        Class class$5;
        Class class$6;
        Class<?> class$7;
        Class class$8;
        Class class$9;
        Class<?> class$10;
        Class class$11;
        Class class$12;
        Class<?> class$13;
        Class class$14;
        Class<?> class$15;
        try {
            if (class$freemarker$debug$Debugger != null) {
                class$ = class$freemarker$debug$Debugger;
            } else {
                class$ = class$("freemarker.debug.Debugger");
                class$freemarker$debug$Debugger = class$;
            }
            Class<?>[] clsArr = new Class[1];
            if (class$freemarker$debug$Breakpoint != null) {
                class$2 = class$freemarker$debug$Breakpoint;
            } else {
                class$2 = class$("freemarker.debug.Breakpoint");
                class$freemarker$debug$Breakpoint = class$2;
            }
            clsArr[0] = class$2;
            $method_addBreakpoint_0 = class$.getMethod("addBreakpoint", clsArr);
            if (class$freemarker$debug$Debugger != null) {
                class$3 = class$freemarker$debug$Debugger;
            } else {
                class$3 = class$("freemarker.debug.Debugger");
                class$freemarker$debug$Debugger = class$3;
            }
            Class<?>[] clsArr2 = new Class[1];
            if (class$freemarker$debug$DebuggerListener != null) {
                class$4 = class$freemarker$debug$DebuggerListener;
            } else {
                class$4 = class$("freemarker.debug.DebuggerListener");
                class$freemarker$debug$DebuggerListener = class$4;
            }
            clsArr2[0] = class$4;
            $method_addDebuggerListener_1 = class$3.getMethod("addDebuggerListener", clsArr2);
            if (class$freemarker$debug$Debugger != null) {
                class$5 = class$freemarker$debug$Debugger;
            } else {
                class$5 = class$("freemarker.debug.Debugger");
                class$freemarker$debug$Debugger = class$5;
            }
            $method_getBreakpoints_2 = class$5.getMethod("getBreakpoints", new Class[0]);
            if (class$freemarker$debug$Debugger != null) {
                class$6 = class$freemarker$debug$Debugger;
            } else {
                class$6 = class$("freemarker.debug.Debugger");
                class$freemarker$debug$Debugger = class$6;
            }
            Class<?>[] clsArr3 = new Class[1];
            if (class$java$lang$String != null) {
                class$7 = class$java$lang$String;
            } else {
                class$7 = class$("java.lang.String");
                class$java$lang$String = class$7;
            }
            clsArr3[0] = class$7;
            $method_getBreakpoints_3 = class$6.getMethod("getBreakpoints", clsArr3);
            if (class$freemarker$debug$Debugger != null) {
                class$8 = class$freemarker$debug$Debugger;
            } else {
                class$8 = class$("freemarker.debug.Debugger");
                class$freemarker$debug$Debugger = class$8;
            }
            $method_getSuspendedEnvironments_4 = class$8.getMethod("getSuspendedEnvironments", new Class[0]);
            if (class$freemarker$debug$Debugger != null) {
                class$9 = class$freemarker$debug$Debugger;
            } else {
                class$9 = class$("freemarker.debug.Debugger");
                class$freemarker$debug$Debugger = class$9;
            }
            Class<?>[] clsArr4 = new Class[1];
            if (class$freemarker$debug$Breakpoint != null) {
                class$10 = class$freemarker$debug$Breakpoint;
            } else {
                class$10 = class$("freemarker.debug.Breakpoint");
                class$freemarker$debug$Breakpoint = class$10;
            }
            clsArr4[0] = class$10;
            $method_removeBreakpoint_5 = class$9.getMethod("removeBreakpoint", clsArr4);
            if (class$freemarker$debug$Debugger != null) {
                class$11 = class$freemarker$debug$Debugger;
            } else {
                class$11 = class$("freemarker.debug.Debugger");
                class$freemarker$debug$Debugger = class$11;
            }
            $method_removeBreakpoints_6 = class$11.getMethod("removeBreakpoints", new Class[0]);
            if (class$freemarker$debug$Debugger != null) {
                class$12 = class$freemarker$debug$Debugger;
            } else {
                class$12 = class$("freemarker.debug.Debugger");
                class$freemarker$debug$Debugger = class$12;
            }
            Class<?>[] clsArr5 = new Class[1];
            if (class$java$lang$String != null) {
                class$13 = class$java$lang$String;
            } else {
                class$13 = class$("java.lang.String");
                class$java$lang$String = class$13;
            }
            clsArr5[0] = class$13;
            $method_removeBreakpoints_7 = class$12.getMethod("removeBreakpoints", clsArr5);
            if (class$freemarker$debug$Debugger != null) {
                class$14 = class$freemarker$debug$Debugger;
            } else {
                class$14 = class$("freemarker.debug.Debugger");
                class$freemarker$debug$Debugger = class$14;
            }
            Class<?>[] clsArr6 = new Class[1];
            if (class$java$lang$Object != null) {
                class$15 = class$java$lang$Object;
            } else {
                class$15 = class$("java.lang.Object");
                class$java$lang$Object = class$15;
            }
            clsArr6[0] = class$15;
            $method_removeDebuggerListener_8 = class$14.getMethod("removeDebuggerListener", clsArr6);
        } catch (NoSuchMethodException unused) {
            throw new NoSuchMethodError("stub class initialization failed");
        }
    }

    public RmiDebuggerImpl_Stub(RemoteRef remoteRef) {
        super(remoteRef);
    }

    @Override // freemarker.debug.Debugger
    public void addBreakpoint(Breakpoint breakpoint) throws RemoteException {
        try {
            ((RemoteObject) this).ref.invoke(this, $method_addBreakpoint_0, new Object[]{breakpoint}, -7089035859976030762L);
        } catch (RuntimeException e) {
            throw e;
        } catch (RemoteException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        }
    }

    @Override // freemarker.debug.Debugger
    public Object addDebuggerListener(DebuggerListener debuggerListener) throws RemoteException {
        try {
            return ((RemoteObject) this).ref.invoke(this, $method_addDebuggerListener_1, new Object[]{debuggerListener}, 3973888913376431645L);
        } catch (RuntimeException e) {
            throw e;
        } catch (RemoteException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError(e.getMessage());
        }
    }

    @Override // freemarker.debug.Debugger
    public List getBreakpoints() throws RemoteException {
        try {
            return (List) ((RemoteObject) this).ref.invoke(this, $method_getBreakpoints_2, (Object[]) null, 2717170791450965365L);
        } catch (RemoteException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        }
    }

    @Override // freemarker.debug.Debugger
    public List getBreakpoints(String str) throws RemoteException {
        try {
            return (List) ((RemoteObject) this).ref.invoke(this, $method_getBreakpoints_3, new Object[]{str}, 2245868106496574916L);
        } catch (Exception e) {
            throw new UnexpectedException("undeclared checked exception", e);
        } catch (RemoteException e2) {
            throw e2;
        } catch (RuntimeException e3) {
            throw e3;
        }
    }

    @Override // freemarker.debug.Debugger
    public Collection getSuspendedEnvironments() throws RemoteException {
        try {
            return (Collection) ((RemoteObject) this).ref.invoke(this, $method_getSuspendedEnvironments_4, (Object[]) null, 6416507983008154583L);
        } catch (RemoteException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        }
    }

    @Override // freemarker.debug.Debugger
    public void removeBreakpoint(Breakpoint breakpoint) throws RemoteException {
        try {
            ((RemoteObject) this).ref.invoke(this, $method_removeBreakpoint_5, new Object[]{breakpoint}, -6894101526753771883L);
        } catch (RuntimeException e) {
            throw e;
        } catch (RemoteException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        }
    }

    @Override // freemarker.debug.Debugger
    public void removeBreakpoints() throws RemoteException {
        try {
            ((RemoteObject) this).ref.invoke(this, $method_removeBreakpoints_6, (Object[]) null, -431815962995809519L);
        } catch (RemoteException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        }
    }

    @Override // freemarker.debug.Debugger
    public void removeBreakpoints(String str) throws RemoteException {
        try {
            ((RemoteObject) this).ref.invoke(this, $method_removeBreakpoints_7, new Object[]{str}, -4131389507095882284L);
        } catch (RuntimeException e) {
            throw e;
        } catch (RemoteException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        }
    }

    @Override // freemarker.debug.Debugger
    public void removeDebuggerListener(Object obj) throws RemoteException {
        try {
            ((RemoteObject) this).ref.invoke(this, $method_removeDebuggerListener_8, new Object[]{obj}, 8368105080961049709L);
        } catch (RuntimeException e) {
            throw e;
        } catch (RemoteException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        }
    }
}
