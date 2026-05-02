.class public Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
.super Ljava/lang/Object;
.source "SkeinParameters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/params/SkeinParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private parameters:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->parameters:Ljava/util/Hashtable;

    .line 157
    return-void
.end method

.method public constructor <init>(Ljava/util/Hashtable;)V
    .registers 6
    .param p1, "paramsMap"    # Ljava/util/Hashtable;

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->parameters:Ljava/util/Hashtable;

    .line 161
    invoke-virtual {p1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 162
    .local v1, "keys":Ljava/util/Enumeration;
    :goto_e
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 164
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 165
    .local v0, "key":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->parameters:Ljava/util/Hashtable;

    invoke-virtual {p1, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e

    .line 167
    .end local v0    # "key":Ljava/lang/Integer;
    :cond_24
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/params/SkeinParameters;)V
    .registers 6
    .param p1, "params"    # Lorg/spongycastle/crypto/params/SkeinParameters;

    .prologue
    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->parameters:Ljava/util/Hashtable;

    .line 171
    # getter for: Lorg/spongycastle/crypto/params/SkeinParameters;->parameters:Ljava/util/Hashtable;
    invoke-static {p1}, Lorg/spongycastle/crypto/params/SkeinParameters;->access$000(Lorg/spongycastle/crypto/params/SkeinParameters;)Ljava/util/Hashtable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 172
    .local v1, "keys":Ljava/util/Enumeration;
    :goto_12
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 174
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 175
    .local v0, "key":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->parameters:Ljava/util/Hashtable;

    # getter for: Lorg/spongycastle/crypto/params/SkeinParameters;->parameters:Ljava/util/Hashtable;
    invoke-static {p1}, Lorg/spongycastle/crypto/params/SkeinParameters;->access$000(Lorg/spongycastle/crypto/params/SkeinParameters;)Ljava/util/Hashtable;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    .line 177
    .end local v0    # "key":Ljava/lang/Integer;
    :cond_2c
    return-void
.end method


# virtual methods
.method public build()Lorg/spongycastle/crypto/params/SkeinParameters;
    .registers 4

    .prologue
    .line 326
    new-instance v0, Lorg/spongycastle/crypto/params/SkeinParameters;

    iget-object v1, p0, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->parameters:Ljava/util/Hashtable;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/params/SkeinParameters;-><init>(Ljava/util/Hashtable;Lorg/spongycastle/crypto/params/SkeinParameters$1;)V

    return-object v0
.end method

.method public set(I[B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    .registers 5
    .param p1, "type"    # I
    .param p2, "value"    # [B

    .prologue
    const/4 v1, 0x4

    .line 194
    if-nez p2, :cond_b

    .line 196
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parameter value must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_b
    if-eqz p1, :cond_1f

    if-le p1, v1, :cond_17

    const/16 v0, 0x3f

    if-ge p1, v0, :cond_17

    const/16 v0, 0x30

    if-ne p1, v0, :cond_1f

    .line 201
    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parameter types must be in the range 0,5..47,49..62."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 203
    :cond_1f
    if-ne p1, v1, :cond_29

    .line 205
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parameter type 4 is reserved for internal use."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 208
    :cond_29
    iget-object v0, p0, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->parameters:Ljava/util/Hashtable;

    invoke-static {p1}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    return-object p0
.end method

.method public setKey([B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    .registers 3
    .param p1, "key"    # [B

    .prologue
    .line 217
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->set(I[B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setKeyIdentifier([B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    .registers 3
    .param p1, "keyIdentifier"    # [B

    .prologue
    .line 309
    const/16 v0, 0x10

    invoke-virtual {p0, v0, p1}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->set(I[B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setNonce([B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    .registers 3
    .param p1, "nonce"    # [B

    .prologue
    .line 317
    const/16 v0, 0x14

    invoke-virtual {p0, v0, p1}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->set(I[B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setPersonalisation(Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    .registers 11
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "emailAddress"    # Ljava/lang/String;
    .param p3, "distinguisher"    # Ljava/lang/String;

    .prologue
    .line 244
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 245
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/io/OutputStreamWriter;

    const-string v4, "UTF-8"

    invoke-direct {v3, v0, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 246
    .local v3, "out":Ljava/io/OutputStreamWriter;
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v4, "YYYYMMDD"

    invoke-direct {v2, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 247
    .local v2, "format":Ljava/text/DateFormat;
    invoke-virtual {v2, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 248
    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 249
    invoke-virtual {v3, p2}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 250
    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 251
    invoke-virtual {v3, p3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 252
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V

    .line 253
    const/16 v4, 0x8

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->set(I[B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_36} :catch_38

    move-result-object v4

    return-object v4

    .line 255
    .end local v0    # "bout":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "format":Ljava/text/DateFormat;
    .end local v3    # "out":Ljava/io/OutputStreamWriter;
    :catch_38
    move-exception v1

    .line 257
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Byte I/O failed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public setPersonalisation(Ljava/util/Date;Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    .registers 12
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "dateLocale"    # Ljava/util/Locale;
    .param p3, "emailAddress"    # Ljava/lang/String;
    .param p4, "distinguisher"    # Ljava/lang/String;

    .prologue
    .line 279
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 280
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/io/OutputStreamWriter;

    const-string v4, "UTF-8"

    invoke-direct {v3, v0, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 281
    .local v3, "out":Ljava/io/OutputStreamWriter;
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v4, "YYYYMMDD"

    invoke-direct {v2, v4, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 282
    .local v2, "format":Ljava/text/DateFormat;
    invoke-virtual {v2, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 283
    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 284
    invoke-virtual {v3, p3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 285
    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 286
    invoke-virtual {v3, p4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 287
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V

    .line 288
    const/16 v4, 0x8

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->set(I[B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_36} :catch_38

    move-result-object v4

    return-object v4

    .line 290
    .end local v0    # "bout":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "format":Ljava/text/DateFormat;
    .end local v3    # "out":Ljava/io/OutputStreamWriter;
    :catch_38
    move-exception v1

    .line 292
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Byte I/O failed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public setPersonalisation([B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    .registers 3
    .param p1, "personalisation"    # [B

    .prologue
    .line 225
    const/16 v0, 0x8

    invoke-virtual {p0, v0, p1}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->set(I[B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setPublicKey([B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;
    .registers 3
    .param p1, "publicKey"    # [B

    .prologue
    .line 301
    const/16 v0, 0xc

    invoke-virtual {p0, v0, p1}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->set(I[B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;

    move-result-object v0

    return-object v0
.end method
