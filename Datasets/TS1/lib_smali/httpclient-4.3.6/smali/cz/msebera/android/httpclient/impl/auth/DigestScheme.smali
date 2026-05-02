.class public Lcz/msebera/android/httpclient/impl/auth/DigestScheme;
.super Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;
.source "DigestScheme.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final HEXADECIMAL:[C

.field private static final QOP_AUTH:I = 0x2

.field private static final QOP_AUTH_INT:I = 0x1

.field private static final QOP_MISSING:I = 0x0

.field private static final QOP_UNKNOWN:I = -0x1


# instance fields
.field private a1:Ljava/lang/String;

.field private a2:Ljava/lang/String;

.field private cnonce:Ljava/lang/String;

.field private complete:Z

.field private lastNonce:Ljava/lang/String;

.field private nounceCount:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 83
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->HEXADECIMAL:[C

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

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 124
    sget-object v0, Lcz/msebera/android/httpclient/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 125
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/auth/ChallengeState;)V
    .registers 2
    .param p1, "challengeState"    # Lcz/msebera/android/httpclient/auth/ChallengeState;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;-><init>(Lcz/msebera/android/httpclient/auth/ChallengeState;)V

    .line 121
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "credentialsCharset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 106
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->complete:Z

    .line 108
    return-void
.end method

