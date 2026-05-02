package freemarker.debug.impl;

import freemarker.cache.CacheStorage;
import freemarker.cache.SoftCacheStorage;
import freemarker.core.Configurable;
import freemarker.core.Environment;
import freemarker.debug.DebugModel;
import freemarker.debug.DebuggedEnvironment;
import freemarker.ext.util.IdentityHashMap;
import freemarker.template.Configuration;
import freemarker.template.SimpleCollection;
import freemarker.template.SimpleScalar;
import freemarker.template.Template;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.UndeclaredThrowableException;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebuggedEnvironmentImpl.class */
class RmiDebuggedEnvironmentImpl extends RmiDebugModelImpl implements DebuggedEnvironment {
    private boolean stopped;
    private final long id;
    private static final CacheStorage storage = new SoftCacheStorage(new IdentityHashMap());
    private static final Object idLock = new Object();
    private static final long serialVersionUID = 1;
    private static long nextId = serialVersionUID;
    private static Set remotes = new HashSet();

    /* renamed from: freemarker.debug.impl.RmiDebuggedEnvironmentImpl$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebuggedEnvironmentImpl$1.class */
    static class AnonymousClass1 {
    }

    /* JADX WARN: Multi-variable type inference failed */
    private RmiDebuggedEnvironmentImpl(Environment env) throws RemoteException {
        super(new DebugEnvironmentModel(env), DebugModel.TYPE_ENVIRONMENT);
        this.stopped = false;
        synchronized (idLock) {
            long j = nextId;
            nextId = this + serialVersionUID;
            this.id = j;
        }
    }

    static synchronized Object getCachedWrapperFor(Object key) throws RemoteException {
        int extraTypes;
        Object value = storage.get(key);
        if (value == null) {
            if (key instanceof TemplateModel) {
                if (key instanceof DebugConfigurationModel) {
                    extraTypes = 8192;
                } else if (key instanceof DebugTemplateModel) {
                    extraTypes = 4096;
                } else {
                    extraTypes = 0;
                }
                value = new RmiDebugModelImpl((TemplateModel) key, extraTypes);
            } else if (key instanceof Environment) {
                value = new RmiDebuggedEnvironmentImpl((Environment) key);
            } else if (key instanceof Template) {
                value = new DebugTemplateModel((Template) key);
            } else if (key instanceof Configuration) {
                value = new DebugConfigurationModel((Configuration) key);
            }
        }
        if (value != null) {
            storage.put(key, value);
        }
        if (value instanceof Remote) {
            remotes.add(value);
        }
        return value;
    }

    @Override // freemarker.debug.DebuggedEnvironment
    public void resume() {
        synchronized (this) {
            notify();
        }
    }

    @Override // freemarker.debug.DebuggedEnvironment
    public void stop() {
        this.stopped = true;
        resume();
    }

    @Override // freemarker.debug.DebuggedEnvironment
    public long getId() {
        return this.id;
    }

