package freemarker.debug.impl;

import freemarker.debug.DebugModel;
import freemarker.template.TemplateModelException;
import java.lang.reflect.Method;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.rmi.UnexpectedException;
import java.rmi.server.RemoteObject;
import java.rmi.server.RemoteRef;
import java.rmi.server.RemoteStub;
import java.util.Date;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebugModelImpl_Stub.class */
public final class RmiDebugModelImpl_Stub extends RemoteStub implements DebugModel, Remote {
    private static final long serialVersionUID = 2;
    private static Method $method_get_0;
    private static Method $method_get_1;
    private static Method $method_get_2;
    private static Method $method_get_3;
    private static Method $method_getAsBoolean_4;
    private static Method $method_getAsDate_5;
    private static Method $method_getAsNumber_6;
    private static Method $method_getAsString_7;
    private static Method $method_getCollection_8;
    private static Method $method_getDateType_9;
    private static Method $method_getModelTypes_10;
    private static Method $method_keys_11;
    private static Method $method_size_12;
    static Class class$freemarker$debug$DebugModel;
    static Class class$java$lang$String;
    static Class array$Ljava$lang$String;

    static {
        Class class$;
        Class class$2;
        Class class$3;
        Class<?> class$4;
        Class class$5;
        Class<?> class$6;
        Class class$7;
        Class class$8;
        Class class$9;
        Class class$10;
        Class class$11;
        Class class$12;
        Class class$13;
        Class class$14;
        Class class$15;
        try {
            if (class$freemarker$debug$DebugModel != null) {
                class$ = class$freemarker$debug$DebugModel;
            } else {
                class$ = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$;
            }
            $method_get_0 = class$.getMethod("get", Integer.TYPE);
            if (class$freemarker$debug$DebugModel != null) {
                class$2 = class$freemarker$debug$DebugModel;
            } else {
                class$2 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$2;
            }
            $method_get_1 = class$2.getMethod("get", Integer.TYPE, Integer.TYPE);
            if (class$freemarker$debug$DebugModel != null) {
                class$3 = class$freemarker$debug$DebugModel;
            } else {
                class$3 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$3;
            }
            Class<?>[] clsArr = new Class[1];
            if (class$java$lang$String != null) {
                class$4 = class$java$lang$String;
            } else {
                class$4 = class$("java.lang.String");
                class$java$lang$String = class$4;
            }
            clsArr[0] = class$4;
            $method_get_2 = class$3.getMethod("get", clsArr);
            if (class$freemarker$debug$DebugModel != null) {
                class$5 = class$freemarker$debug$DebugModel;
            } else {
                class$5 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$5;
            }
            Class<?>[] clsArr2 = new Class[1];
            if (array$Ljava$lang$String != null) {
                class$6 = array$Ljava$lang$String;
            } else {
                class$6 = class$("[Ljava.lang.String;");
                array$Ljava$lang$String = class$6;
            }
            clsArr2[0] = class$6;
            $method_get_3 = class$5.getMethod("get", clsArr2);
            if (class$freemarker$debug$DebugModel != null) {
                class$7 = class$freemarker$debug$DebugModel;
            } else {
                class$7 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$7;
            }
            $method_getAsBoolean_4 = class$7.getMethod("getAsBoolean", new Class[0]);
            if (class$freemarker$debug$DebugModel != null) {
                class$8 = class$freemarker$debug$DebugModel;
            } else {
                class$8 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$8;
            }
            $method_getAsDate_5 = class$8.getMethod("getAsDate", new Class[0]);
            if (class$freemarker$debug$DebugModel != null) {
                class$9 = class$freemarker$debug$DebugModel;
            } else {
                class$9 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$9;
            }
            $method_getAsNumber_6 = class$9.getMethod("getAsNumber", new Class[0]);
            if (class$freemarker$debug$DebugModel != null) {
                class$10 = class$freemarker$debug$DebugModel;
            } else {
                class$10 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$10;
            }
            $method_getAsString_7 = class$10.getMethod("getAsString", new Class[0]);
            if (class$freemarker$debug$DebugModel != null) {
                class$11 = class$freemarker$debug$DebugModel;
            } else {
                class$11 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$11;
            }
            $method_getCollection_8 = class$11.getMethod("getCollection", new Class[0]);
            if (class$freemarker$debug$DebugModel != null) {
                class$12 = class$freemarker$debug$DebugModel;
            } else {
                class$12 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$12;
            }
            $method_getDateType_9 = class$12.getMethod("getDateType", new Class[0]);
            if (class$freemarker$debug$DebugModel != null) {
                class$13 = class$freemarker$debug$DebugModel;
            } else {
                class$13 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$13;
            }
            $method_getModelTypes_10 = class$13.getMethod("getModelTypes", new Class[0]);
            if (class$freemarker$debug$DebugModel != null) {
                class$14 = class$freemarker$debug$DebugModel;
            } else {
                class$14 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$14;
            }
            $method_keys_11 = class$14.getMethod("keys", new Class[0]);
            if (class$freemarker$debug$DebugModel != null) {
                class$15 = class$freemarker$debug$DebugModel;
            } else {
                class$15 = class$("freemarker.debug.DebugModel");
                class$freemarker$debug$DebugModel = class$15;
            }
            $method_size_12 = class$15.getMethod("size", new Class[0]);
        } catch (NoSuchMethodException unused) {
            throw new NoSuchMethodError("stub class initialization failed");
        }
    }

