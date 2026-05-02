.class public Lorg/apache/http/impl/entity/LaxContentLengthStrategy;
.super Ljava/lang/Object;
.source "LaxContentLengthStrategy.java"

# interfaces
.implements Lorg/apache/http/entity/ContentLengthStrategy;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final implicitLen:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 80
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lorg/apache/http/impl/entity/LaxContentLengthStrategy;-><init>(I)V

    .line 81
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "implicitLen"    # I

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput p1, p0, Lorg/apache/http/impl/entity/LaxContentLengthStrategy;->implicitLen:I

    .line 73
    return-void
.end method


# virtual methods
.method public determineLength(Lorg/apache/http/HttpMessage;)J
    .registers 20
    .param p1, "message"    # Lorg/apache/http/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 84
    if-nez p1, :cond_a

    .line 85
    new-instance v15, Ljava/lang/IllegalArgumentException;

    const-string v16, "HTTP message may not be null"

    invoke-direct/range {v15 .. v16}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 88
    :cond_a
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpMessage;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v11

    .line 89
    .local v11, "params":Lorg/apache/http/params/HttpParams;
    const-string v15, "http.protocol.strict-transfer-encoding"

    invoke-interface {v11, v15}, Lorg/apache/http/params/HttpParams;->isParameterTrue(Ljava/lang/String;)Z

    move-result v13

    .line 91
    .local v13, "strict":Z
    const-string v15, "Transfer-Encoding"

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Lorg/apache/http/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v14

    .line 94
    .local v14, "transferEncodingHeader":Lorg/apache/http/Header;
    if-eqz v14, :cond_b5

    .line 95
    const/4 v6, 0x0

    .line 97
    .local v6, "encodings":[Lorg/apache/http/HeaderElement;
    :try_start_1f
    invoke-interface {v14}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;
    :try_end_22
    .catch Lorg/apache/http/ParseException; {:try_start_1f .. :try_end_22} :catch_62

    move-result-object v6

    .line 103
    if-eqz v13, :cond_83

    .line 105
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_26
    array-length v15, v6

    if-ge v9, v15, :cond_83

    .line 106
    aget-object v15, v6, v9

    invoke-interface {v15}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v5

    .line 107
    .local v5, "encoding":Ljava/lang/String;
    if-eqz v5, :cond_80

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v15

    if-lez v15, :cond_80

    const-string v15, "chunked"

    invoke-virtual {v5, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_80

    const-string v15, "identity"

    invoke-virtual {v5, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_80

    .line 110
    new-instance v15, Lorg/apache/http/ProtocolException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unsupported transfer encoding: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 98
    .end local v5    # "encoding":Ljava/lang/String;
    .end local v9    # "i":I
    :catch_62
    move-exception v12

    .line 99
    .local v12, "px":Lorg/apache/http/ParseException;
    new-instance v15, Lorg/apache/http/ProtocolException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Invalid Transfer-Encoding header value: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v12}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15

    .line 105
    .end local v12    # "px":Lorg/apache/http/ParseException;
    .restart local v5    # "encoding":Ljava/lang/String;
    .restart local v9    # "i":I
    :cond_80
    add-int/lit8 v9, v9, 0x1

    goto :goto_26

    .line 115
    .end local v5    # "encoding":Ljava/lang/String;
    .end local v9    # "i":I
    :cond_83
    array-length v10, v6

    .line 116
    .local v10, "len":I
    const-string v15, "identity"

    invoke-interface {v14}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_93

    .line 117
    const-wide/16 v2, -0x1

    .line 153
    .end local v6    # "encodings":[Lorg/apache/http/HeaderElement;
    .end local v10    # "len":I
    :cond_92
    :goto_92
    return-wide v2

    .line 118
    .restart local v6    # "encodings":[Lorg/apache/http/HeaderElement;
    .restart local v10    # "len":I
    :cond_93
    if-lez v10, :cond_a8

    const-string v15, "chunked"

    add-int/lit8 v16, v10, -0x1

    aget-object v16, v6, v16

    invoke-interface/range {v16 .. v16}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_a8

    .line 120
    const-wide/16 v2, -0x2

    goto :goto_92

    .line 122
    :cond_a8
    if-eqz v13, :cond_b2

    .line 123
    new-instance v15, Lorg/apache/http/ProtocolException;

    const-string v16, "Chunk-encoding must be the last one applied"

    invoke-direct/range {v15 .. v16}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 125
    :cond_b2
    const-wide/16 v2, -0x1

    goto :goto_92

    .line 128
    .end local v6    # "encodings":[Lorg/apache/http/HeaderElement;
    .end local v10    # "len":I
    :cond_b5
    const-string v15, "Content-Length"

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Lorg/apache/http/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 129
    .local v1, "contentLengthHeader":Lorg/apache/http/Header;
    if-eqz v1, :cond_115

    .line 130
    const-wide/16 v2, -0x1

    .line 131
    .local v2, "contentlen":J
    const-string v15, "Content-Length"

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Lorg/apache/http/HttpMessage;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v8

    .line 132
    .local v8, "headers":[Lorg/apache/http/Header;
    if-eqz v13, :cond_da

    array-length v15, v8

    const/16 v16, 0x1

    move/from16 v0, v16

    if-le v15, v0, :cond_da

    .line 133
    new-instance v15, Lorg/apache/http/ProtocolException;

    const-string v16, "Multiple content length headers"

    invoke-direct/range {v15 .. v16}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 135
    :cond_da
    array-length v15, v8

    add-int/lit8 v9, v15, -0x1

    .restart local v9    # "i":I
    :goto_dd
    if-ltz v9, :cond_e9

    .line 136
    aget-object v7, v8, v9

    .line 138
    .local v7, "header":Lorg/apache/http/Header;
    :try_start_e1
    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_e8
    .catch Ljava/lang/NumberFormatException; {:try_start_e1 .. :try_end_e8} :catch_f2

    move-result-wide v2

    .line 147
    .end local v7    # "header":Lorg/apache/http/Header;
    :cond_e9
    const-wide/16 v15, 0x0

    cmp-long v15, v2, v15

    if-gez v15, :cond_92

    .line 150
    const-wide/16 v2, -0x1

    goto :goto_92

    .line 140
    .restart local v7    # "header":Lorg/apache/http/Header;
    :catch_f2
    move-exception v4

    .line 141
    .local v4, "e":Ljava/lang/NumberFormatException;
    if-eqz v13, :cond_112

    .line 142
    new-instance v15, Lorg/apache/http/ProtocolException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Invalid content length: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 135
    :cond_112
    add-int/lit8 v9, v9, -0x1

    goto :goto_dd

    .line 153
    .end local v2    # "contentlen":J
    .end local v4    # "e":Ljava/lang/NumberFormatException;
    .end local v7    # "header":Lorg/apache/http/Header;
    .end local v8    # "headers":[Lorg/apache/http/Header;
    .end local v9    # "i":I
    :cond_115
    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/entity/LaxContentLengthStrategy;->implicitLen:I

    int-to-long v2, v15

    goto/16 :goto_92
.end method
