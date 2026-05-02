.class Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;
.super Ljava/lang/Object;
.source "FallbackBodyDescriptorBuilder.java"

# interfaces
.implements Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;


# static fields
.field private static final DEFAULT_MEDIA_TYPE:Ljava/lang/String; = "text"

.field private static final DEFAULT_MIME_TYPE:Ljava/lang/String; = "text/plain"

.field private static final DEFAULT_SUB_TYPE:Ljava/lang/String; = "plain"

.field private static final EMAIL_MESSAGE_MIME_TYPE:Ljava/lang/String; = "message/rfc822"

.field private static final MEDIA_TYPE_MESSAGE:Ljava/lang/String; = "message"

.field private static final MEDIA_TYPE_TEXT:Ljava/lang/String; = "text"

.field private static final SUB_TYPE_EMAIL:Ljava/lang/String; = "rfc822"

.field private static final US_ASCII:Ljava/lang/String; = "us-ascii"


# instance fields
.field private boundary:Ljava/lang/String;

.field private charset:Ljava/lang/String;

.field private contentLength:J

.field private mediaType:Ljava/lang/String;

.field private mimeType:Ljava/lang/String;

.field private final monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

.field private final parentMimeType:Ljava/lang/String;

.field private subType:Ljava/lang/String;

.field private transferEncoding:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 60
    invoke-direct {p0, v0, v0}, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;-><init>(Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V
    .registers 3
    .param p1, "parentMimeType"    # Ljava/lang/String;
    .param p2, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->parentMimeType:Ljava/lang/String;

    .line 72
    if-eqz p2, :cond_d

    .end local p2    # "monitor":Lorg/apache/james/mime4j/codec/DecodeMonitor;
    :goto_7
    iput-object p2, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    .line 73
    invoke-virtual {p0}, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->reset()V

    .line 74
    return-void

    .line 72
    .restart local p2    # "monitor":Lorg/apache/james/mime4j/codec/DecodeMonitor;
    :cond_d
    sget-object p2, Lorg/apache/james/mime4j/codec/DecodeMonitor;->SILENT:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    goto :goto_7
.end method

.method private parseContentType(Lorg/apache/james/mime4j/stream/Field;)V
    .registers 18
    .param p1, "field"    # Lorg/apache/james/mime4j/stream/Field;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 153
    move-object/from16 v0, p1

    instance-of v14, v0, Lorg/apache/james/mime4j/stream/RawField;

    if-eqz v14, :cond_3f

    move-object/from16 v10, p1

    .line 154
    check-cast v10, Lorg/apache/james/mime4j/stream/RawField;

    .line 158
    .local v10, "rawfield":Lorg/apache/james/mime4j/stream/RawField;
    :goto_a
    sget-object v14, Lorg/apache/james/mime4j/stream/RawFieldParser;->DEFAULT:Lorg/apache/james/mime4j/stream/RawFieldParser;

    invoke-virtual {v14, v10}, Lorg/apache/james/mime4j/stream/RawFieldParser;->parseRawBody(Lorg/apache/james/mime4j/stream/RawField;)Lorg/apache/james/mime4j/stream/RawBody;

    move-result-object v2

    .line 159
    .local v2, "body":Lorg/apache/james/mime4j/stream/RawBody;
    invoke-virtual {v2}, Lorg/apache/james/mime4j/stream/RawBody;->getValue()Ljava/lang/String;

    move-result-object v6

    .line 160
    .local v6, "main":Ljava/lang/String;
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 161
    .local v9, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v2}, Lorg/apache/james/mime4j/stream/RawBody;->getParams()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_4d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/james/mime4j/stream/NameValuePair;

    .line 162
    .local v8, "nmp":Lorg/apache/james/mime4j/stream/NameValuePair;
    invoke-virtual {v8}, Lorg/apache/james/mime4j/stream/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v14

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v14, v15}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    .line 163
    .local v7, "name":Ljava/lang/String;
    invoke-virtual {v8}, Lorg/apache/james/mime4j/stream/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v9, v7, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    .line 156
    .end local v2    # "body":Lorg/apache/james/mime4j/stream/RawBody;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "main":Ljava/lang/String;
    .end local v7    # "name":Ljava/lang/String;
    .end local v8    # "nmp":Lorg/apache/james/mime4j/stream/NameValuePair;
    .end local v9    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "rawfield":Lorg/apache/james/mime4j/stream/RawField;
    :cond_3f
    new-instance v10, Lorg/apache/james/mime4j/stream/RawField;

    invoke-interface/range {p1 .. p1}, Lorg/apache/james/mime4j/stream/Field;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-interface/range {p1 .. p1}, Lorg/apache/james/mime4j/stream/Field;->getBody()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v10, v14, v15}, Lorg/apache/james/mime4j/stream/RawField;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v10    # "rawfield":Lorg/apache/james/mime4j/stream/RawField;
    goto :goto_a

    .line 166
    .restart local v2    # "body":Lorg/apache/james/mime4j/stream/RawBody;
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v6    # "main":Ljava/lang/String;
    .restart local v9    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4d
    const/4 v12, 0x0

    .line 167
    .local v12, "type":Ljava/lang/String;
    const/4 v11, 0x0

    .line 168
    .local v11, "subtype":Ljava/lang/String;
    if-eqz v6, :cond_9f

    .line 169
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 170
    const/16 v14, 0x2f

    invoke-virtual {v6, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 171
    .local v5, "index":I
    const/4 v13, 0x0

    .line 172
    .local v13, "valid":Z
    const/4 v14, -0x1

    if-eq v5, v14, :cond_9a

    .line 173
    const/4 v14, 0x0

    invoke-virtual {v6, v14, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    .line 174
    add-int/lit8 v14, v5, 0x1

    invoke-virtual {v6, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    .line 175
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_9a

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_9a

    .line 176
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 177
    const/4 v13, 0x1

    .line 181
    :cond_9a
    if-nez v13, :cond_9f

    .line 182
    const/4 v6, 0x0

    .line 183
    const/4 v12, 0x0

    .line 184
    const/4 v11, 0x0

    .line 187
    .end local v5    # "index":I
    .end local v13    # "valid":Z
    :cond_9f
    const-string v14, "boundary"

    invoke-interface {v9, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 189
    .local v1, "b":Ljava/lang/String;
    if-eqz v6, :cond_c7

    const-string v14, "multipart/"

    invoke-virtual {v6, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_b3

    if-nez v1, :cond_bb

    :cond_b3
    const-string v14, "multipart/"

    invoke-virtual {v6, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_c7

    .line 192
    :cond_bb
    move-object/from16 v0, p0

    iput-object v6, v0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->mimeType:Ljava/lang/String;

    .line 193
    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->mediaType:Ljava/lang/String;

    .line 194
    move-object/from16 v0, p0

    iput-object v11, v0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->subType:Ljava/lang/String;

    .line 197
    :cond_c7
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->mimeType:Ljava/lang/String;

    invoke-static {v14}, Lorg/apache/james/mime4j/util/MimeUtil;->isMultipart(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_d5

    .line 198
    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->boundary:Ljava/lang/String;

    .line 201
    :cond_d5
    const-string v14, "charset"

    invoke-interface {v9, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 202
    .local v3, "c":Ljava/lang/String;
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->charset:Ljava/lang/String;

    .line 203
    if-eqz v3, :cond_f2

    .line 204
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 205
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_f2

    .line 206
    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->charset:Ljava/lang/String;

    .line 209
    :cond_f2
    return-void
.end method


# virtual methods
.method public addField(Lorg/apache/james/mime4j/stream/RawField;)Lorg/apache/james/mime4j/stream/Field;
    .registers 9
    .param p1, "field"    # Lorg/apache/james/mime4j/stream/RawField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-virtual {p1}, Lorg/apache/james/mime4j/stream/RawField;->getName()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "name":Ljava/lang/String;
    const-string v3, "content-transfer-encoding"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_30

    iget-object v3, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->transferEncoding:Ljava/lang/String;

    if-nez v3, :cond_30

    .line 125
    invoke-virtual {p1}, Lorg/apache/james/mime4j/stream/RawField;->getBody()Ljava/lang/String;

    move-result-object v2

    .line 126
    .local v2, "value":Ljava/lang/String;
    if-eqz v2, :cond_2e

    .line 127
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 128
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2e

    .line 129
    iput-object v2, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->transferEncoding:Ljava/lang/String;

    .line 148
    .end local v2    # "value":Ljava/lang/String;
    :cond_2e
    :goto_2e
    const/4 v3, 0x0

    return-object v3

    .line 132
    :cond_30
    const-string v3, "content-length"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8c

    iget-wide v3, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->contentLength:J

    const-wide/16 v5, -0x1

    cmp-long v3, v3, v5

    if-nez v3, :cond_8c

    .line 133
    invoke-virtual {p1}, Lorg/apache/james/mime4j/stream/RawField;->getBody()Ljava/lang/String;

    move-result-object v2

    .line 134
    .restart local v2    # "value":Ljava/lang/String;
    if-eqz v2, :cond_2e

    .line 135
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 137
    :try_start_4a
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->contentLength:J
    :try_end_54
    .catch Ljava/lang/NumberFormatException; {:try_start_4a .. :try_end_54} :catch_55

    goto :goto_2e

    .line 138
    :catch_55
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/NumberFormatException;
    iget-object v3, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid content length: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "ignoring Content-Length header"

    invoke-virtual {v3, v4, v5}, Lorg/apache/james/mime4j/codec/DecodeMonitor;->warn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 141
    new-instance v3, Lorg/apache/james/mime4j/MimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid Content-Length header: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/james/mime4j/MimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 145
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "value":Ljava/lang/String;
    :cond_8c
    const-string v3, "content-type"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    iget-object v3, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->mimeType:Ljava/lang/String;

    if-nez v3, :cond_2e

    .line 146
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->parseContentType(Lorg/apache/james/mime4j/stream/Field;)V

    goto :goto_2e
.end method

.method public build()Lorg/apache/james/mime4j/stream/BodyDescriptor;
    .registers 10

    .prologue
    .line 91
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->mimeType:Ljava/lang/String;

    .line 92
    .local v1, "actualMimeType":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->mediaType:Ljava/lang/String;

    .line 93
    .local v2, "actualMediaType":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->subType:Ljava/lang/String;

    .line 94
    .local v3, "actualSubType":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->charset:Ljava/lang/String;

    .line 95
    .local v5, "actualCharset":Ljava/lang/String;
    if-nez v1, :cond_1a

    .line 96
    const-string v0, "multipart/digest"

    iget-object v4, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->parentMimeType:Ljava/lang/String;

    invoke-static {v0, v4}, Lorg/apache/james/mime4j/util/MimeUtil;->isSameMimeType(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 97
    const-string v1, "message/rfc822"

    .line 98
    const-string v2, "message"

    .line 99
    const-string v3, "rfc822"

    .line 106
    :cond_1a
    :goto_1a
    if-nez v5, :cond_26

    const-string v0, "text"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 107
    const-string v5, "us-ascii"

    .line 109
    :cond_26
    new-instance v0, Lorg/apache/james/mime4j/stream/BasicBodyDescriptor;

    iget-object v4, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->boundary:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->transferEncoding:Ljava/lang/String;

    if-eqz v6, :cond_3d

    iget-object v6, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->transferEncoding:Ljava/lang/String;

    :goto_30
    iget-wide v7, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->contentLength:J

    invoke-direct/range {v0 .. v8}, Lorg/apache/james/mime4j/stream/BasicBodyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-object v0

    .line 101
    :cond_36
    const-string v1, "text/plain"

    .line 102
    const-string v2, "text"

    .line 103
    const-string v3, "plain"

    goto :goto_1a

    .line 109
    :cond_3d
    const-string v6, "7bit"

    goto :goto_30
.end method

.method public newChild()Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;
    .registers 4

    .prologue
    .line 87
    new-instance v0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->mimeType:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->monitor:Lorg/apache/james/mime4j/codec/DecodeMonitor;

    invoke-direct {v0, v1, v2}, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;-><init>(Ljava/lang/String;Lorg/apache/james/mime4j/codec/DecodeMonitor;)V

    return-object v0
.end method

.method public reset()V
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 77
    iput-object v0, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->mimeType:Ljava/lang/String;

    .line 78
    iput-object v0, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->subType:Ljava/lang/String;

    .line 79
    iput-object v0, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->mediaType:Ljava/lang/String;

    .line 80
    iput-object v0, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->boundary:Ljava/lang/String;

    .line 81
    iput-object v0, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->charset:Ljava/lang/String;

    .line 82
    iput-object v0, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->transferEncoding:Ljava/lang/String;

    .line 83
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder;->contentLength:J

    .line 84
    return-void
.end method
