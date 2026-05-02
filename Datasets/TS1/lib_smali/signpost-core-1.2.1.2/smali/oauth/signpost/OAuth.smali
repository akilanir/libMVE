.class public Loauth/signpost/OAuth;
.super Ljava/lang/Object;
.source "OAuth.java"


# static fields
.field public static final ENCODING:Ljava/lang/String; = "UTF-8"

.field public static final FORM_ENCODED:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field public static final HTTP_AUTHORIZATION_HEADER:Ljava/lang/String; = "Authorization"

.field public static final OAUTH_CALLBACK:Ljava/lang/String; = "oauth_callback"

.field public static final OAUTH_CALLBACK_CONFIRMED:Ljava/lang/String; = "oauth_callback_confirmed"

.field public static final OAUTH_CONSUMER_KEY:Ljava/lang/String; = "oauth_consumer_key"

.field public static final OAUTH_NONCE:Ljava/lang/String; = "oauth_nonce"

.field public static final OAUTH_SIGNATURE:Ljava/lang/String; = "oauth_signature"

.field public static final OAUTH_SIGNATURE_METHOD:Ljava/lang/String; = "oauth_signature_method"

.field public static final OAUTH_TIMESTAMP:Ljava/lang/String; = "oauth_timestamp"

.field public static final OAUTH_TOKEN:Ljava/lang/String; = "oauth_token"

.field public static final OAUTH_TOKEN_SECRET:Ljava/lang/String; = "oauth_token_secret"

.field public static final OAUTH_VERIFIER:Ljava/lang/String; = "oauth_verifier"

.field public static final OAUTH_VERSION:Ljava/lang/String; = "oauth_version"

.field public static final OUT_OF_BAND:Ljava/lang/String; = "oob"

.field public static final VERSION_1_0:Ljava/lang/String; = "1.0"

