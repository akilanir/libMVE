.class public Lcz/msebera/android/httpclient/impl/auth/BasicScheme;
.super Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;
.source "BasicScheme.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private complete:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 84
    sget-object v0, Lcz/msebera/android/httpclient/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/auth/ChallengeState;)V
    .registers 2
    .param p1, "challengeState"    # Lcz/msebera/android/httpclient/auth/ChallengeState;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;-><init>(Lcz/msebera/android/httpclient/auth/ChallengeState;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "credentialsCharset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;->complete:Z

    .line 67
    return-void
.end method

.method public static authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Ljava/lang/String;Z)Lcz/msebera/android/httpclient/Header;
    .registers 8
    .param p0, "credentials"    # Lcz/msebera/android/httpclient/auth/Credentials;
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "proxy"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 196
    const-string v3, "Credentials"

    invoke-static {p0, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 197
    const-string v3, "charset"

    invoke-static {p1, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 199
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    .local v2, "tmp":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Lcz/msebera/android/httpclient/auth/Credentials;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v3

    invoke-interface {v3}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-interface {p0}, Lcz/msebera/android/httpclient/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_55

    const-string v3, "null"

    :goto_27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1}, Lcz/msebera/android/httpclient/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v3

    const/4 v4, 0x2

    .line 204
    invoke-static {v3, v4}, Lcz/msebera/android/httpclient/extras/Base64;->encode([BI)[B

    move-result-object v0

    .line 207
    .local v0, "base64password":[B
    new-instance v1, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    const/16 v3, 0x20

    invoke-direct {v1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 208
    .local v1, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    if-eqz p2, :cond_5a

    .line 209
    const-string v3, "Proxy-Authorization"

    invoke-virtual {v1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 213
    :goto_45
    const-string v3, ": Basic "

    invoke-virtual {v1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 214
    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {v1, v0, v3, v4}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append([BII)V

    .line 216
    new-instance v3, Lcz/msebera/android/httpclient/message/BufferedHeader;

    invoke-direct {v3, v1}, Lcz/msebera/android/httpclient/message/BufferedHeader;-><init>(Lcz/msebera/android/httpclient/util/CharArrayBuffer;)V

    return-object v3

    .line 202
    .end local v0    # "base64password":[B
    .end local v1    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :cond_55
    invoke-interface {p0}, Lcz/msebera/android/httpclient/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v3

    goto :goto_27

    .line 211
    .restart local v0    # "base64password":[B
    .restart local v1    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :cond_5a
    const-string v3, "Authorization"

    invoke-virtual {v1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto :goto_45
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
    .line 137
    new-instance v0, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;->authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public authenticate(Lcz/msebera/android/httpclient/auth/Credentials;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/Header;
    .registers 9
    .param p1, "credentials"    # Lcz/msebera/android/httpclient/auth/Credentials;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 158
    const-string v3, "Credentials"

    invoke-static {p1, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 159
    const-string v3, "HTTP request"

    invoke-static {p2, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 160
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .local v2, "tmp":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/auth/Credentials;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v3

    invoke-interface {v3}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    invoke-interface {p1}, Lcz/msebera/android/httpclient/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_5d

    const-string v3, "null"

    :goto_27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;->getCredentialsCharset(Lcz/msebera/android/httpclient/HttpRequest;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcz/msebera/android/httpclient/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v3

    const/4 v4, 0x2

    .line 165
    invoke-static {v3, v4}, Lcz/msebera/android/httpclient/extras/Base64;->encode([BI)[B

    move-result-object v0

    .line 168
    .local v0, "base64password":[B
    new-instance v1, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    const/16 v3, 0x20

    invoke-direct {v1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 169
    .local v1, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;->isProxy()Z

    move-result v3

    if-eqz v3, :cond_62

    .line 170
    const-string v3, "Proxy-Authorization"

    invoke-virtual {v1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 174
    :goto_4d
    const-string v3, ": Basic "

    invoke-virtual {v1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 175
    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {v1, v0, v3, v4}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append([BII)V

    .line 177
    new-instance v3, Lcz/msebera/android/httpclient/message/BufferedHeader;

    invoke-direct {v3, v1}, Lcz/msebera/android/httpclient/message/BufferedHeader;-><init>(Lcz/msebera/android/httpclient/util/CharArrayBuffer;)V

    return-object v3

    .line 163
    .end local v0    # "base64password":[B
    .end local v1    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :cond_5d
    invoke-interface {p1}, Lcz/msebera/android/httpclient/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v3

    goto :goto_27

    .line 172
    .restart local v0    # "base64password":[B
    .restart local v1    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :cond_62
    const-string v3, "Authorization"

    invoke-virtual {v1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto :goto_4d
.end method

.method public getSchemeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    const-string v0, "basic"

    return-object v0
.end method

.method public isComplete()Z
    .registers 2

    .prologue
    .line 118
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;->complete:Z

    return v0
.end method

.method public isConnectionBased()Z
    .registers 2

    .prologue
    .line 127
    const/4 v0, 0x0

    return v0
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
    .line 107
    invoke-super {p0, p1}, Lcz/msebera/android/httpclient/impl/auth/RFC2617Scheme;->processChallenge(Lcz/msebera/android/httpclient/Header;)V

    .line 108
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;->complete:Z

    .line 109
    return-void
.end method
