package org.apache.commons.lang3;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectStreamClass;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/SerializationUtils.class */
public class SerializationUtils {
    public static <T extends Serializable> T clone(T object) {
        if (object == null) {
            return null;
        }
        byte[] objectData = serialize(object);
        ByteArrayInputStream bais = new ByteArrayInputStream(objectData);
        ClassLoaderAwareObjectInputStream in = null;
        try {
            try {
                in = new ClassLoaderAwareObjectInputStream(bais, object.getClass().getClassLoader());
                T t = (T) in.readObject();
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException ex) {
                        throw new SerializationException("IOException on closing cloned object data InputStream.", ex);
                    }
                }
                return t;
            } catch (Throwable th) {
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException ex2) {
                        throw new SerializationException("IOException on closing cloned object data InputStream.", ex2);
                    }
                }
                throw th;
            }
        } catch (IOException ex3) {
            throw new SerializationException("IOException while reading cloned object data", ex3);
        } catch (ClassNotFoundException ex4) {
            throw new SerializationException("ClassNotFoundException while reading cloned object data", ex4);
        }
    }

    public static <T extends Serializable> T roundtrip(T msg) {
        return (T) deserialize(serialize(msg));
    }

    public static void serialize(Serializable obj, OutputStream outputStream) {
        if (outputStream == null) {
            throw new IllegalArgumentException("The OutputStream must not be null");
        }
        ObjectOutputStream out = null;
        try {
            try {
                out = new ObjectOutputStream(outputStream);
                out.writeObject(obj);
                if (out != null) {
                    try {
                        out.close();
                    } catch (IOException e) {
                    }
                }
            } catch (IOException ex) {
                throw new SerializationException(ex);
            }
        } catch (Throwable th) {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e2) {
                    throw th;
                }
            }
            throw th;
        }
    }

    public static byte[] serialize(Serializable obj) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream(512);
        serialize(obj, baos);
        return baos.toByteArray();
    }

    public static <T> T deserialize(InputStream inputStream) {
        if (inputStream == null) {
            throw new IllegalArgumentException("The InputStream must not be null");
        }
        ObjectInputStream objectInputStream = null;
        try {
            try {
                try {
                    objectInputStream = new ObjectInputStream(inputStream);
                    T t = (T) objectInputStream.readObject();
                    if (objectInputStream != null) {
                        try {
                            objectInputStream.close();
                        } catch (IOException e) {
                        }
                    }
                    return t;
                } catch (ClassCastException e2) {
                    throw new SerializationException(e2);
                }
            } catch (IOException e3) {
                throw new SerializationException(e3);
            } catch (ClassNotFoundException e4) {
                throw new SerializationException(e4);
            }
        } catch (Throwable th) {
            if (objectInputStream != null) {
                try {
                    objectInputStream.close();
                } catch (IOException e5) {
                    throw th;
                }
            }
            throw th;
        }
    }

    public static <T> T deserialize(byte[] bArr) {
        if (bArr == null) {
            throw new IllegalArgumentException("The byte[] must not be null");
        }
        return (T) deserialize(new ByteArrayInputStream(bArr));
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream.class */
    static class ClassLoaderAwareObjectInputStream extends ObjectInputStream {
        private static final Map<String, Class<?>> primitiveTypes = new HashMap();
        private final ClassLoader classLoader;

        public ClassLoaderAwareObjectInputStream(InputStream in, ClassLoader classLoader) throws IOException {
            super(in);
            this.classLoader = classLoader;
            primitiveTypes.put("byte", Byte.TYPE);
            primitiveTypes.put("short", Short.TYPE);
            primitiveTypes.put("int", Integer.TYPE);
            primitiveTypes.put("long", Long.TYPE);
            primitiveTypes.put("float", Float.TYPE);
            primitiveTypes.put("double", Double.TYPE);
            primitiveTypes.put("boolean", Boolean.TYPE);
            primitiveTypes.put("char", Character.TYPE);
            primitiveTypes.put("void", Void.TYPE);
        }

        @Override // java.io.ObjectInputStream
        protected Class<?> resolveClass(ObjectStreamClass desc) throws IOException, ClassNotFoundException {
            String name = desc.getName();
            try {
                return Class.forName(name, false, this.classLoader);
            } catch (ClassNotFoundException e) {
                try {
                    return Class.forName(name, false, Thread.currentThread().getContextClassLoader());
                } catch (ClassNotFoundException cnfe) {
                    Class<?> cls = primitiveTypes.get(name);
                    if (cls != null) {
                        return cls;
                    }
                    throw cnfe;
                }
            }
        }
    }
}
