.class public abstract Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;
.super Ljava/lang/Object;
.source "AuthSchemeBase.java"

# interfaces
.implements Lcz/msebera/android/httpclient/auth/ContextAwareAuthScheme;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private challengeState:Lcz/msebera/android/httpclient/auth/ChallengeState;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/auth/ChallengeState;)V
    .registers 2
    .param p1, "challengeState"    # Lcz/msebera/android/httpclient/auth/ChallengeState;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->challengeState:Lcz/msebera/android/httpclient/auth/ChallengeState;

    .line 73
    return-void
.end method


# virtual methods
.method public authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/Header;
    .registers 5
    .param p1, "credentials"    # Lcz/msebera/android/httpclient/auth/Credentials;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 136
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getChallengeState()Lcz/msebera/android/httpclient/auth/ChallengeState;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->challengeState:Lcz/msebera/android/httpclient/auth/ChallengeState;

    return-object v0
.end method

.method public isProxy()Z
    .registers 3

    .prologue
    .line 147
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->challengeState:Lcz/msebera/android/httpclient/auth/ChallengeState;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->challengeState:Lcz/msebera/android/httpclient/auth/ChallengeState;

    sget-object v1, Lcz/msebera/android/httpclient/auth/ChallengeState;->PROXY:Lcz/msebera/android/httpclient/auth/ChallengeState;

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected abstract parseChallenge(Lcz/msebera/android/httpclient/util/CharArrayBuffer;II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/MalformedChallengeException;
        }
    .end annotation
.end method

.method public processChallenge(Lcz/msebera/android/httpclient/Header;)V
    .registers 11
    .param p1, "header"    # Lcz/msebera/android/httpclient/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 90
    const-string v6, "Header"

    invoke-static {p1, v6}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    invoke-interface {p1}, Lcz/msebera/android/httpclient/Header;->getName()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "authheader":Ljava/lang/String;
    const-string v6, "WWW-Authenticate"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_39

    .line 93
    sget-object v6, Lcz/msebera/android/httpclient/auth/ChallengeState;->TARGET:Lcz/msebera/android/httpclient/auth/ChallengeState;

    iput-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->challengeState:Lcz/msebera/android/httpclient/auth/ChallengeState;

    .line 102
    :goto_15
    instance-of v6, p1, Lcz/msebera/android/httpclient/FormattedHeader;

    if-eqz v6, :cond_5f

    move-object v6, p1

    .line 103
    check-cast v6, Lcz/msebera/android/httpclient/FormattedHeader;

    invoke-interface {v6}, Lcz/msebera/android/httpclient/FormattedHeader;->getBuffer()Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v2

    .line 104
    .local v2, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    check-cast p1, Lcz/msebera/android/httpclient/FormattedHeader;

    .end local p1    # "header":Lcz/msebera/android/httpclient/Header;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/FormattedHeader;->getValuePos()I

    move-result v4

    .line 114
    .local v4, "pos":I
    :goto_26
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v6

    if-ge v4, v6, :cond_7b

    invoke-virtual {v2, v4}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcz/msebera/android/httpclient/protocol/HTTP;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_7b

    .line 115
    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    .line 94
    .end local v2    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .end local v4    # "pos":I
    .restart local p1    # "header":Lcz/msebera/android/httpclient/Header;
    :cond_39
    const-string v6, "Proxy-Authenticate"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_46

    .line 95
    sget-object v6, Lcz/msebera/android/httpclient/auth/ChallengeState;->PROXY:Lcz/msebera/android/httpclient/auth/ChallengeState;

    iput-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->challengeState:Lcz/msebera/android/httpclient/auth/ChallengeState;

    goto :goto_15

    .line 97
    :cond_46
    new-instance v6, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected header name: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 106
    :cond_5f
    invoke-interface {p1}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 107
    .local v5, "s":Ljava/lang/String;
    if-nez v5, :cond_6d

    .line 108
    new-instance v6, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;

    const-string v7, "Header value is null"

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 110
    :cond_6d
    new-instance v2, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    invoke-direct {v2, v6}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 111
    .restart local v2    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {v2, v5}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 112
    const/4 v4, 0x0

    .restart local v4    # "pos":I
    goto :goto_26

    .line 117
    .end local v5    # "s":Ljava/lang/String;
    .end local p1    # "header":Lcz/msebera/android/httpclient/Header;
    :cond_7b
    move v1, v4

    .line 118
    .local v1, "beginIndex":I
    :goto_7c
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v6

    if-ge v4, v6, :cond_8f

    invoke-virtual {v2, v4}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcz/msebera/android/httpclient/protocol/HTTP;->isWhitespace(C)Z

    move-result v6

    if-nez v6, :cond_8f

    .line 119
    add-int/lit8 v4, v4, 0x1

    goto :goto_7c

    .line 121
    :cond_8f
    move v3, v4

    .line 122
    .local v3, "endIndex":I
    invoke-virtual {v2, v1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 123
    .restart local v5    # "s":Ljava/lang/String;
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->getSchemeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_b7

    .line 124
    new-instance v6, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid scheme identifier: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 127
    :cond_b7
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v6

    invoke-virtual {p0, v2, v4, v6}, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->parseChallenge(Lcz/msebera/android/httpclient/util/CharArrayBuffer;II)V

    .line 128
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 161
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/auth/AuthSchemeBase;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_d

    .line 163
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 165
    :goto_c
    return-object v1

    :cond_d
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method