    boolean isStopped() {
        return this.stopped;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel.class */
    private static abstract class DebugMapModel implements TemplateHashModelEx {
        abstract Collection keySet();

        private DebugMapModel() {
        }

        DebugMapModel(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.template.TemplateHashModelEx
        public int size() {
            return keySet().size();
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel keys() {
            return new SimpleCollection(keySet());
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel values() throws TemplateModelException {
            Collection keys = keySet();
            List list = new ArrayList(keys.size());
            Iterator it = keys.iterator();
            while (it.hasNext()) {
                list.add(get((String) it.next()));
            }
            return new SimpleCollection(list);
        }

        @Override // freemarker.template.TemplateHashModel
        public boolean isEmpty() {
            return size() == 0;
        }

        static List composeList(Collection c1, Collection c2) {
            List list = new ArrayList(c1);
            list.addAll(c2);
            Collections.sort(list);
            return list;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel.class */
    private static class DebugConfigurableModel extends DebugMapModel {
        static final List KEYS = Arrays.asList(Configurable.ARITHMETIC_ENGINE_KEY, Configurable.BOOLEAN_FORMAT_KEY, Configurable.CLASSIC_COMPATIBLE_KEY, Configurable.LOCALE_KEY, Configurable.NUMBER_FORMAT_KEY, Configurable.OBJECT_WRAPPER_KEY, Configurable.TEMPLATE_EXCEPTION_HANDLER_KEY);
        final Configurable configurable;

        DebugConfigurableModel(Configurable configurable) {
            super(null);
            this.configurable = configurable;
        }

        @Override // freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugMapModel
        Collection keySet() {
            return KEYS;
        }

        @Override // freemarker.template.TemplateHashModel
        public TemplateModel get(String key) throws TemplateModelException {
            String s = this.configurable.getSetting(key);
            if (s == null) {
                return null;
            }
            return new SimpleScalar(s);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurationModel.class */
    private static class DebugConfigurationModel extends DebugConfigurableModel {
        private static final List KEYS = composeList(DebugConfigurableModel.KEYS, Collections.singleton("sharedVariables"));
        private TemplateModel sharedVariables;

        DebugConfigurationModel(Configuration config) {
            super(config);
            this.sharedVariables = new DebugMapModel(this) { // from class: freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugConfigurationModel.1
                private final DebugConfigurationModel this$0;

                {
                    this.this$0 = this;
                }

                @Override // freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugMapModel
                Collection keySet() {
                    return ((Configuration) this.this$0.configurable).getSharedVariableNames();
                }

                @Override // freemarker.template.TemplateHashModel
                public TemplateModel get(String key) {
                    return ((Configuration) this.this$0.configurable).getSharedVariable(key);
                }
            };
        }

        @Override // freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugConfigurableModel, freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugMapModel
        Collection keySet() {
            return KEYS;
        }

        @Override // freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugConfigurableModel, freemarker.template.TemplateHashModel
        public TemplateModel get(String key) throws TemplateModelException {
            if ("sharedVariables".equals(key)) {
                return this.sharedVariables;
            }
            return super.get(key);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel.class */
    private static class DebugTemplateModel extends DebugConfigurableModel {
        private static final List KEYS = composeList(DebugConfigurableModel.KEYS, Arrays.asList("configuration", "name"));
        private final SimpleScalar name;

        DebugTemplateModel(Template template) {
            super(template);
            this.name = new SimpleScalar(template.getName());
        }

        @Override // freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugConfigurableModel, freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugMapModel
        Collection keySet() {
            return KEYS;
        }

        @Override // freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugConfigurableModel, freemarker.template.TemplateHashModel
        public TemplateModel get(String key) throws TemplateModelException {
            if ("configuration".equals(key)) {
                try {
                    return (TemplateModel) RmiDebuggedEnvironmentImpl.getCachedWrapperFor(((Template) this.configurable).getConfiguration());
                } catch (RemoteException e) {
                    throw new TemplateModelException((Exception) e);
                }
            }
            if ("name".equals(key)) {
                return this.name;
            }
            return super.get(key);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel.class */
    private static class DebugEnvironmentModel extends DebugConfigurableModel {
        private static final List KEYS = composeList(DebugConfigurableModel.KEYS, Arrays.asList("currentNamespace", "dataModel", "globalNamespace", "knownVariables", "mainNamespace", "template"));
        private TemplateModel knownVariables;

        DebugEnvironmentModel(Environment env) {
            super(env);
            this.knownVariables = new DebugMapModel(this) { // from class: freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugEnvironmentModel.1
                private final DebugEnvironmentModel this$0;

                {
                    this.this$0 = this;
                }

                @Override // freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugMapModel
                Collection keySet() {
                    try {
                        return ((Environment) this.this$0.configurable).getKnownVariableNames();
                    } catch (TemplateModelException e) {
                        throw new UndeclaredThrowableException(e);
                    }
                }

                @Override // freemarker.template.TemplateHashModel
                public TemplateModel get(String key) throws TemplateModelException {
                    return ((Environment) this.this$0.configurable).getVariable(key);
                }
            };
        }

        @Override // freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugConfigurableModel, freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugMapModel
        Collection keySet() {
            return KEYS;
        }

        @Override // freemarker.debug.impl.RmiDebuggedEnvironmentImpl.DebugConfigurableModel, freemarker.template.TemplateHashModel
        public TemplateModel get(String key) throws TemplateModelException {
            if ("currentNamespace".equals(key)) {
                return ((Environment) this.configurable).getCurrentNamespace();
            }
            if ("dataModel".equals(key)) {
                return ((Environment) this.configurable).getDataModel();
            }
            if ("globalNamespace".equals(key)) {
                return ((Environment) this.configurable).getGlobalNamespace();
            }
            if ("knownVariables".equals(key)) {
                return this.knownVariables;
            }
            if ("mainNamespace".equals(key)) {
                return ((Environment) this.configurable).getMainNamespace();
            }
            if ("template".equals(key)) {
                try {
                    return (TemplateModel) RmiDebuggedEnvironmentImpl.getCachedWrapperFor(((Environment) this.configurable).getTemplate());
                } catch (RemoteException e) {
                    throw new TemplateModelException((Exception) e);
                }
            }
            return super.get(key);
        }
    }

    public static void cleanup() {
        for (Object remoteObject : remotes) {
            try {
                UnicastRemoteObject.unexportObject((Remote) remoteObject, true);
            } catch (Exception e) {
            }
        }
    }
}
