package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.io.IOException;
import java.io.Serializable;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/JsonMappingException.class */
public class JsonMappingException extends JsonProcessingException {
    private static final long serialVersionUID = 1;
    static final int MAX_REFS_TO_LIST = 1000;
    protected LinkedList<Reference> _path;

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/JsonMappingException$Reference.class */
    public static class Reference implements Serializable {
        private static final long serialVersionUID = 1;
        protected Object _from;
        protected String _fieldName;
        protected int _index;

        protected Reference() {
            this._index = -1;
        }

        public Reference(Object from) {
            this._index = -1;
            this._from = from;
        }

        public Reference(Object from, String fieldName) {
            this._index = -1;
            this._from = from;
            if (fieldName == null) {
                throw new NullPointerException("Can not pass null fieldName");
            }
            this._fieldName = fieldName;
        }

        public Reference(Object from, int index) {
            this._index = -1;
            this._from = from;
            this._index = index;
        }

        public void setFrom(Object o) {
            this._from = o;
        }

        public void setFieldName(String n) {
            this._fieldName = n;
        }

        public void setIndex(int ix) {
            this._index = ix;
        }

        public Object getFrom() {
            return this._from;
        }

        public String getFieldName() {
            return this._fieldName;
        }

        public int getIndex() {
            return this._index;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            Class<?> cls = this._from instanceof Class ? (Class) this._from : this._from.getClass();
            Package pkg = cls.getPackage();
            if (pkg != null) {
                sb.append(pkg.getName());
                sb.append('.');
            }
            sb.append(cls.getSimpleName());
            sb.append('[');
            if (this._fieldName != null) {
                sb.append('\"');
                sb.append(this._fieldName);
                sb.append('\"');
            } else if (this._index >= 0) {
                sb.append(this._index);
            } else {
                sb.append('?');
            }
            sb.append(']');
            return sb.toString();
        }
    }

    public JsonMappingException(String msg) {
        super(msg);
    }

    public JsonMappingException(String msg, Throwable rootCause) {
        super(msg, rootCause);
    }

    public JsonMappingException(String msg, JsonLocation loc) {
        super(msg, loc);
    }

    public JsonMappingException(String msg, JsonLocation loc, Throwable rootCause) {
        super(msg, loc, rootCause);
    }

    public static JsonMappingException from(JsonParser jp, String msg) {
        return new JsonMappingException(msg, jp == null ? null : jp.getTokenLocation());
    }

    public static JsonMappingException from(JsonParser jp, String msg, Throwable problem) {
        return new JsonMappingException(msg, jp == null ? null : jp.getTokenLocation(), problem);
    }

    public static JsonMappingException fromUnexpectedIOE(IOException src) {
        return new JsonMappingException("Unexpected IOException (of type " + src.getClass().getName() + "): " + src.getMessage(), (JsonLocation) null, src);
    }

    public static JsonMappingException wrapWithPath(Throwable src, Object refFrom, String refFieldName) {
        return wrapWithPath(src, new Reference(refFrom, refFieldName));
    }

    public static JsonMappingException wrapWithPath(Throwable src, Object refFrom, int index) {
        return wrapWithPath(src, new Reference(refFrom, index));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static JsonMappingException wrapWithPath(Throwable th, Reference ref) {
        JsonMappingException jme;
        if (th instanceof JsonMappingException) {
            jme = (JsonMappingException) th;
        } else {
            String msg = th.getMessage();
            if (msg == null || msg.length() == 0) {
                msg = "(was " + th.getClass().getName() + ")";
            }
            jme = new JsonMappingException(msg, null, th);
        }
        jme.prependPath(ref);
        return jme;
    }

    public List<Reference> getPath() {
        if (this._path == null) {
            return Collections.emptyList();
        }
        return Collections.unmodifiableList(this._path);
    }

    public String getPathReference() {
        return getPathReference(new StringBuilder()).toString();
    }

    public StringBuilder getPathReference(StringBuilder sb) {
        _appendPathDesc(sb);
        return sb;
    }

    public void prependPath(Object referrer, String fieldName) {
        Reference ref = new Reference(referrer, fieldName);
        prependPath(ref);
    }

    public void prependPath(Object referrer, int index) {
        Reference ref = new Reference(referrer, index);
        prependPath(ref);
    }

    public void prependPath(Reference r) {
        if (this._path == null) {
            this._path = new LinkedList<>();
        }
        if (this._path.size() < MAX_REFS_TO_LIST) {
            this._path.addFirst(r);
        }
    }

    public String getLocalizedMessage() {
        return _buildMessage();
    }

    public String getMessage() {
        return _buildMessage();
    }

    protected String _buildMessage() {
        String msg = super.getMessage();
        if (this._path == null) {
            return msg;
        }
        StringBuilder sb = msg == null ? new StringBuilder() : new StringBuilder(msg);
        sb.append(" (through reference chain: ");
        StringBuilder sb2 = getPathReference(sb);
        sb2.append(')');
        return sb2.toString();
    }

    public String toString() {
        return getClass().getName() + ": " + getMessage();
    }

    protected void _appendPathDesc(StringBuilder sb) {
        if (this._path == null) {
            return;
        }
        Iterator<Reference> it = this._path.iterator();
        while (it.hasNext()) {
            sb.append(it.next().toString());
            if (it.hasNext()) {
                sb.append("->");
            }
        }
    }
}
