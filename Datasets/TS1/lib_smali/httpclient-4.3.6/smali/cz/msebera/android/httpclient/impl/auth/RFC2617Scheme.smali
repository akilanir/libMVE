.class public abstract Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;
.super Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;
.source "RFC2617Scheme.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final credentialsCharset:Ljava/nio/charset/Charset;

.field private final params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 85
    sget-object v0, Lcz/msebera/android/httpclient/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 86
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/auth/ChallengeState;)V
    .registers 3
    .param p1, "challengeState"    # Lcz/msebera/android/httpclient/auth/ChallengeState;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;-><init>(Lcz/msebera/android/httpclient/auth/ChallengeState;)V

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    .line 72
    sget-object v0, Lcz/msebera/android/httpclient/Consts;->ASCII:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->credentialsCharset:Ljava/nio/charset/Charset;

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "credentialsCharset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 79
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;-><init>()V

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    .line 81
    if-eqz p1, :cond_f

    .end local p1    # "credentialsCharset":Ljava/nio/charset/Charset;
    :goto_c
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->credentialsCharset:Ljava/nio/charset/Charset;

    .line 82
    return-void

    .line 81
    .restart local p1    # "credentialsCharset":Ljava/nio/charset/Charset;
    :cond_f
    sget-object p1, Lcz/msebera/android/httpclient/Consts;->ASCII:Ljava/nio/charset/Charset;

    goto :goto_c
.end method


# virtual methods
.method getCredentialsCharset(Lcz/msebera/android/httpclient/HttpRequest;)Ljava/lang/String;
    .registers 5
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 97
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v1

    const-string v2, "http.auth.credential-charset"

    invoke-interface {v1, v2}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 98
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_16

    .line 99
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->getCredentialsCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    .line 101
    :cond_16
    return-object v0
.end method

.method public getCredentialsCharset()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->credentialsCharset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 136
    if-nez p1, :cond_4

    .line 137
    const/4 v0, 0x0

    .line 139
    :goto_3
    return-object v0

    :cond_4
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_3
.end method

.method protected getParameters()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    return-object v0
.end method

.method public getRealm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 148
    const-string v0, "realm"

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected parseChallenge(Lcz/msebera/android/httpclient/util/CharArrayBuffer;II)V
    .registers 13
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "pos"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 107
    sget-object v3, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    .line 108
    .local v3, "parser":Lcz/msebera/android/httpclient/message/HeaderValueParser;
    new-instance v0, Lcz/msebera/android/httpclient/message/ParserCursor;

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v4

    invoke-direct {v0, p2, v4}, Lcz/msebera/android/httpclient/message/ParserCursor;-><init>(II)V

    .line 109
    .local v0, "cursor":Lcz/msebera/android/httpclient/message/ParserCursor;
    invoke-interface {v3, p1, v0}, Lcz/msebera/android/httpclient/message/HeaderValueParser;->parseElements(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v2

    .line 110
    .local v2, "elements":[Lcz/msebera/android/httpclient/HeaderElement;
    array-length v4, v2

    if-nez v4, :cond_1a

    .line 111
    new-instance v4, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;

    const-string v5, "Authentication challenge is empty"

    invoke-direct {v4, v5}, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 113
    :cond_1a
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->clear()V

    .line 114
    array-length v5, v2

    const/4 v4, 0x0

    :goto_21
    if-ge v4, v5, :cond_3b

    aget-object v1, v2, v4

    .line 115
    .local v1, "element":Lcz/msebera/android/httpclient/HeaderElement;
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    add-int/lit8 v4, v4, 0x1

    goto :goto_21

    .line 117
    .end local v1    # "element":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_3b
    return-void
.end method
