package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.PrettyPrinter;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.io.SerializedString;
import java.io.IOException;
import java.io.Serializable;
import java.util.Arrays;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/util/DefaultPrettyPrinter.class */
public class DefaultPrettyPrinter implements PrettyPrinter, Instantiatable<DefaultPrettyPrinter>, Serializable {
    private static final long serialVersionUID = -5512586643324525213L;
    public static final SerializedString DEFAULT_ROOT_VALUE_SEPARATOR = new SerializedString(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
    protected Indenter _arrayIndenter;
    protected Indenter _objectIndenter;
    protected final SerializableString _rootSeparator;
    protected boolean _spacesInObjectEntries;
    protected transient int _nesting;

    /* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/util/DefaultPrettyPrinter$Indenter.class */
    public interface Indenter {
        void writeIndentation(JsonGenerator jsonGenerator, int i) throws IOException, JsonGenerationException;

        boolean isInline();
    }

    public DefaultPrettyPrinter() {
        this(DEFAULT_ROOT_VALUE_SEPARATOR);
    }

    public DefaultPrettyPrinter(String str) {
        this(str == null ? null : new SerializedString(str));
    }

    public DefaultPrettyPrinter(SerializableString serializableString) {
        this._arrayIndenter = FixedSpaceIndenter.instance;
        this._objectIndenter = Lf2SpacesIndenter.instance;
        this._spacesInObjectEntries = true;
        this._nesting = 0;
        this._rootSeparator = serializableString;
    }

    public DefaultPrettyPrinter(DefaultPrettyPrinter defaultPrettyPrinter) {
        this(defaultPrettyPrinter, defaultPrettyPrinter._rootSeparator);
    }

    public DefaultPrettyPrinter(DefaultPrettyPrinter defaultPrettyPrinter, SerializableString serializableString) {
        this._arrayIndenter = FixedSpaceIndenter.instance;
        this._objectIndenter = Lf2SpacesIndenter.instance;
        this._spacesInObjectEntries = true;
        this._nesting = 0;
        this._arrayIndenter = defaultPrettyPrinter._arrayIndenter;
        this._objectIndenter = defaultPrettyPrinter._objectIndenter;
        this._spacesInObjectEntries = defaultPrettyPrinter._spacesInObjectEntries;
        this._nesting = defaultPrettyPrinter._nesting;
        this._rootSeparator = serializableString;
    }

    public DefaultPrettyPrinter withRootSeparator(SerializableString serializableString) {
        if (this._rootSeparator == serializableString || (serializableString != null && serializableString.equals(this._rootSeparator))) {
            return this;
        }
        return new DefaultPrettyPrinter(this, serializableString);
    }

    public void indentArraysWith(Indenter indenter) {
        this._arrayIndenter = indenter == null ? NopIndenter.instance : indenter;
    }

    public void indentObjectsWith(Indenter indenter) {
        this._objectIndenter = indenter == null ? NopIndenter.instance : indenter;
    }

    @Deprecated
    public void spacesInObjectEntries(boolean z) {
        this._spacesInObjectEntries = z;
    }

    public DefaultPrettyPrinter withArrayIndenter(Indenter indenter) {
        if (indenter == null) {
            indenter = NopIndenter.instance;
        }
        if (this._arrayIndenter == indenter) {
            return this;
        }
        DefaultPrettyPrinter defaultPrettyPrinter = new DefaultPrettyPrinter(this);
        defaultPrettyPrinter._arrayIndenter = indenter;
        return defaultPrettyPrinter;
    }

    public DefaultPrettyPrinter withObjectIndenter(Indenter indenter) {
        if (indenter == null) {
            indenter = NopIndenter.instance;
        }
        if (this._objectIndenter == indenter) {
            return this;
        }
        DefaultPrettyPrinter defaultPrettyPrinter = new DefaultPrettyPrinter(this);
        defaultPrettyPrinter._objectIndenter = indenter;
        return defaultPrettyPrinter;
    }

    public DefaultPrettyPrinter withSpacesInObjectEntries() {
        return _withSpaces(true);
    }

    public DefaultPrettyPrinter withoutSpacesInObjectEntries() {
        return _withSpaces(false);
    }

    protected DefaultPrettyPrinter _withSpaces(boolean z) {
        if (this._spacesInObjectEntries == z) {
            return this;
        }
        DefaultPrettyPrinter defaultPrettyPrinter = new DefaultPrettyPrinter(this);
        defaultPrettyPrinter._spacesInObjectEntries = z;
        return defaultPrettyPrinter;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.fasterxml.jackson.core.util.Instantiatable
    public DefaultPrettyPrinter createInstance() {
        return new DefaultPrettyPrinter(this);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeRootValueSeparator(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException {
        if (this._rootSeparator != null) {
            jsonGenerator.writeRaw(this._rootSeparator);
        }
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeStartObject(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException {
        jsonGenerator.writeRaw('{');
        if (!this._objectIndenter.isInline()) {
            this._nesting++;
        }
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void beforeObjectEntries(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException {
        this._objectIndenter.writeIndentation(jsonGenerator, this._nesting);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeObjectFieldValueSeparator(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException {
        if (this._spacesInObjectEntries) {
            jsonGenerator.writeRaw(" : ");
        } else {
            jsonGenerator.writeRaw(':');
        }
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeObjectEntrySeparator(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException {
        jsonGenerator.writeRaw(',');
        this._objectIndenter.writeIndentation(jsonGenerator, this._nesting);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeEndObject(JsonGenerator jsonGenerator, int i) throws IOException, JsonGenerationException {
        if (!this._objectIndenter.isInline()) {
            this._nesting--;
        }
        if (i > 0) {
            this._objectIndenter.writeIndentation(jsonGenerator, this._nesting);
        } else {
            jsonGenerator.writeRaw(' ');
        }
        jsonGenerator.writeRaw('}');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeStartArray(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException {
        if (!this._arrayIndenter.isInline()) {
            this._nesting++;
        }
        jsonGenerator.writeRaw('[');
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void beforeArrayValues(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException {
        this._arrayIndenter.writeIndentation(jsonGenerator, this._nesting);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeArrayValueSeparator(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException {
        jsonGenerator.writeRaw(',');
        this._arrayIndenter.writeIndentation(jsonGenerator, this._nesting);
    }

    @Override // com.fasterxml.jackson.core.PrettyPrinter
    public void writeEndArray(JsonGenerator jsonGenerator, int i) throws IOException, JsonGenerationException {
        if (!this._arrayIndenter.isInline()) {
            this._nesting--;
        }
        if (i > 0) {
            this._arrayIndenter.writeIndentation(jsonGenerator, this._nesting);
        } else {
            jsonGenerator.writeRaw(' ');
        }
        jsonGenerator.writeRaw(']');
    }

    /* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/util/DefaultPrettyPrinter$NopIndenter.class */
    public static class NopIndenter implements Indenter, Serializable {
        public static final NopIndenter instance = new NopIndenter();

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public void writeIndentation(JsonGenerator jsonGenerator, int i) throws IOException, JsonGenerationException {
        }

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public boolean isInline() {
            return true;
        }
    }

    /* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/util/DefaultPrettyPrinter$FixedSpaceIndenter.class */
    public static class FixedSpaceIndenter extends NopIndenter {
        public static final FixedSpaceIndenter instance = new FixedSpaceIndenter();

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.NopIndenter, com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public void writeIndentation(JsonGenerator jsonGenerator, int i) throws IOException, JsonGenerationException {
            jsonGenerator.writeRaw(' ');
        }

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.NopIndenter, com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public boolean isInline() {
            return true;
        }
    }

    /* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/util/DefaultPrettyPrinter$Lf2SpacesIndenter.class */
    public static class Lf2SpacesIndenter extends NopIndenter {
        private static final String SYS_LF;
        static final int SPACE_COUNT = 64;
        static final char[] SPACES;
        public static final Lf2SpacesIndenter instance;
        protected final String _lf;

        static {
            String str = null;
            try {
                str = System.getProperty("line.separator");
            } catch (Throwable th) {
            }
            SYS_LF = str == null ? "\n" : str;
            SPACES = new char[64];
            Arrays.fill(SPACES, ' ');
            instance = new Lf2SpacesIndenter();
        }

        public Lf2SpacesIndenter() {
            this(SYS_LF);
        }

        public Lf2SpacesIndenter(String str) {
            this._lf = str;
        }

        public Lf2SpacesIndenter withLinefeed(String str) {
            if (str.equals(this._lf)) {
                return this;
            }
            return new Lf2SpacesIndenter(str);
        }

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.NopIndenter, com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public boolean isInline() {
            return false;
        }

        @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.NopIndenter, com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
        public void writeIndentation(JsonGenerator jsonGenerator, int i) throws IOException, JsonGenerationException {
            jsonGenerator.writeRaw(this._lf);
            if (i > 0) {
                int i2 = i + i;
                while (true) {
                    int i3 = i2;
                    if (i3 > 64) {
                        jsonGenerator.writeRaw(SPACES, 0, 64);
                        i2 = i3 - SPACES.length;
                    } else {
                        jsonGenerator.writeRaw(SPACES, 0, i3);
                        return;
                    }
                }
            }
        }
    }
}
