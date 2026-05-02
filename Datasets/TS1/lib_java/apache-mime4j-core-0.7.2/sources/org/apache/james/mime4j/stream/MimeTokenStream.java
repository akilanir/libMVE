package org.apache.james.mime4j.stream;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.LinkedList;
import org.apache.james.mime4j.MimeException;
import org.apache.james.mime4j.codec.DecodeMonitor;
import org.apache.james.mime4j.io.LineNumberInputStream;
import org.apache.james.mime4j.io.LineNumberSource;
import org.apache.james.mime4j.util.CharsetUtil;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/MimeTokenStream.class */
public class MimeTokenStream {
    private final MimeConfig config;
    private final DecodeMonitor monitor;
    private final FieldBuilder fieldBuilder;
    private final BodyDescriptorBuilder bodyDescBuilder;
    private final LinkedList<EntityStateMachine> entities;
    private EntityState state;
    private EntityStateMachine currentStateMachine;
    private RecursionMode recursionMode;
    private MimeEntity rootentity;

    public MimeTokenStream() {
        this(null);
    }

    public MimeTokenStream(MimeConfig config) {
        this(config, null, null, null);
    }

    public MimeTokenStream(MimeConfig config, BodyDescriptorBuilder bodyDescBuilder) {
        this(config, null, null, bodyDescBuilder);
    }

    public MimeTokenStream(MimeConfig config, DecodeMonitor monitor, BodyDescriptorBuilder bodyDescBuilder) {
        this(config, monitor, null, bodyDescBuilder);
    }

    public MimeTokenStream(MimeConfig config, DecodeMonitor monitor, FieldBuilder fieldBuilder, BodyDescriptorBuilder bodyDescBuilder) {
        this.entities = new LinkedList<>();
        this.state = EntityState.T_END_OF_STREAM;
        this.recursionMode = RecursionMode.M_RECURSE;
        this.config = config != null ? config : new MimeConfig();
        this.fieldBuilder = fieldBuilder != null ? fieldBuilder : new DefaultFieldBuilder(this.config.getMaxHeaderLen());
        this.monitor = monitor != null ? monitor : this.config.isStrictParsing() ? DecodeMonitor.STRICT : DecodeMonitor.SILENT;
        this.bodyDescBuilder = bodyDescBuilder != null ? bodyDescBuilder : new FallbackBodyDescriptorBuilder();
    }

    public void parse(InputStream stream) {
        doParse(stream, EntityState.T_START_MESSAGE);
    }

    public Field parseHeadless(InputStream stream, String contentType) {
        if (contentType == null) {
            throw new IllegalArgumentException("Content type may not be null");
        }
        try {
            RawField rawContentType = new RawField("Content-Type", contentType);
            Field newContentType = this.bodyDescBuilder.addField(rawContentType);
            if (newContentType == null) {
                newContentType = rawContentType;
            }
            doParse(stream, EntityState.T_END_HEADER);
            try {
                next();
                return newContentType;
            } catch (IOException e) {
                throw new IllegalStateException(e);
            } catch (MimeException e2) {
                throw new IllegalStateException(e2);
            }
        } catch (MimeException ex) {
            throw new IllegalArgumentException(ex.getMessage());
        }
    }

    private void doParse(InputStream stream, EntityState start) {
        LineNumberSource lineSource = null;
        if (this.config.isCountLineNumbers()) {
            LineNumberInputStream lineInput = new LineNumberInputStream(stream);
            lineSource = lineInput;
            stream = lineInput;
        }
        this.rootentity = new MimeEntity(lineSource, stream, this.config, start, EntityState.T_END_MESSAGE, this.monitor, this.fieldBuilder, this.bodyDescBuilder);
        this.rootentity.setRecursionMode(this.recursionMode);
        this.currentStateMachine = this.rootentity;
        this.entities.clear();
        this.entities.add(this.currentStateMachine);
        this.state = this.currentStateMachine.getState();
    }

    public boolean isRaw() {
        return this.recursionMode == RecursionMode.M_RAW;
    }

    public RecursionMode getRecursionMode() {
        return this.recursionMode;
    }

    public void setRecursionMode(RecursionMode mode) {
        this.recursionMode = mode;
        if (this.currentStateMachine != null) {
            this.currentStateMachine.setRecursionMode(mode);
        }
    }

    public void stop() {
        this.rootentity.stop();
    }

    public EntityState getState() {
        return this.state;
    }

    public InputStream getInputStream() {
        return this.currentStateMachine.getContentStream();
    }

    public InputStream getDecodedInputStream() {
        return this.currentStateMachine.getDecodedContentStream();
    }

    public Reader getReader() {
        Charset charset;
        BodyDescriptor bodyDescriptor = getBodyDescriptor();
        String mimeCharset = bodyDescriptor.getCharset();
        if (mimeCharset == null || "".equals(mimeCharset)) {
            charset = CharsetUtil.US_ASCII;
        } else {
            charset = Charset.forName(mimeCharset);
        }
        InputStream instream = getDecodedInputStream();
        return new InputStreamReader(instream, charset);
    }

    public BodyDescriptor getBodyDescriptor() {
        return this.currentStateMachine.getBodyDescriptor();
    }

    public Field getField() {
        return this.currentStateMachine.getField();
    }

    public EntityState next() throws IOException, MimeException {
        if (this.state == EntityState.T_END_OF_STREAM || this.currentStateMachine == null) {
            throw new IllegalStateException("No more tokens are available.");
        }
        while (this.currentStateMachine != null) {
            EntityStateMachine next = this.currentStateMachine.advance();
            if (next != null) {
                this.entities.add(next);
                this.currentStateMachine = next;
            }
            this.state = this.currentStateMachine.getState();
            if (this.state != EntityState.T_END_OF_STREAM) {
                return this.state;
            }
            this.entities.removeLast();
            if (this.entities.isEmpty()) {
                this.currentStateMachine = null;
            } else {
                this.currentStateMachine = this.entities.getLast();
                this.currentStateMachine.setRecursionMode(this.recursionMode);
            }
        }
        this.state = EntityState.T_END_OF_STREAM;
        return this.state;
    }

    public static final String stateToString(EntityState state) {
        return MimeEntity.stateToString(state);
    }

    public MimeConfig getConfig() {
        return this.config;
    }
}
