.class public final Lcom/bea/xml/stream/reader/XmlReader;
.super Ljava/io/Reader;
.source "XmlReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;,
        Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;,
        Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;,
        Lcom/bea/xml/stream/reader/XmlReader$BaseReader;
    }
.end annotation


# static fields
.field private static final MAXPUSHBACK:I = 0x200

.field private static final charsets:Ljava/util/Hashtable;


# instance fields
.field private assignedEncoding:Ljava/lang/String;

.field private closed:Z

.field private in:Ljava/io/Reader;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 163
    new-instance v0, Ljava/util/Hashtable;

    const/16 v1, 0x1f

    invoke-direct {v0, v1}, Ljava/util/Hashtable;-><init>(I)V

    sput-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    .line 166
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "UTF-16"

    const-string v2, "Unicode"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "ISO-10646-UCS-2"

    const-string v2, "Unicode"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-US"

    const-string v2, "cp037"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-CA"

    const-string v2, "cp037"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-NL"

    const-string v2, "cp037"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-WT"

    const-string v2, "cp037"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-DK"

    const-string v2, "cp277"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-NO"

    const-string v2, "cp277"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-FI"

    const-string v2, "cp278"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-SE"

    const-string v2, "cp278"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-IT"

    const-string v2, "cp280"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-ES"

    const-string v2, "cp284"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-GB"

    const-string v2, "cp285"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-FR"

    const-string v2, "cp297"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-AR1"

    const-string v2, "cp420"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-HE"

    const-string v2, "cp424"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-BE"

    const-string v2, "cp500"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-CH"

    const-string v2, "cp500"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-ROECE"

    const-string v2, "cp870"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-YU"

    const-string v2, "cp870"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-IS"

    const-string v2, "cp871"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v0, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    const-string v1, "EBCDIC-CP-AR2"

    const-string v2, "cp918"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    return-void
.end method