.method public static createCnonce()Ljava/lang/String;
    .registers 3

    .prologue
    .line 473
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 474
    .local v0, "rnd":Ljava/security/SecureRandom;
    const/16 v2, 0x8

    new-array v1, v2, [B

    .line 475
    .local v1, "tmp":[B
    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 476
    invoke-static {v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private createDigestHeader(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/Header;
    .registers 44
    .param p1, "credentials"    # Lcz/msebera/android/httpclient/auth/Credentials;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 248
    const-string v36, "uri"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 249
    .local v34, "uri":Ljava/lang/String;
    const-string v36, "realm"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 250
    .local v30, "realm":Ljava/lang/String;
    const-string v36, "nonce"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 251
    .local v22, "nonce":Ljava/lang/String;
    const-string v36, "opaque"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 252
    .local v23, "opaque":Ljava/lang/String;
    const-string v36, "methodname"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 253
    .local v18, "method":Ljava/lang/String;
    const-string v36, "algorithm"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 255
    .local v3, "algorithm":Ljava/lang/String;
    if-nez v3, :cond_40

    .line 256
    const-string v3, "MD5"

    .line 259
    :cond_40
    new-instance v29, Ljava/util/HashSet;

    const/16 v36, 0x8

    move-object/from16 v0, v29

    move/from16 v1, v36

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 260
    .local v29, "qopset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/16 v27, -0x1

    .line 261
    .local v27, "qop":I
    const-string v36, "qop"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 262
    .local v28, "qoplist":Ljava/lang/String;
    if-eqz v28, :cond_cc

    .line 263
    new-instance v32, Ljava/util/StringTokenizer;

    const-string v36, ","

    move-object/from16 v0, v32

    move-object/from16 v1, v28

    move-object/from16 v2, v36

    invoke-direct {v0, v1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .local v32, "tok":Ljava/util/StringTokenizer;
    :goto_66
    invoke-virtual/range {v32 .. v32}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v36

    if-eqz v36, :cond_82

    .line 265
    invoke-virtual/range {v32 .. v32}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v35

    .line 266
    .local v35, "variant":Ljava/lang/String;
    sget-object v36, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual/range {v35 .. v36}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v29

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_66

    .line 268
    .end local v35    # "variant":Ljava/lang/String;
    :cond_82
    move-object/from16 v0, p2

    instance-of v0, v0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    move/from16 v36, v0

    if-eqz v36, :cond_bd

    const-string v36, "auth-int"

    move-object/from16 v0, v29

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_bd

    .line 269
    const/16 v27, 0x1

    .line 277
    .end local v32    # "tok":Ljava/util/StringTokenizer;
    :cond_98
    :goto_98
    const/16 v36, -0x1

    move/from16 v0, v27

    move/from16 v1, v36

    if-ne v0, v1, :cond_cf

    .line 278
    new-instance v36, Lcz/msebera/android/httpclient/auth/AuthenticationException;

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "None of the qop methods is supported: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lcz/msebera/android/httpclient/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 270
    .restart local v32    # "tok":Ljava/util/StringTokenizer;
    :cond_bd
    const-string v36, "auth"

    move-object/from16 v0, v29

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_98

    .line 271
    const/16 v27, 0x2

    goto :goto_98

    .line 274
    .end local v32    # "tok":Ljava/util/StringTokenizer;
    :cond_cc
    const/16 v27, 0x0

    goto :goto_98

    .line 281
    :cond_cf
    const-string v36, "charset"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 282
    .local v5, "charset":Ljava/lang/String;
    if-nez v5, :cond_dd

    .line 283
    const-string v5, "ISO-8859-1"

    .line 286
    :cond_dd
    move-object v7, v3

    .line 287
    .local v7, "digAlg":Ljava/lang/String;
    const-string v36, "MD5-sess"

    move-object/from16 v0, v36

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v36

    if-eqz v36, :cond_ea

    .line 288
    const-string v7, "MD5"

    .line 293
    :cond_ea
    :try_start_ea
    invoke-static {v7}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->createMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_ed
    .catch Lcz/msebera/android/httpclient/impl/auth/UnsupportedDigestAlgorithmException; {:try_start_ea .. :try_end_ed} :catch_3e4

    move-result-object v10

    .line 298
    .local v10, "digester":Ljava/security/MessageDigest;
    invoke-interface/range {p1 .. p1}, Lcz/msebera/android/httpclient/auth/Credentials;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v36

    invoke-interface/range {v36 .. v36}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v33

    .line 299
    .local v33, "uname":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lcz/msebera/android/httpclient/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v26

    .line 301
    .local v26, "pwd":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->lastNonce:Ljava/lang/String;

    move-object/from16 v36, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_400

    .line 302
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->nounceCount:J

    move-wide/from16 v36, v0

    const-wide/16 v38, 0x1

    add-long v36, v36, v38

    move-wide/from16 v0, v36

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->nounceCount:J

    .line 308
    :goto_11a
    new-instance v31, Ljava/lang/StringBuilder;

    const/16 v36, 0x100

    move-object/from16 v0, v31

    move/from16 v1, v36

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 309
    .local v31, "sb":Ljava/lang/StringBuilder;
    new-instance v14, Ljava/util/Formatter;

    sget-object v36, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v31

    move-object/from16 v1, v36

    invoke-direct {v14, v0, v1}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    .line 310
    .local v14, "formatter":Ljava/util/Formatter;
    const-string v36, "%08x"

    const/16 v37, 0x1

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->nounceCount:J

    move-wide/from16 v39, v0

    invoke-static/range {v39 .. v40}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v39

    aput-object v39, v37, v38

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-virtual {v14, v0, v1}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 311
    invoke-virtual {v14}, Ljava/util/Formatter;->close()V

    .line 312
    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 314
    .local v20, "nc":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    move-object/from16 v36, v0

    if-nez v36, :cond_168

    .line 315
    invoke-static {}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->createCnonce()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    .line 318
    :cond_168
    const/16 v36, 0x0

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    .line 319
    const/16 v36, 0x0

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    .line 321
    const-string v36, "MD5-sess"

    move-object/from16 v0, v36

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v36

    if-eqz v36, :cond_418

    .line 327
    const/16 v36, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 328
    move-object/from16 v0, v31

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v10, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v36

    invoke-static/range {v36 .. v36}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v6

    .line 330
    .local v6, "checksum":Ljava/lang/String;
    const/16 v36, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 331
    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    move-object/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    .line 340
    .end local v6    # "checksum":Ljava/lang/String;
    :goto_1f8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v10, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v36

    invoke-static/range {v36 .. v36}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v15

    .line 342
    .local v15, "hasha1":Ljava/lang/String;
    const/16 v36, 0x2

    move/from16 v0, v27

    move/from16 v1, v36

    if-ne v0, v1, :cond_450

    .line 344
    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    .line 376
    .end local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :goto_23b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v10, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v36

    invoke-static/range {v36 .. v36}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v16

    .line 381
    .local v16, "hasha2":Ljava/lang/String;
    if-nez v27, :cond_526

    .line 382
    const/16 v36, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 383
    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 393
    .local v9, "digestValue":Ljava/lang/String;
    :goto_281
    invoke-static {v9}, Lcz/msebera/android/httpclient/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v10, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v36

    invoke-static/range {v36 .. v36}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v8

    .line 395
    .local v8, "digest":Ljava/lang/String;
    new-instance v4, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    const/16 v36, 0x80

    move/from16 v0, v36

    invoke-direct {v4, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 396
    .local v4, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->isProxy()Z

    move-result v36

    if-eqz v36, :cond_58f

    .line 397
    const-string v36, "Proxy-Authorization"

    move-object/from16 v0, v36

    invoke-virtual {v4, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 401
    :goto_2a5
    const-string v36, ": Digest "

    move-object/from16 v0, v36

    invoke-virtual {v4, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 403
    new-instance v25, Ljava/util/ArrayList;

    const/16 v36, 0x14

    move-object/from16 v0, v25

    move/from16 v1, v36

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 404
    .local v25, "params":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/message/BasicNameValuePair;>;"
    new-instance v36, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v37, "username"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 405
    new-instance v36, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v37, "realm"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v30

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 406
    new-instance v36, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v37, "nonce"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 407
    new-instance v36, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v37, "uri"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 408
    new-instance v36, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v37, "response"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-direct {v0, v1, v8}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 410
    if-eqz v27, :cond_361

    .line 411
    new-instance v37, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v38, "qop"

    const/16 v36, 0x1

    move/from16 v0, v27

    move/from16 v1, v36

    if-ne v0, v1, :cond_598

    const-string v36, "auth-int"

    :goto_329
    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 412
    new-instance v36, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v37, "nc"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 413
    new-instance v36, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v37, "cnonce"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    move-object/from16 v38, v0

    invoke-direct/range {v36 .. v38}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 416
    :cond_361
    new-instance v36, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v37, "algorithm"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-direct {v0, v1, v3}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 417
    if-eqz v23, :cond_389

    .line 418
    new-instance v36, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    const-string v37, "opaque"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 421
    :cond_389
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_38b
    invoke-interface/range {v25 .. v25}, Ljava/util/List;->size()I

    move-result v36

    move/from16 v0, v17

    move/from16 v1, v36

    if-ge v0, v1, :cond_5a4

    .line 422
    move-object/from16 v0, v25

    move/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcz/msebera/android/httpclient/message/BasicNameValuePair;

    .line 423
    .local v24, "param":Lcz/msebera/android/httpclient/message/BasicNameValuePair;
    if-lez v17, :cond_3a8

    .line 424
    const-string v36, ", "

    move-object/from16 v0, v36

    invoke-virtual {v4, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 426
    :cond_3a8
    invoke-virtual/range {v24 .. v24}, Lcz/msebera/android/httpclient/message/BasicNameValuePair;->getName()Ljava/lang/String;

    move-result-object v19

    .line 427
    .local v19, "name":Ljava/lang/String;
    const-string v36, "nc"

    move-object/from16 v0, v36

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-nez v36, :cond_3d0

    const-string v36, "qop"

    move-object/from16 v0, v36

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-nez v36, :cond_3d0

    const-string v36, "algorithm"

    .line 428
    move-object/from16 v0, v36

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_59c

    :cond_3d0
    const/16 v21, 0x1

    .line 429
    .local v21, "noQuotes":Z
    :goto_3d2
    sget-object v37, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    if-nez v21, :cond_5a0

    const/16 v36, 0x1

    :goto_3d8
    move-object/from16 v0, v37

    move-object/from16 v1, v24

    move/from16 v2, v36

    invoke-virtual {v0, v4, v1, v2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->formatNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/NameValuePair;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .line 421
    add-int/lit8 v17, v17, 0x1

    goto :goto_38b

    .line 294
    .end local v4    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .end local v8    # "digest":Ljava/lang/String;
    .end local v9    # "digestValue":Ljava/lang/String;
    .end local v10    # "digester":Ljava/security/MessageDigest;
    .end local v14    # "formatter":Ljava/util/Formatter;
    .end local v15    # "hasha1":Ljava/lang/String;
    .end local v16    # "hasha2":Ljava/lang/String;
    .end local v17    # "i":I
    .end local v19    # "name":Ljava/lang/String;
    .end local v20    # "nc":Ljava/lang/String;
    .end local v21    # "noQuotes":Z
    .end local v24    # "param":Lcz/msebera/android/httpclient/message/BasicNameValuePair;
    .end local v25    # "params":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/message/BasicNameValuePair;>;"
    .end local v26    # "pwd":Ljava/lang/String;
    .end local v31    # "sb":Ljava/lang/StringBuilder;
    .end local v33    # "uname":Ljava/lang/String;
    .restart local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :catch_3e4
    move-exception v13

    .line 295
    .local v13, "ex":Lcz/msebera/android/httpclient/impl/auth/UnsupportedDigestAlgorithmException;
    new-instance v36, Lcz/msebera/android/httpclient/auth/AuthenticationException;

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "Unsuppported digest algorithm: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lcz/msebera/android/httpclient/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 304
    .end local v13    # "ex":Lcz/msebera/android/httpclient/impl/auth/UnsupportedDigestAlgorithmException;
    .restart local v10    # "digester":Ljava/security/MessageDigest;
    .restart local v26    # "pwd":Ljava/lang/String;
    .restart local v33    # "uname":Ljava/lang/String;
    :cond_400
    const-wide/16 v36, 0x1

    move-wide/from16 v0, v36

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->nounceCount:J

    .line 305
    const/16 v36, 0x0

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    .line 306
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->lastNonce:Ljava/lang/String;

    goto/16 :goto_11a

    .line 335
    .restart local v14    # "formatter":Ljava/util/Formatter;
    .restart local v20    # "nc":Ljava/lang/String;
    .restart local v31    # "sb":Ljava/lang/StringBuilder;
    :cond_418
    const/16 v36, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 336
    move-object/from16 v0, v31

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    goto/16 :goto_1f8

    .line 345
    .restart local v15    # "hasha1":Ljava/lang/String;
    :cond_450
    const/16 v36, 0x1

    move/from16 v0, v27

    move/from16 v1, v36

    if-ne v0, v1, :cond_4ff

    .line 347
    const/4 v11, 0x0

    .line 348
    .local v11, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    move-object/from16 v0, p2

    instance-of v0, v0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    move/from16 v36, v0

    if-eqz v36, :cond_467

    .line 349
    check-cast p2, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    .end local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-interface/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v11

    .line 351
    :cond_467
    if-eqz v11, :cond_4ac

    invoke-interface {v11}, Lcz/msebera/android/httpclient/HttpEntity;->isRepeatable()Z

    move-result v36

    if-nez v36, :cond_4ac

    .line 353
    const-string v36, "auth"

    move-object/from16 v0, v29

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_4a4

    .line 354
    const/16 v27, 0x2

    .line 355
    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    goto/16 :goto_23b

    .line 357
    :cond_4a4
    new-instance v36, Lcz/msebera/android/httpclient/auth/AuthenticationException;

    const-string v37, "Qop auth-int cannot be used with a non-repeatable entity"

    invoke-direct/range {v36 .. v37}, Lcz/msebera/android/httpclient/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 361
    :cond_4ac
    new-instance v12, Lcz/msebera/android/httpclient/impl/auth/HttpEntityDigester;

    invoke-direct {v12, v10}, Lcz/msebera/android/httpclient/impl/auth/HttpEntityDigester;-><init>(Ljava/security/MessageDigest;)V

    .line 363
    .local v12, "entityDigester":Lcz/msebera/android/httpclient/impl/auth/HttpEntityDigester;
    if-eqz v11, :cond_4b6

    .line 364
    :try_start_4b3
    invoke-interface {v11, v12}, Lcz/msebera/android/httpclient/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 366
    :cond_4b6
    invoke-virtual {v12}, Lcz/msebera/android/httpclient/impl/auth/HttpEntityDigester;->close()V
    :try_end_4b9
    .catch Ljava/io/IOException; {:try_start_4b3 .. :try_end_4b9} :catch_4f2

    .line 370
    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual {v12}, Lcz/msebera/android/httpclient/impl/auth/HttpEntityDigester;->getDigest()[B

    move-result-object v37

    invoke-static/range {v37 .. v37}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->encode([B)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    goto/16 :goto_23b

    .line 367
    :catch_4f2
    move-exception v13

    .line 368
    .local v13, "ex":Ljava/io/IOException;
    new-instance v36, Lcz/msebera/android/httpclient/auth/AuthenticationException;

    const-string v37, "I/O error reading entity content"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-direct {v0, v1, v13}, Lcz/msebera/android/httpclient/auth/AuthenticationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v36

    .line 373
    .end local v11    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    .end local v12    # "entityDigester":Lcz/msebera/android/httpclient/impl/auth/HttpEntityDigester;
    .end local v13    # "ex":Ljava/io/IOException;
    .restart local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :cond_4ff
    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    goto/16 :goto_23b

    .line 386
    .end local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    .restart local v16    # "hasha2":Ljava/lang/String;
    :cond_526
    const/16 v36, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 387
    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    move-object/from16 v37, v0

    .line 388
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v36, 0x1

    move/from16 v0, v27

    move/from16 v1, v36

    if-ne v0, v1, :cond_58c

    const-string v36, "auth-int"

    :goto_571
    move-object/from16 v0, v37

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x3a

    .line 389
    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .restart local v9    # "digestValue":Ljava/lang/String;
    goto/16 :goto_281

    .line 388
    .end local v9    # "digestValue":Ljava/lang/String;
    :cond_58c
    const-string v36, "auth"

    goto :goto_571

    .line 399
    .restart local v4    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .restart local v8    # "digest":Ljava/lang/String;
    .restart local v9    # "digestValue":Ljava/lang/String;
    :cond_58f
    const-string v36, "Authorization"

    move-object/from16 v0, v36

    invoke-virtual {v4, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto/16 :goto_2a5

    .line 411
    .restart local v25    # "params":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/message/BasicNameValuePair;>;"
    :cond_598
    const-string v36, "auth"

    goto/16 :goto_329

    .line 428
    .restart local v17    # "i":I
    .restart local v19    # "name":Ljava/lang/String;
    .restart local v24    # "param":Lcz/msebera/android/httpclient/message/BasicNameValuePair;
    :cond_59c
    const/16 v21, 0x0

    goto/16 :goto_3d2

    .line 429
    .restart local v21    # "noQuotes":Z
    :cond_5a0
    const/16 v36, 0x0

    goto/16 :goto_3d8

    .line 431
    .end local v19    # "name":Ljava/lang/String;
    .end local v21    # "noQuotes":Z
    .end local v24    # "param":Lcz/msebera/android/httpclient/message/BasicNameValuePair;
    :cond_5a4
    new-instance v36, Lcz/msebera/android/httpclient/message/BufferedHeader;

    move-object/from16 v0, v36

    invoke-direct {v0, v4}, Lcz/msebera/android/httpclient/message/BufferedHeader;-><init>(Lcz/msebera/android/httpclient/util/CharArrayBuffer;)V

    return-object v36
.end method

.method private static createMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;
    .registers 5
    .param p0, "digAlg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/impl/auth/UnsupportedDigestAlgorithmException;
        }
    .end annotation

    .prologue
    .line 230
    :try_start_0
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 231
    :catch_5
    move-exception v0

    .line 232
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcz/msebera/android/httpclient/impl/auth/UnsupportedDigestAlgorithmException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported algorithm in HTTP Digest authentication: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcz/msebera/android/httpclient/impl/auth/UnsupportedDigestAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static encode([B)Ljava/lang/String;
    .registers 8
    .param p0, "binaryData"    # [B

    .prologue
    .line 454
    array-length v4, p0

    .line 455
    .local v4, "n":I
    mul-int/lit8 v5, v4, 0x2

    new-array v0, v5, [C

    .line 456
    .local v0, "buffer":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    if-ge v2, v4, :cond_27

    .line 457
    aget-byte v5, p0, v2

    and-int/lit8 v3, v5, 0xf

    .line 458
    .local v3, "low":I
    aget-byte v5, p0, v2

    and-int/lit16 v5, v5, 0xf0

    shr-int/lit8 v1, v5, 0x4

    .line 459
    .local v1, "high":I
    mul-int/lit8 v5, v2, 0x2

    sget-object v6, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->HEXADECIMAL:[C

    aget-char v6, v6, v1

    aput-char v6, v0, v5

    .line 460
    mul-int/lit8 v5, v2, 0x2

    add-int/lit8 v5, v5, 0x1

    sget-object v6, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->HEXADECIMAL:[C

    aget-char v6, v6, v3

    aput-char v6, v0, v5

    .line 456
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 463
    .end local v1    # "high":I
    .end local v3    # "low":I
    :cond_27
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([C)V

    return-object v5
.end method


# virtual methods
.method public authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/Header;
    .registers 4
    .param p1, "credentials"    # Lcz/msebera/android/httpclient/auth/Credentials;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/AuthenticationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 186
    new-instance v0, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/Header;
    .registers 8
    .param p1, "credentials"    # Lcz/msebera/android/httpclient/auth/Credentials;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 209
    const-string v1, "Credentials"

    invoke-static {p1, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 210
    const-string v1, "HTTP request"

    invoke-static {p2, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 211
    const-string v1, "realm"

    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1a

    .line 212
    new-instance v1, Lcz/msebera/android/httpclient/auth/AuthenticationException;

    const-string v2, "missing realm in challenge"

    invoke-direct {v1, v2}, Lcz/msebera/android/httpclient/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 214
    :cond_1a
    const-string v1, "nonce"

    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2a

    .line 215
    new-instance v1, Lcz/msebera/android/httpclient/auth/AuthenticationException;

    const-string v2, "missing nonce in challenge"

    invoke-direct {v1, v2}, Lcz/msebera/android/httpclient/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 218
    :cond_2a
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameters()Ljava/util/Map;

    move-result-object v1

    const-string v2, "methodname"

    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameters()Ljava/util/Map;

    move-result-object v1

    const-string v2, "uri"

    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    const-string v1, "charset"

    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 221
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_61

    .line 222
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameters()Ljava/util/Map;

    move-result-object v1

    const-string v2, "charset"

    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getCredentialsCharset(Lcz/msebera/android/httpclient/HttpRequest;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    :cond_61
    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->createDigestHeader(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    return-object v1
.end method

.method getA1()Ljava/lang/String;
    .registers 2

    .prologue
    .line 439
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a1:Ljava/lang/String;

    return-object v0
.end method

.method getA2()Ljava/lang/String;
    .registers 2

    .prologue
    .line 443
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->a2:Ljava/lang/String;

    return-object v0
.end method

.method getCnonce()Ljava/lang/String;
    .registers 2

    .prologue
    .line 435
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->cnonce:Ljava/lang/String;

    return-object v0
.end method

.method public getSchemeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 163
    const-string v0, "digest"

    return-object v0
.end method

.method public isComplete()Z
    .registers 3

    .prologue
    .line 149
    const-string v1, "stale"

    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "s":Ljava/lang/String;
    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 151
    const/4 v1, 0x0

    .line 153
    :goto_f
    return v1

    :cond_10
    iget-boolean v1, p0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->complete:Z

    goto :goto_f
.end method

.method public isConnectionBased()Z
    .registers 2

    .prologue
    .line 172
    const/4 v0, 0x0

    return v0
.end method

.method public overrideParamter(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 176
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->getParameters()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    return-void
.end method

.method public processChallenge(Lcz/msebera/android/httpclient/Header;)V
    .registers 3
    .param p1, "header"    # Lcz/msebera/android/httpclient/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-super {p0, p1}, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->processChallenge(Lcz/msebera/android/httpclient/Header;)V

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->complete:Z

    .line 140
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 481
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 482
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "DIGEST [complete="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->complete:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", nonce="

    .line 483
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->lastNonce:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", nc="

    .line 484
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcz/msebera/android/httpclient/impl/auth/DigestScheme;->nounceCount:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    .line 485
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