.field private static final percentEncoder:Lcom/google/gdata/util/common/base/PercentEscaper;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 76
    new-instance v0, Lcom/google/gdata/util/common/base/PercentEscaper;

    const-string v1, "-._~"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/gdata/util/common/base/PercentEscaper;-><init>(Ljava/lang/String;Z)V

    sput-object v0, Loauth/signpost/OAuth;->percentEncoder:Lcom/google/gdata/util/common/base/PercentEscaper;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addQueryParameters(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .registers 8
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 231
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v4

    mul-int/lit8 v4, v4, 0x2

    new-array v3, v4, [Ljava/lang/String;

    .line 232
    .local v3, "kvPairs":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 233
    .local v1, "idx":I
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 234
    .local v2, "key":Ljava/lang/String;
    aput-object v2, v3, v1

    .line 235
    add-int/lit8 v5, v1, 0x1

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    aput-object v4, v3, v5

    .line 236
    add-int/lit8 v1, v1, 0x2

    goto :goto_11

    .line 238
    .end local v2    # "key":Ljava/lang/String;
    :cond_2c
    invoke-static {p0, v3}, Loauth/signpost/OAuth;->addQueryParameters(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static varargs addQueryParameters(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "kvPairs"    # [Ljava/lang/String;

    .prologue
    .line 218
    const-string v3, "?"

    invoke-virtual {p0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_56

    const-string v1, "&"

    .line 219
    .local v1, "queryDelim":Ljava/lang/String;
    :goto_a
    new-instance v2, Ljava/lang/StringBuilder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 220
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v3, p1

    if-ge v0, v3, :cond_59

    .line 221
    if-lez v0, :cond_2b

    .line 222
    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    :cond_2b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v4, p1, v0

    invoke-static {v4}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    aget-object v4, p1, v4

    invoke-static {v4}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    add-int/lit8 v0, v0, 0x2

    goto :goto_21

    .line 218
    .end local v0    # "i":I
    .end local v1    # "queryDelim":Ljava/lang/String;
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_56
    const-string v1, "?"

    goto :goto_a

    .line 227
    .restart local v0    # "i":I
    .restart local v1    # "queryDelim":Ljava/lang/String;
    .restart local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_59
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static addQueryString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "queryString"    # Ljava/lang/String;

    .prologue
    .line 242
    const-string v2, "?"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_28

    const-string v0, "&"

    .line 243
    .local v0, "queryDelim":Ljava/lang/String;
    :goto_a
    new-instance v1, Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 242
    .end local v0    # "queryDelim":Ljava/lang/String;
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_28
    const-string v0, "?"

    goto :goto_a
.end method

.method public static debugOut(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 311
    const-string v0, "debug"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2a

    .line 312
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[SIGNPOST] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 314
    :cond_2a
    return-void
.end method

.method public static decodeForm(Ljava/io/InputStream;)Loauth/signpost/http/HttpParameters;
    .registers 5
    .param p0, "content"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 159
    .local v1, "reader":Ljava/io/BufferedReader;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 161
    .local v0, "line":Ljava/lang/String;
    :goto_13
    if-eqz v0, :cond_1d

    .line 162
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_13

    .line 166
    :cond_1d
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Loauth/signpost/OAuth;->decodeForm(Ljava/lang/String;)Loauth/signpost/http/HttpParameters;

    move-result-object v3

    return-object v3
.end method

.method public static decodeForm(Ljava/lang/String;)Loauth/signpost/http/HttpParameters;
    .registers 10
    .param p0, "form"    # Ljava/lang/String;

    .prologue
    .line 134
    new-instance v6, Loauth/signpost/http/HttpParameters;

    invoke-direct {v6}, Loauth/signpost/http/HttpParameters;-><init>()V

    .line 135
    .local v6, "params":Loauth/signpost/http/HttpParameters;
    invoke-static {p0}, Loauth/signpost/OAuth;->isEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 152
    :cond_b
    return-object v6

    .line 138
    :cond_c
    const-string v8, "\\&"

    invoke-virtual {p0, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_14
    if-ge v2, v3, :cond_b

    aget-object v5, v0, v2

    .line 139
    .local v5, "nvp":Ljava/lang/String;
    const/16 v8, 0x3d

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 142
    .local v1, "equals":I
    if-gez v1, :cond_2b

    .line 143
    invoke-static {v5}, Loauth/signpost/OAuth;->percentDecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 144
    .local v4, "name":Ljava/lang/String;
    const/4 v7, 0x0

    .line 150
    .local v7, "value":Ljava/lang/String;
    :goto_25
    invoke-virtual {v6, v4, v7}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 138
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 146
    .end local v4    # "name":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :cond_2b
    const/4 v8, 0x0

    invoke-virtual {v5, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Loauth/signpost/OAuth;->percentDecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 147
    .restart local v4    # "name":Ljava/lang/String;
    add-int/lit8 v8, v1, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Loauth/signpost/OAuth;->percentDecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .restart local v7    # "value":Ljava/lang/String;
    goto :goto_25
.end method

.method public static formEncode(Ljava/util/Collection;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>(",
            "Ljava/util/Collection",
            "<TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "parameters":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 128
    .local v0, "b":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, v0}, Loauth/signpost/OAuth;->formEncode(Ljava/util/Collection;Ljava/io/OutputStream;)V

    .line 129
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    return-object v1
.end method

.method public static formEncode(Ljava/util/Collection;Ljava/io/OutputStream;)V
    .registers 6
    .param p1, "into"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>(",
            "Ljava/util/Collection",
            "<TT;>;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "parameters":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    if-eqz p0, :cond_48

    .line 106
    const/4 v1, 0x1

    .line 107
    .local v1, "first":Z
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_48

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 108
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v1, :cond_42

    .line 109
    const/4 v1, 0x0

    .line 113
    :goto_16
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Loauth/signpost/OAuth;->safeToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 114
    const/16 v3, 0x3d

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write(I)V

    .line 115
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Loauth/signpost/OAuth;->safeToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    goto :goto_7

    .line 111
    :cond_42
    const/16 v3, 0x26

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write(I)V

    goto :goto_16

    .line 118
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "first":Z
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_48
    return-void
.end method

.method public static isEmpty(Ljava/lang/String;)Z
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 192
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static oauthHeaderToParamsMap(Ljava/lang/String;)Loauth/signpost/http/HttpParameters;
    .registers 12
    .param p0, "oauthHeader"    # Ljava/lang/String;

    .prologue
    .line 282
    new-instance v6, Loauth/signpost/http/HttpParameters;

    invoke-direct {v6}, Loauth/signpost/http/HttpParameters;-><init>()V

    .line 283
    .local v6, "params":Loauth/signpost/http/HttpParameters;
    if-eqz p0, :cond_f

    const-string v7, "OAuth "

    invoke-virtual {p0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_10

    .line 292
    :cond_f
    return-object v6

    .line 286
    :cond_10
    const-string v7, "OAuth "

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 287
    const-string v7, ","

    invoke-virtual {p0, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 288
    .local v1, "elements":[Ljava/lang/String;
    move-object v0, v1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_23
    if-ge v2, v5, :cond_f

    aget-object v4, v0, v2

    .line 289
    .local v4, "keyValuePair":Ljava/lang/String;
    const-string v7, "="

    invoke-virtual {v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 290
    .local v3, "keyValue":[Ljava/lang/String;
    const/4 v7, 0x0

    aget-object v7, v3, v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    aget-object v8, v3, v8

    const-string v9, "\""

    const-string v10, ""

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 288
    add-int/lit8 v2, v2, 0x1

    goto :goto_23
.end method

.method public static percentDecode(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 88
    if-nez p0, :cond_5

    .line 89
    :try_start_2
    const-string v1, ""

    .line 91
    :goto_4
    return-object v1

    :cond_5
    const-string v1, "UTF-8"

    invoke-static {p0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_a} :catch_c

    move-result-object v1

    goto :goto_4

    .line 93
    :catch_c
    move-exception v0

    .line 94
    .local v0, "wow":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static percentEncode(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 80
    if-nez p0, :cond_5

    .line 81
    const-string v0, ""

    .line 83
    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Loauth/signpost/OAuth;->percentEncoder:Lcom/google/gdata/util/common/base/PercentEscaper;

    invoke-virtual {v0, p0}, Lcom/google/gdata/util/common/base/PercentEscaper;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method

.method public static varargs prepareOAuthHeader([Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "kvPairs"    # [Ljava/lang/String;

    .prologue
    .line 268
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "OAuth "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 269
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v4, p0

    if-ge v0, v4, :cond_61

    .line 270
    if-lez v0, :cond_12

    .line 271
    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    :cond_12
    aget-object v4, p0, v0

    const-string v5, "oauth_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_26

    aget-object v4, p0, v0

    const-string v5, "x_oauth_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5a

    :cond_26
    const/4 v1, 0x1

    .line 275
    .local v1, "isOAuthElem":Z
    :goto_27
    if-eqz v1, :cond_5c

    add-int/lit8 v4, v0, 0x1

    aget-object v4, p0, v4

    invoke-static {v4}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 276
    .local v3, "value":Ljava/lang/String;
    :goto_31
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v5, p0, v0

    invoke-static {v5}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "=\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    add-int/lit8 v0, v0, 0x2

    goto :goto_8

    .line 273
    .end local v1    # "isOAuthElem":Z
    .end local v3    # "value":Ljava/lang/String;
    :cond_5a
    const/4 v1, 0x0

    goto :goto_27

    .line 275
    .restart local v1    # "isOAuthElem":Z
    :cond_5c
    add-int/lit8 v4, v0, 0x1

    aget-object v3, p0, v4

    goto :goto_31

    .line 278
    .end local v1    # "isOAuthElem":Z
    :cond_61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static final safeToString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "from"    # Ljava/lang/Object;

    .prologue
    .line 188
    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public static toHeaderElement(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 307
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toMap(Ljava/util/Collection;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>(",
            "Ljava/util/Collection",
            "<TT;>;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 175
    .local p0, "from":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 176
    .local v3, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_2b

    .line 177
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 178
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 179
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_b

    .line 180
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    .line 184
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/String;
    :cond_2b
    return-object v3
.end method