.method private constructor <init>(Ljava/io/InputStream;)V
    .registers 11
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x0

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 218
    invoke-direct {p0, p1}, Ljava/io/Reader;-><init>(Ljava/lang/Object;)V

    .line 235
    new-instance v2, Ljava/io/PushbackInputStream;

    const/16 v3, 0x200

    invoke-direct {v2, p1, v3}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 241
    .local v2, "pb":Ljava/io/PushbackInputStream;
    new-array v0, v8, [B

    .line 242
    .local v0, "buf":[B
    invoke-virtual {v2, v0}, Ljava/io/PushbackInputStream;->read([B)I

    move-result v1

    .line 243
    .local v1, "len":I
    if-lez v1, :cond_1a

    .line 244
    invoke-virtual {v2, v0, v7, v1}, Ljava/io/PushbackInputStream;->unread([BII)V

    .line 246
    :cond_1a
    if-ne v1, v8, :cond_23

    aget-byte v3, v0, v7

    and-int/lit16 v3, v3, 0xff

    sparse-switch v3, :sswitch_data_a2

    .line 320
    :cond_23
    :goto_23
    const-string v3, "UTF-8"

    invoke-direct {p0, v2, v3}, Lcom/bea/xml/stream/reader/XmlReader;->setEncoding(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 321
    :goto_28
    return-void

    .line 249
    :sswitch_29
    aget-byte v3, v0, v4

    const/16 v4, 0x3c

    if-ne v3, v4, :cond_23

    aget-byte v3, v0, v5

    if-nez v3, :cond_23

    aget-byte v3, v0, v6

    const/16 v4, 0x3f

    if-ne v3, v4, :cond_23

    .line 250
    const-string v3, "UnicodeBig"

    invoke-direct {p0, v2, v3}, Lcom/bea/xml/stream/reader/XmlReader;->setEncoding(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_28

    .line 257
    :sswitch_3f
    aget-byte v3, v0, v4

    and-int/lit16 v3, v3, 0xff

    sparse-switch v3, :sswitch_data_b8

    goto :goto_23

    .line 266
    :sswitch_47
    aget-byte v3, v0, v5

    const/16 v4, 0x3f

    if-ne v3, v4, :cond_23

    aget-byte v3, v0, v6

    if-nez v3, :cond_23

    .line 267
    const-string v3, "UnicodeLittle"

    invoke-direct {p0, v2, v3}, Lcom/bea/xml/stream/reader/XmlReader;->setEncoding(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_28

    .line 275
    :sswitch_57
    aget-byte v3, v0, v5

    const/16 v4, 0x78

    if-ne v3, v4, :cond_23

    aget-byte v3, v0, v6

    const/16 v4, 0x6d

    if-ne v3, v4, :cond_23

    .line 281
    const-string v3, "UTF8"

    invoke-direct {p0, v2, v3}, Lcom/bea/xml/stream/reader/XmlReader;->useEncodingDecl(Ljava/io/PushbackInputStream;Ljava/lang/String;)V

    goto :goto_28

    .line 288
    :sswitch_69
    aget-byte v3, v0, v4

    const/16 v4, 0x6f

    if-ne v3, v4, :cond_23

    aget-byte v3, v0, v5

    and-int/lit16 v3, v3, 0xff

    const/16 v4, 0xa7

    if-ne v3, v4, :cond_23

    aget-byte v3, v0, v6

    and-int/lit16 v3, v3, 0xff

    const/16 v4, 0x94

    if-ne v3, v4, :cond_23

    .line 291
    const-string v3, "CP037"

    invoke-direct {p0, v2, v3}, Lcom/bea/xml/stream/reader/XmlReader;->useEncodingDecl(Ljava/io/PushbackInputStream;Ljava/lang/String;)V

    goto :goto_28

    .line 299
    :sswitch_85
    aget-byte v3, v0, v4

    and-int/lit16 v3, v3, 0xff

    const/16 v4, 0xff

    if-ne v3, v4, :cond_23

    .line 301
    const-string v3, "UTF-16"

    invoke-direct {p0, v2, v3}, Lcom/bea/xml/stream/reader/XmlReader;->setEncoding(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_28

    .line 306
    :sswitch_93
    aget-byte v3, v0, v4

    and-int/lit16 v3, v3, 0xff

    const/16 v4, 0xfe

    if-ne v3, v4, :cond_23

    .line 308
    const-string v3, "UTF-16"

    invoke-direct {p0, v2, v3}, Lcom/bea/xml/stream/reader/XmlReader;->setEncoding(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_28

    .line 246
    nop

    :sswitch_data_a2
    .sparse-switch
        0x0 -> :sswitch_29
        0x3c -> :sswitch_3f
        0x4c -> :sswitch_69
        0xfe -> :sswitch_85
        0xff -> :sswitch_93
    .end sparse-switch

    .line 257
    :sswitch_data_b8
    .sparse-switch
        0x0 -> :sswitch_47
        0x3f -> :sswitch_57
    .end sparse-switch
.end method

.method public static createReader(Ljava/io/InputStream;)Ljava/io/Reader;
    .registers 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    new-instance v0, Lcom/bea/xml/stream/reader/XmlReader;

    invoke-direct {v0, p0}, Lcom/bea/xml/stream/reader/XmlReader;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method public static createReader(Ljava/io/InputStream;Ljava/lang/String;)Ljava/io/Reader;
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    if-nez p1, :cond_8

    .line 135
    new-instance v0, Lcom/bea/xml/stream/reader/XmlReader;

    invoke-direct {v0, p0}, Lcom/bea/xml/stream/reader/XmlReader;-><init>(Ljava/io/InputStream;)V

    .line 157
    :goto_7
    return-object v0

    .line 137
    :cond_8
    const-string v0, "UTF-8"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "UTF8"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 139
    :cond_18
    new-instance v0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;

    invoke-direct {v0, p0}, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;-><init>(Ljava/io/InputStream;)V

    goto :goto_7

    .line 141
    :cond_1e
    const-string v0, "US-ASCII"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2e

    const-string v0, "ASCII"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 143
    :cond_2e
    new-instance v0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;

    invoke-direct {v0, p0}, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;-><init>(Ljava/io/InputStream;)V

    goto :goto_7

    .line 145
    :cond_34
    const-string v0, "ISO-8859-1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 148
    new-instance v0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;

    invoke-direct {v0, p0}, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;-><init>(Ljava/io/InputStream;)V

    goto :goto_7

    .line 157
    :cond_42
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-static {p1}, Lcom/bea/xml/stream/reader/XmlReader;->std2java(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_7
.end method

.method private setEncoding(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 4
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 468
    iput-object p2, p0, Lcom/bea/xml/stream/reader/XmlReader;->assignedEncoding:Ljava/lang/String;

    .line 469
    invoke-static {p1, p2}, Lcom/bea/xml/stream/reader/XmlReader;->createReader(Ljava/io/InputStream;Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v0

    iput-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    .line 470
    return-void
.end method

.method private static std2java(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "encoding"    # Ljava/lang/String;

    .prologue
    .line 205
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "temp":Ljava/lang/String;
    sget-object v1, Lcom/bea/xml/stream/reader/XmlReader;->charsets:Ljava/util/Hashtable;

    invoke-virtual {v1, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "temp":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 207
    .restart local v0    # "temp":Ljava/lang/String;
    if-eqz v0, :cond_f

    .end local v0    # "temp":Ljava/lang/String;
    :goto_e
    return-object v0

    .restart local v0    # "temp":Ljava/lang/String;
    :cond_f
    move-object v0, p0

    goto :goto_e
.end method

.method private useEncodingDecl(Ljava/io/PushbackInputStream;Ljava/lang/String;)V
    .registers 16
    .param p1, "pb"    # Ljava/io/PushbackInputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    const/16 v11, 0x200

    new-array v1, v11, [B

    .line 347
    .local v1, "buffer":[B
    const/4 v11, 0x0

    array-length v12, v1

    invoke-virtual {p1, v1, v11, v12}, Ljava/io/PushbackInputStream;->read([BII)I

    move-result v6

    .line 348
    .local v6, "len":I
    const/4 v11, 0x0

    invoke-virtual {p1, v1, v11, v6}, Ljava/io/PushbackInputStream;->unread([BII)V

    .line 349
    new-instance v8, Ljava/io/InputStreamReader;

    new-instance v11, Ljava/io/ByteArrayInputStream;

    const/4 v12, 0x4

    invoke-direct {v11, v1, v12, v6}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-direct {v8, v11, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 357
    .local v8, "r":Ljava/io/Reader;
    invoke-virtual {v8}, Ljava/io/Reader;->read()I

    move-result v2

    .local v2, "c":I
    const/16 v11, 0x6c

    if-eq v2, v11, :cond_27

    .line 358
    const-string v11, "UTF-8"

    invoke-direct {p0, p1, v11}, Lcom/bea/xml/stream/reader/XmlReader;->setEncoding(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 463
    :goto_26
    return-void

    .line 371
    :cond_27
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 372
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    .line 373
    .local v5, "keyBuf":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .line 374
    .local v4, "key":Ljava/lang/String;
    const/4 v9, 0x0

    .line 375
    .local v9, "sawEq":Z
    const/4 v7, 0x0

    .line 376
    .local v7, "quoteChar":C
    const/4 v10, 0x0

    .line 379
    .local v10, "sawQuestion":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_32
    const/16 v11, 0x1fb

    if-ge v3, v11, :cond_3d

    .line 380
    invoke-virtual {v8}, Ljava/io/Reader;->read()I

    move-result v2

    const/4 v11, -0x1

    if-ne v2, v11, :cond_43

    .line 462
    :cond_3d
    const-string v11, "UTF-8"

    invoke-direct {p0, p1, v11}, Lcom/bea/xml/stream/reader/XmlReader;->setEncoding(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_26

    .line 384
    :cond_43
    const/16 v11, 0x20

    if-eq v2, v11, :cond_53

    const/16 v11, 0x9

    if-eq v2, v11, :cond_53

    const/16 v11, 0xa

    if-eq v2, v11, :cond_53

    const/16 v11, 0xd

    if-ne v2, v11, :cond_56

    .line 379
    :cond_53
    :goto_53
    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    .line 388
    :cond_56
    if-eqz v3, :cond_3d

    .line 392
    const/16 v11, 0x3f

    if-ne v2, v11, :cond_75

    .line 393
    const/4 v10, 0x1

    .line 401
    :cond_5d
    :goto_5d
    if-eqz v4, :cond_61

    if-nez v9, :cond_9c

    .line 402
    :cond_61
    if-nez v5, :cond_7d

    .line 403
    int-to-char v11, v2

    invoke-static {v11}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v11

    if-nez v11, :cond_53

    .line 405
    move-object v5, v0

    .line 406
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 407
    int-to-char v11, v2

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 408
    const/4 v9, 0x0

    .line 409
    goto :goto_53

    .line 394
    :cond_75
    if-eqz v10, :cond_5d

    .line 395
    const/16 v11, 0x3e

    if-eq v2, v11, :cond_3d

    .line 397
    const/4 v10, 0x0

    goto :goto_5d

    .line 409
    :cond_7d
    int-to-char v11, v2

    invoke-static {v11}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v11

    if-eqz v11, :cond_89

    .line 410
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 411
    goto :goto_53

    :cond_89
    const/16 v11, 0x3d

    if-ne v2, v11, :cond_97

    .line 412
    if-nez v4, :cond_93

    .line 413
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 414
    :cond_93
    const/4 v9, 0x1

    .line 415
    const/4 v5, 0x0

    .line 416
    const/4 v7, 0x0

    .line 417
    goto :goto_53

    .line 418
    :cond_97
    int-to-char v11, v2

    invoke-virtual {v5, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_53

    .line 423
    :cond_9c
    int-to-char v11, v2

    invoke-static {v11}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v11

    if-nez v11, :cond_53

    .line 425
    const/16 v11, 0x22

    if-eq v2, v11, :cond_ab

    const/16 v11, 0x27

    if-ne v2, v11, :cond_108

    .line 426
    :cond_ab
    if-nez v7, :cond_b3

    .line 427
    int-to-char v7, v2

    .line 428
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_53

    .line 430
    :cond_b3
    if-ne v2, v7, :cond_108

    .line 431
    const-string v11, "encoding"

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_105

    .line 432
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/bea/xml/stream/reader/XmlReader;->assignedEncoding:Ljava/lang/String;

    .line 435
    const/4 v3, 0x0

    :goto_c4
    iget-object v11, p0, Lcom/bea/xml/stream/reader/XmlReader;->assignedEncoding:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v3, v11, :cond_fe

    .line 436
    iget-object v11, p0, Lcom/bea/xml/stream/reader/XmlReader;->assignedEncoding:Ljava/lang/String;

    invoke-virtual {v11, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 437
    const/16 v11, 0x41

    if-lt v2, v11, :cond_da

    const/16 v11, 0x5a

    if-le v2, v11, :cond_e2

    :cond_da
    const/16 v11, 0x61

    if-lt v2, v11, :cond_e5

    const/16 v11, 0x7a

    if-gt v2, v11, :cond_e5

    .line 435
    :cond_e2
    :goto_e2
    add-int/lit8 v3, v3, 0x1

    goto :goto_c4

    .line 440
    :cond_e5
    if-eqz v3, :cond_3d

    .line 442
    if-lez v3, :cond_3d

    const/16 v11, 0x2d

    if-eq v2, v11, :cond_e2

    const/16 v11, 0x30

    if-lt v2, v11, :cond_f5

    const/16 v11, 0x39

    if-le v2, v11, :cond_e2

    :cond_f5
    const/16 v11, 0x2e

    if-eq v2, v11, :cond_e2

    const/16 v11, 0x5f

    if-ne v2, v11, :cond_3d

    goto :goto_e2

    .line 450
    :cond_fe
    iget-object v11, p0, Lcom/bea/xml/stream/reader/XmlReader;->assignedEncoding:Ljava/lang/String;

    invoke-direct {p0, p1, v11}, Lcom/bea/xml/stream/reader/XmlReader;->setEncoding(Ljava/io/InputStream;Ljava/lang/String;)V

    goto/16 :goto_26

    .line 454
    :cond_105
    const/4 v4, 0x0

    .line 455
    goto/16 :goto_53

    .line 459
    :cond_108
    int-to-char v11, v2

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_53
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 551
    iget-boolean v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->closed:Z

    if-eqz v0, :cond_5

    .line 556
    :goto_4
    return-void

    .line 553
    :cond_5
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 554
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    .line 555
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->closed:Z

    goto :goto_4
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->assignedEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public mark(I)V
    .registers 3
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 519
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    invoke-virtual {v0, p1}, Ljava/io/Reader;->mark(I)V

    .line 520
    :cond_9
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 509
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->markSupported()Z

    move-result v0

    goto :goto_5
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 494
    iget-boolean v1, p0, Lcom/bea/xml/stream/reader/XmlReader;->closed:Z

    if-eqz v1, :cond_c

    .line 495
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 497
    :cond_c
    iget-object v1, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 498
    .local v0, "val":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_18

    .line 499
    invoke-virtual {p0}, Lcom/bea/xml/stream/reader/XmlReader;->close()V

    .line 501
    :cond_18
    return v0
.end method

.method public read([CII)I
    .registers 7
    .param p1, "buf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 479
    iget-boolean v2, p0, Lcom/bea/xml/stream/reader/XmlReader;->closed:Z

    if-eqz v2, :cond_7

    move v0, v1

    .line 484
    :cond_6
    :goto_6
    return v0

    .line 481
    :cond_7
    iget-object v2, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/Reader;->read([CII)I

    move-result v0

    .line 482
    .local v0, "val":I
    if-ne v0, v1, :cond_6

    .line 483
    invoke-virtual {p0}, Lcom/bea/xml/stream/reader/XmlReader;->close()V

    goto :goto_6
.end method

.method public ready()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 543
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->ready()Z

    move-result v0

    goto :goto_5
.end method

.method public reset()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 527
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->reset()V

    .line 528
    :cond_9
    return-void
.end method

.method public skip(J)J
    .registers 5
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 535
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    if-nez v0, :cond_7

    const-wide/16 v0, 0x0

    :goto_6
    return-wide v0

    :cond_7
    iget-object v0, p0, Lcom/bea/xml/stream/reader/XmlReader;->in:Ljava/io/Reader;

    invoke-virtual {v0, p1, p2}, Ljava/io/Reader;->skip(J)J

    move-result-wide v0

    goto :goto_6
.end method
