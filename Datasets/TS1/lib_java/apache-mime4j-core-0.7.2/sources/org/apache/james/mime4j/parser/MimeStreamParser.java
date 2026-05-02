package org.apache.james.mime4j.parser;

import java.io.IOException;
import java.io.InputStream;
import org.apache.james.mime4j.MimeException;
import org.apache.james.mime4j.codec.DecodeMonitor;
import org.apache.james.mime4j.io.EOLConvertingInputStream;
import org.apache.james.mime4j.stream.BodyDescriptor;
import org.apache.james.mime4j.stream.BodyDescriptorBuilder;
import org.apache.james.mime4j.stream.EntityState;
import org.apache.james.mime4j.stream.Field;
import org.apache.james.mime4j.stream.MimeConfig;
import org.apache.james.mime4j.stream.MimeTokenStream;
import org.apache.james.mime4j.stream.RecursionMode;
import org.apache.james.mime4j.util.CharsetUtil;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/parser/MimeStreamParser.class */
public class MimeStreamParser {
    private ContentHandler handler;
    private boolean contentDecoding;
    private final MimeTokenStream mimeTokenStream;

    public MimeStreamParser(MimeTokenStream tokenStream) {
        this.handler = null;
        this.mimeTokenStream = tokenStream;
        this.contentDecoding = false;
    }

    public MimeStreamParser(MimeConfig config, DecodeMonitor monitor, BodyDescriptorBuilder bodyDescBuilder) {
        this(new MimeTokenStream(config != null ? config.m12clone() : new MimeConfig(), monitor, bodyDescBuilder));
    }

    public MimeStreamParser(MimeConfig config) {
        this(config, null, null);
    }

    public MimeStreamParser() {
        this(new MimeTokenStream(new MimeConfig(), null, null));
    }

    public boolean isContentDecoding() {
        return this.contentDecoding;
    }

    public void setContentDecoding(boolean b) {
        this.contentDecoding = b;
    }

    public void parse(InputStream instream) throws MimeException, IOException {
        InputStream bodyContent;
        MimeConfig config = this.mimeTokenStream.getConfig();
        if (config.getHeadlessParsing() != null) {
            Field contentType = this.mimeTokenStream.parseHeadless(instream, config.getHeadlessParsing());
            this.handler.startMessage();
            this.handler.startHeader();
            this.handler.field(contentType);
            this.handler.endHeader();
        } else {
            this.mimeTokenStream.parse(instream);
        }
        while (true) {
            EntityState state = this.mimeTokenStream.getState();
            switch (AnonymousClass1.$SwitchMap$org$apache$james$mime4j$stream$EntityState[state.ordinal()]) {
                case EOLConvertingInputStream.CONVERT_CR /* 1 */:
                    BodyDescriptor desc = this.mimeTokenStream.getBodyDescriptor();
                    if (this.contentDecoding) {
                        bodyContent = this.mimeTokenStream.getDecodedInputStream();
                    } else {
                        bodyContent = this.mimeTokenStream.getInputStream();
                    }
                    this.handler.body(desc, bodyContent);
                    break;
                case EOLConvertingInputStream.CONVERT_LF /* 2 */:
                    this.handler.endBodyPart();
                    break;
                case EOLConvertingInputStream.CONVERT_BOTH /* 3 */:
                    this.handler.endHeader();
                    break;
                case 4:
                    this.handler.endMessage();
                    break;
                case 5:
                    this.handler.endMultipart();
                    break;
                case 6:
                    return;
                case 7:
                    this.handler.epilogue(this.mimeTokenStream.getInputStream());
                    break;
                case 8:
                    this.handler.field(this.mimeTokenStream.getField());
                    break;
                case CharsetUtil.HT /* 9 */:
                    this.handler.preamble(this.mimeTokenStream.getInputStream());
                    break;
                case CharsetUtil.LF /* 10 */:
                    this.handler.raw(this.mimeTokenStream.getInputStream());
                    break;
                case 11:
                    this.handler.startBodyPart();
                    break;
                case 12:
                    this.handler.startHeader();
                    break;
                case CharsetUtil.CR /* 13 */:
                    this.handler.startMessage();
                    break;
                case 14:
                    this.handler.startMultipart(this.mimeTokenStream.getBodyDescriptor());
                    break;
                default:
                    throw new IllegalStateException("Invalid state: " + state);
            }
            this.mimeTokenStream.next();
        }
    }

    /* renamed from: org.apache.james.mime4j.parser.MimeStreamParser$1, reason: invalid class name */
    /* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/parser/MimeStreamParser$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$apache$james$mime4j$stream$EntityState = new int[EntityState.values().length];

        static {
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_BODY.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_END_BODYPART.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_END_HEADER.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_END_MESSAGE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_END_MULTIPART.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_END_OF_STREAM.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_EPILOGUE.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_FIELD.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_PREAMBLE.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_RAW_ENTITY.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_START_BODYPART.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_START_HEADER.ordinal()] = 12;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_START_MESSAGE.ordinal()] = 13;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$org$apache$james$mime4j$stream$EntityState[EntityState.T_START_MULTIPART.ordinal()] = 14;
            } catch (NoSuchFieldError e14) {
            }
        }
    }

    public boolean isRaw() {
        return this.mimeTokenStream.isRaw();
    }

    public void setRaw() {
        this.mimeTokenStream.setRecursionMode(RecursionMode.M_RAW);
    }

    public void setFlat() {
        this.mimeTokenStream.setRecursionMode(RecursionMode.M_FLAT);
    }

    public void setRecurse() {
        this.mimeTokenStream.setRecursionMode(RecursionMode.M_RECURSE);
    }

    public void stop() {
        this.mimeTokenStream.stop();
    }

    public void setContentHandler(ContentHandler h) {
        this.handler = h;
    }
}
