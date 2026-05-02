package com.mongodb;

import java.io.Closeable;
import java.util.Arrays;
import org.bson.BSONException;
import org.bson.types.BSONTimestamp;
import org.bson.types.Binary;
import org.bson.types.ObjectId;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BSONWriter.class */
abstract class BSONWriter implements Closeable {
    private final BSONWriterSettings settings;
    private State state = State.INITIAL;
    private Context context;
    private String currentName;
    private int serializationDepth;
    private boolean closed;

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BSONWriter$State.class */
    enum State {
        INITIAL,
        NAME,
        VALUE,
        SCOPE_DOCUMENT,
        DONE,
        CLOSED
    }

    public abstract void flush();

    public abstract void writeBinaryData(Binary binary);

    public abstract void writeBoolean(boolean z);

    public abstract void writeDateTime(long j);

    public abstract void writeDouble(double d);

    public abstract void writeInt32(int i);

    public abstract void writeInt64(long j);

    public abstract void writeJavaScript(String str);

    public abstract void writeJavaScriptWithScope(String str);

    public abstract void writeMaxKey();

    public abstract void writeMinKey();

    public abstract void writeNull();

    public abstract void writeObjectId(ObjectId objectId);

    public abstract void writeString(String str);

    public abstract void writeSymbol(String str);

    public abstract void writeTimestamp(BSONTimestamp bSONTimestamp);

    public abstract void writeUndefined();

    protected BSONWriter(BSONWriterSettings settings) {
        this.settings = settings;
    }

    protected String getName() {
        return this.currentName;
    }

    protected boolean isClosed() {
        return this.closed;
    }

    protected void setState(State state) {
        this.state = state;
    }

    protected State getState() {
        return this.state;
    }

    protected Context getContext() {
        return this.context;
    }

    protected void setContext(Context context) {
        this.context = context;
    }

    public void writeBinaryData(String name, Binary binary) {
        writeName(name);
        writeBinaryData(binary);
    }

    public void writeBoolean(String name, boolean value) {
        writeName(name);
        writeBoolean(value);
    }

    public void writeDateTime(String name, long value) {
        writeName(name);
        writeDateTime(value);
    }

    public void writeDouble(String name, double value) {
        writeName(name);
        writeDouble(value);
    }

    public void writeEndArray() {
        this.serializationDepth--;
    }

    public void writeEndDocument() {
        this.serializationDepth--;
    }

    public void writeInt32(String name, int value) {
        writeName(name);
        writeInt32(value);
    }

    public void writeInt64(String name, long value) {
        writeName(name);
        writeInt64(value);
    }

    public void writeJavaScript(String name, String code) {
        writeName(name);
        writeJavaScript(code);
    }

    public void writeJavaScriptWithScope(String name, String code) {
        writeName(name);
        writeJavaScriptWithScope(code);
    }

    public void writeMaxKey(String name) {
        writeName(name);
        writeMaxKey();
    }

    public void writeMinKey(String name) {
        writeName(name);
        writeMinKey();
    }

    public void writeName(String name) {
        if (this.state != State.NAME) {
            throwInvalidState("WriteName", State.NAME);
        }
        this.currentName = name;
        this.state = State.VALUE;
    }

    public void writeNull(String name) {
        writeName(name);
        writeNull();
    }

    public void writeObjectId(String name, ObjectId objectId) {
        writeName(name);
        writeObjectId(objectId);
    }

    public void writeStartArray() {
        this.serializationDepth++;
        if (this.serializationDepth > this.settings.getMaxSerializationDepth()) {
            throw new BSONException("Maximum serialization depth exceeded (does the object being serialized have a circular reference?).");
        }
    }

    public void writeStartArray(String name) {
        writeName(name);
        writeStartArray();
    }

    public void writeStartDocument() {
        this.serializationDepth++;
        if (this.serializationDepth > this.settings.getMaxSerializationDepth()) {
            throw new BSONException("Maximum serialization depth exceeded (does the object being serialized have a circular reference?).");
        }
    }

    public void writeStartDocument(String name) {
        writeName(name);
        writeStartDocument();
    }

    public void writeString(String name, String value) {
        writeName(name);
        writeString(value);
    }

    public void writeSymbol(String name, String value) {
        writeName(name);
        writeSymbol(value);
    }

    public void writeTimestamp(String name, BSONTimestamp value) {
        writeName(name);
        writeTimestamp(value);
    }

    public void writeUndefined(String name) {
        writeName(name);
        writeUndefined();
    }

    protected State getNextState() {
        if (getContext().getContextType() == BSONContextType.ARRAY) {
            return State.VALUE;
        }
        return State.NAME;
    }

    protected boolean checkState(State[] validStates) {
        for (State cur : validStates) {
            if (cur == getState()) {
                return true;
            }
        }
        return false;
    }

    protected void checkPreconditions(String methodName, State... validStates) {
        if (isClosed()) {
            throw new IllegalStateException("BSONWriter");
        }
        if (!checkState(validStates)) {
            throwInvalidState(methodName, validStates);
        }
    }

    protected void throwInvalidContextType(String methodName, BSONContextType actualContextType, BSONContextType... validContextTypes) {
        String validContextTypesString = StringUtils.join(" or ", Arrays.asList(validContextTypes));
        String message = String.format("%s can only be called when ContextType is %s, not when ContextType is %s.", methodName, validContextTypesString, actualContextType);
        throw new BSONException(message);
    }

    protected void throwInvalidState(String methodName, State... validStates) {
        if ((this.state == State.INITIAL || this.state == State.SCOPE_DOCUMENT || this.state == State.DONE) && !methodName.startsWith("end") && !methodName.equals("writeName")) {
            String typeName = methodName.substring(5);
            if (typeName.startsWith("start")) {
                typeName = typeName.substring(5);
            }
            String article = "A";
            if (Arrays.asList('A', 'E', 'I', 'O', 'U').contains(Character.valueOf(typeName.charAt(0)))) {
                article = "An";
            }
            String message = String.format("%s %s value cannot be written to the root level of a BSON document.", article, typeName);
            throw new BSONException(message);
        }
        String validStatesString = StringUtils.join(" or ", Arrays.asList(validStates));
        String message2 = String.format("%s can only be called when State is %s, not when State is %s", methodName, validStatesString, this.state);
        throw new BSONException(message2);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.closed = true;
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BSONWriter$Context.class */
    class Context {
        private final Context parentContext;
        private final BSONContextType contextType;

        public Context(Context from) {
            this.parentContext = from.parentContext;
            this.contextType = from.contextType;
        }

        public Context(Context parentContext, BSONContextType contextType) {
            this.parentContext = parentContext;
            this.contextType = contextType;
        }

        public Context getParentContext() {
            return this.parentContext;
        }

        public BSONContextType getContextType() {
            return this.contextType;
        }

        public Context copy() {
            return BSONWriter.this.new Context(this);
        }
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BSONWriter$Mark.class */
    class Mark {
        private final Context markedContext;
        private final State markedState;
        private final String currentName;
        private final int serializationDepth;

        protected Mark() {
            this.markedContext = BSONWriter.this.context.copy();
            this.markedState = BSONWriter.this.state;
            this.currentName = BSONWriter.this.currentName;
            this.serializationDepth = BSONWriter.this.serializationDepth;
        }

        protected void reset() {
            BSONWriter.this.setContext(this.markedContext);
            BSONWriter.this.setState(this.markedState);
            BSONWriter.this.currentName = this.currentName;
            BSONWriter.this.serializationDepth = this.serializationDepth;
        }
    }
}
