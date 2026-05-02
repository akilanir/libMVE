.class public Lcom/sun/mail/smtp/DigestMD5;
.super Ljava/lang/Object;
.source "DigestMD5.java"


# static fields
.field private static digits:[C


# instance fields
.field private clientResponse:Ljava/lang/String;

.field private logger:Lcom/sun/mail/util/MailLogger;

.field private md5:Ljava/security/MessageDigest;

.field private uri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 213
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcom/sun/mail/smtp/DigestMD5;->digits:[C

    return-void

    :array_a
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>(Lcom/sun/mail/util/MailLogger;)V
    .registers 4
    .param p1, "logger"    # Lcom/sun/mail/util/MailLogger;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "DEBUG DIGEST-MD5"

    invoke-virtual {p1, v0, v1}, Lcom/sun/mail/util/MailLogger;->getLogger(Ljava/lang/Class;Ljava/lang/String;)Lcom/sun/mail/util/MailLogger;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/smtp/DigestMD5;->logger:Lcom/sun/mail/util/MailLogger;

    .line 66
    const-string v0, "DIGEST-MD5 Loaded"

    invoke-virtual {p1, v0}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method private static toHex([B)Ljava/lang/String;
    .registers 8
    .param p0, "bytes"    # [B

    .prologue
    .line 222
    array-length v5, p0

    mul-int/lit8 v5, v5, 0x2

    new-array v3, v5, [C

    .line 224
    .local v3, "result":[C
    const/4 v2, 0x0

    .local v2, "index":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    array-length v5, p0

    if-ge v2, v5, :cond_25

    .line 225
    aget-byte v5, p0, v2

    and-int/lit16 v4, v5, 0xff

    .line 226
    .local v4, "temp":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    sget-object v5, Lcom/sun/mail/smtp/DigestMD5;->digits:[C

    shr-int/lit8 v6, v4, 0x4

    aget-char v5, v5, v6

    aput-char v5, v3, v0

    .line 227
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    sget-object v5, Lcom/sun/mail/smtp/DigestMD5;->digits:[C

    and-int/lit8 v6, v4, 0xf

    aget-char v5, v5, v6

    aput-char v5, v3, v1

    .line 224
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 229
    .end local v4    # "temp":I
    :cond_25
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v3}, Ljava/lang/String;-><init>([C)V

    return-object v5
.end method

.method private tokenize(Ljava/lang/String;)Ljava/util/Hashtable;
    .registers 14
    .param p1, "serverResponse"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x39

    const/16 v10, 0x30

    .line 172
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    .line 173
    .local v2, "map":Ljava/util/Hashtable;
    const-string v5, "iso-8859-1"

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 174
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .line 176
    .local v1, "key":Ljava/lang/String;
    new-instance v3, Ljava/io/StreamTokenizer;

    new-instance v5, Ljava/io/InputStreamReader;

    new-instance v6, Lcom/sun/mail/util/BASE64DecoderStream;

    new-instance v7, Ljava/io/ByteArrayInputStream;

    const/4 v8, 0x4

    array-length v9, v0

    add-int/lit8 v9, v9, -0x4

    invoke-direct {v7, v0, v8, v9}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-direct {v6, v7}, Lcom/sun/mail/util/BASE64DecoderStream;-><init>(Ljava/io/InputStream;)V

    const-string v7, "iso-8859-1"

    invoke-direct {v5, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v5}, Ljava/io/StreamTokenizer;-><init>(Ljava/io/Reader;)V

    .line 185
    .local v3, "tokens":Ljava/io/StreamTokenizer;
    invoke-virtual {v3, v10, v11}, Ljava/io/StreamTokenizer;->ordinaryChars(II)V

    .line 186
    invoke-virtual {v3, v10, v11}, Ljava/io/StreamTokenizer;->wordChars(II)V

    .line 187
    :goto_30
    invoke-virtual {v3}, Ljava/io/StreamTokenizer;->nextToken()I

    move-result v4

    .local v4, "ttype":I
    const/4 v5, -0x1

    if-eq v4, v5, :cond_a2

    .line 188
    sparse-switch v4, :sswitch_data_a4

    goto :goto_30

    .line 190
    :sswitch_3b
    if-nez v1, :cond_40

    .line 191
    iget-object v1, v3, Ljava/io/StreamTokenizer;->sval:Ljava/lang/String;

    .line 192
    goto :goto_30

    .line 196
    :cond_40
    :sswitch_40
    iget-object v5, p0, Lcom/sun/mail/smtp/DigestMD5;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_74

    .line 197
    iget-object v5, p0, Lcom/sun/mail/smtp/DigestMD5;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Received => "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "=\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Ljava/io/StreamTokenizer;->sval:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 199
    :cond_74
    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9c

    .line 200
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v3, Ljava/io/StreamTokenizer;->sval:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v1, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    :goto_9a
    const/4 v1, 0x0

    .line 205
    goto :goto_30

    .line 202
    :cond_9c
    iget-object v5, v3, Ljava/io/StreamTokenizer;->sval:Ljava/lang/String;

    invoke-virtual {v2, v1, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9a

    .line 210
    :cond_a2
    return-object v2

    .line 188
    nop

    :sswitch_data_a4
    .sparse-switch
        -0x3 -> :sswitch_3b
        0x22 -> :sswitch_40
    .end sparse-switch
.end method


# virtual methods
.method public authClient(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B
    .registers 24
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "passwd"    # Ljava/lang/String;
    .param p4, "realm"    # Ljava/lang/String;
    .param p5, "serverChallenge"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 78
    .local v3, "bos":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Lcom/sun/mail/util/BASE64EncoderStream;

    const v14, 0x7fffffff

    invoke-direct {v2, v3, v14}, Lcom/sun/mail/util/BASE64EncoderStream;-><init>(Ljava/io/OutputStream;I)V

    .line 82
    .local v2, "b64os":Ljava/io/OutputStream;
    :try_start_d
    new-instance v11, Ljava/security/SecureRandom;

    invoke-direct {v11}, Ljava/security/SecureRandom;-><init>()V

    .line 83
    .local v11, "random":Ljava/security/SecureRandom;
    const-string v14, "MD5"

    invoke-static {v14}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;
    :try_end_1c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_d .. :try_end_1c} :catch_2aa

    .line 88
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    .line 90
    .local v12, "result":Ljava/lang/StringBuffer;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "smtp/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->uri:Ljava/lang/String;

    .line 91
    const-string v8, "00000001"

    .line 92
    .local v8, "nc":Ljava/lang/String;
    const-string v10, "auth"

    .line 93
    .local v10, "qop":Ljava/lang/String;
    const/16 v14, 0x20

    new-array v4, v14, [B

    .line 96
    .local v4, "bytes":[B
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v15, "Begin authentication ..."

    invoke-virtual {v14, v15}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 99
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/sun/mail/smtp/DigestMD5;->tokenize(Ljava/lang/String;)Ljava/util/Hashtable;

    move-result-object v7

    .line 101
    .local v7, "map":Ljava/util/Hashtable;
    if-nez p4, :cond_6a

    .line 102
    const-string v14, "realm"

    invoke-virtual {v7, v14}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 103
    .local v13, "text":Ljava/lang/String;
    if-eqz v13, :cond_2c2

    new-instance v14, Ljava/util/StringTokenizer;

    const-string v15, ","

    invoke-direct {v14, v13, v15}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p4

    .line 108
    .end local v13    # "text":Ljava/lang/String;
    :cond_6a
    :goto_6a
    const-string v14, "nonce"

    invoke-virtual {v7, v14}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 110
    .local v9, "nonce":Ljava/lang/String;
    invoke-virtual {v11, v4}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 111
    invoke-virtual {v2, v4}, Ljava/io/OutputStream;->write([B)V

    .line 112
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 115
    const-string v14, "iso-8859-1"

    invoke-virtual {v3, v14}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 116
    .local v5, "cnonce":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 119
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ":"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ":"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 120
    invoke-static/range {v16 .. v16}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v16

    .line 119
    invoke-virtual/range {v15 .. v16}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/security/MessageDigest;->update([B)V

    .line 121
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/security/MessageDigest;->update([B)V

    .line 122
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v15}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v15

    invoke-static {v15}, Lcom/sun/mail/smtp/DigestMD5;->toHex([B)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->clientResponse:Ljava/lang/String;

    .line 126
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "AUTHENTICATE:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/smtp/DigestMD5;->uri:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/security/MessageDigest;->update([B)V

    .line 127
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/smtp/DigestMD5;->clientResponse:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/sun/mail/smtp/DigestMD5;->toHex([B)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/security/MessageDigest;->update([B)V

    .line 130
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "username=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 131
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ",realm=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 132
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ",qop="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 133
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ",nc="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 134
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ",nonce=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 135
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ",cnonce=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 136
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ",digest-uri=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/sun/mail/smtp/DigestMD5;->uri:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 137
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ",response="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v15}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v15

    invoke-static {v15}, Lcom/sun/mail/smtp/DigestMD5;->toHex([B)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 139
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v15, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v14, v15}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v14

    if-eqz v14, :cond_297

    .line 140
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Response => "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 141
    :cond_297
    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v14

    invoke-virtual {v2, v14}, Ljava/io/OutputStream;->write([B)V

    .line 142
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 143
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v14

    return-object v14

    .line 84
    .end local v4    # "bytes":[B
    .end local v5    # "cnonce":Ljava/lang/String;
    .end local v7    # "map":Ljava/util/Hashtable;
    .end local v8    # "nc":Ljava/lang/String;
    .end local v9    # "nonce":Ljava/lang/String;
    .end local v10    # "qop":Ljava/lang/String;
    .end local v11    # "random":Ljava/security/SecureRandom;
    .end local v12    # "result":Ljava/lang/StringBuffer;
    :catch_2aa
    move-exception v6

    .line 85
    .local v6, "ex":Ljava/security/NoSuchAlgorithmException;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/smtp/DigestMD5;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v15, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v16, "NoSuchAlgorithmException"

    move-object/from16 v0, v16

    invoke-virtual {v14, v15, v0, v6}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 86
    new-instance v14, Ljava/io/IOException;

    invoke-virtual {v6}, Ljava/security/NoSuchAlgorithmException;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v14

    .end local v6    # "ex":Ljava/security/NoSuchAlgorithmException;
    .restart local v4    # "bytes":[B
    .restart local v7    # "map":Ljava/util/Hashtable;
    .restart local v8    # "nc":Ljava/lang/String;
    .restart local v10    # "qop":Ljava/lang/String;
    .restart local v11    # "random":Ljava/security/SecureRandom;
    .restart local v12    # "result":Ljava/lang/StringBuffer;
    .restart local v13    # "text":Ljava/lang/String;
    :cond_2c2
    move-object/from16 p4, p1

    .line 103
    goto/16 :goto_6a
.end method

.method public authServer(Ljava/lang/String;)Z
    .registers 7
    .param p1, "serverResponse"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    invoke-direct {p0, p1}, Lcom/sun/mail/smtp/DigestMD5;->tokenize(Ljava/lang/String;)Ljava/util/Hashtable;

    move-result-object v0

    .line 155
    .local v0, "map":Ljava/util/Hashtable;
    iget-object v2, p0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/sun/mail/smtp/DigestMD5;->uri:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 156
    iget-object v2, p0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/sun/mail/smtp/DigestMD5;->clientResponse:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    invoke-static {v4}, Lcom/sun/mail/smtp/DigestMD5;->toHex([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 157
    iget-object v2, p0, Lcom/sun/mail/smtp/DigestMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    invoke-static {v2}, Lcom/sun/mail/smtp/DigestMD5;->toHex([B)Ljava/lang/String;

    move-result-object v1

    .line 158
    .local v1, "text":Ljava/lang/String;
    const-string v2, "rspauth"

    invoke-virtual {v0, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_84

    .line 159
    iget-object v2, p0, Lcom/sun/mail/smtp/DigestMD5;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_82

    .line 160
    iget-object v2, p0, Lcom/sun/mail/smtp/DigestMD5;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected => rspauth="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 161
    :cond_82
    const/4 v2, 0x0

    .line 163
    :goto_83
    return v2

    :cond_84
    const/4 v2, 0x1

    goto :goto_83
.end method