    public RmiDebugModelImpl_Stub(RemoteRef remoteRef) {
        super(remoteRef);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError(e.getMessage());
        }
    }

    @Override // freemarker.debug.DebugModel
    public DebugModel get(int i) throws TemplateModelException, RemoteException {
        try {
            return (DebugModel) ((RemoteObject) this).ref.invoke(this, $method_get_0, new Object[]{new Integer(i)}, -8133058733457407300L);
        } catch (TemplateModelException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        } catch (RemoteException e4) {
            throw e4;
        }
    }

    @Override // freemarker.debug.DebugModel
    public DebugModel[] get(int i, int i2) throws TemplateModelException, RemoteException {
        try {
            return (DebugModel[]) ((RemoteObject) this).ref.invoke(this, $method_get_1, new Object[]{new Integer(i), new Integer(i2)}, 2963274088089045739L);
        } catch (TemplateModelException e) {
            throw e;
        } catch (Exception e2) {
            throw new UnexpectedException("undeclared checked exception", e2);
        } catch (RemoteException e3) {
            throw e3;
        } catch (RuntimeException e4) {
            throw e4;
        }
    }

    @Override // freemarker.debug.DebugModel
    public DebugModel get(String str) throws TemplateModelException, RemoteException {
        try {
            return (DebugModel) ((RemoteObject) this).ref.invoke(this, $method_get_2, new Object[]{str}, -724507235264020332L);
        } catch (TemplateModelException e) {
            throw e;
        } catch (RemoteException e2) {
            throw e2;
        } catch (RuntimeException e3) {
            throw e3;
        } catch (Exception e4) {
            throw new UnexpectedException("undeclared checked exception", e4);
        }
    }

    @Override // freemarker.debug.DebugModel
    public DebugModel[] get(String[] strArr) throws TemplateModelException, RemoteException {
        try {
            return (DebugModel[]) ((RemoteObject) this).ref.invoke(this, $method_get_3, new Object[]{strArr}, -5400820492225333337L);
        } catch (TemplateModelException e) {
            throw e;
        } catch (RemoteException e2) {
            throw e2;
        } catch (RuntimeException e3) {
            throw e3;
        } catch (Exception e4) {
            throw new UnexpectedException("undeclared checked exception", e4);
        }
    }

    @Override // freemarker.debug.DebugModel
    public boolean getAsBoolean() throws TemplateModelException, RemoteException {
        try {
            return ((Boolean) ((RemoteObject) this).ref.invoke(this, $method_getAsBoolean_4, (Object[]) null, 315270873791227726L)).booleanValue();
        } catch (RemoteException e) {
            throw e;
        } catch (TemplateModelException e2) {
            throw e2;
        } catch (RuntimeException e3) {
            throw e3;
        } catch (Exception e4) {
            throw new UnexpectedException("undeclared checked exception", e4);
        }
    }

    @Override // freemarker.debug.DebugModel
    public Date getAsDate() throws TemplateModelException, RemoteException {
        try {
            return (Date) ((RemoteObject) this).ref.invoke(this, $method_getAsDate_5, (Object[]) null, -6762406881188215033L);
        } catch (TemplateModelException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        } catch (RemoteException e4) {
            throw e4;
        }
    }

    @Override // freemarker.debug.DebugModel
    public Number getAsNumber() throws TemplateModelException, RemoteException {
        try {
            return (Number) ((RemoteObject) this).ref.invoke(this, $method_getAsNumber_6, (Object[]) null, -6188010426576701549L);
        } catch (TemplateModelException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        } catch (RemoteException e4) {
            throw e4;
        }
    }

    @Override // freemarker.debug.DebugModel
    public String getAsString() throws TemplateModelException, RemoteException {
        try {
            return (String) ((RemoteObject) this).ref.invoke(this, $method_getAsString_7, (Object[]) null, -5749749291031241731L);
        } catch (TemplateModelException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        } catch (RemoteException e4) {
            throw e4;
        }
    }

    @Override // freemarker.debug.DebugModel
    public DebugModel[] getCollection() throws TemplateModelException, RemoteException {
        try {
            return (DebugModel[]) ((RemoteObject) this).ref.invoke(this, $method_getCollection_8, (Object[]) null, -1992223977663617938L);
        } catch (TemplateModelException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        } catch (RemoteException e4) {
            throw e4;
        }
    }

    @Override // freemarker.debug.DebugModel
    public int getDateType() throws TemplateModelException, RemoteException {
        try {
            return ((Integer) ((RemoteObject) this).ref.invoke(this, $method_getDateType_9, (Object[]) null, -3242981404503740604L)).intValue();
        } catch (RemoteException e) {
            throw e;
        } catch (TemplateModelException e2) {
            throw e2;
        } catch (RuntimeException e3) {
            throw e3;
        } catch (Exception e4) {
            throw new UnexpectedException("undeclared checked exception", e4);
        }
    }

    @Override // freemarker.debug.DebugModel
    public int getModelTypes() throws RemoteException {
        try {
            return ((Integer) ((RemoteObject) this).ref.invoke(this, $method_getModelTypes_10, (Object[]) null, -3673171458095957561L)).intValue();
        } catch (RuntimeException e) {
            throw e;
        } catch (Exception e2) {
            throw new UnexpectedException("undeclared checked exception", e2);
        } catch (RemoteException e3) {
            throw e3;
        }
    }

    @Override // freemarker.debug.DebugModel
    public String[] keys() throws TemplateModelException, RemoteException {
        try {
            return (String[]) ((RemoteObject) this).ref.invoke(this, $method_keys_11, (Object[]) null, 563174456558742983L);
        } catch (TemplateModelException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        } catch (RemoteException e4) {
            throw e4;
        }
    }

    @Override // freemarker.debug.DebugModel
    public int size() throws TemplateModelException, RemoteException {
        try {
            return ((Integer) ((RemoteObject) this).ref.invoke(this, $method_size_12, (Object[]) null, 4495240443643581991L)).intValue();
        } catch (RemoteException e) {
            throw e;
        } catch (TemplateModelException e2) {
            throw e2;
        } catch (RuntimeException e3) {
            throw e3;
        } catch (Exception e4) {
            throw new UnexpectedException("undeclared checked exception", e4);
        }
    }
}
