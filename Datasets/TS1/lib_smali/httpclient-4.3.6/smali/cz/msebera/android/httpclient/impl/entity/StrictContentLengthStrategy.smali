.class public Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;
.super Ljava/lang/Object;
.source "StrictContentLengthStrategy.java"

# interfaces
.implements Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;


# instance fields
.field private final implicitLen:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 53
    new-instance v0, Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 75
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;-><init>(I)V

    .line 76
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "implicitLen"    # I

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput p1, p0, Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;->implicitLen:I

    .line 68
    return-void
.end method


# virtual methods
.method public determineLength(Lcz/msebera/android/httpclient/HttpMessage;)J
    .registers 11
    .param p1, "message"    # Lcz/msebera/android/httpclient/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 79
    const-string v6, "HTTP message"

    invoke-static {p1, v6}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    const-string v6, "Transfer-Encoding"

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    .line 84
    .local v5, "transferEncodingHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v5, :cond_69

    .line 85
    invoke-interface {v5}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 86
    .local v4, "s":Ljava/lang/String;
    const-string v6, "chunked"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_45

    .line 87
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpMessage;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v6

    sget-object v7, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/ProtocolVersion;->lessEquals(Lcz/msebera/android/httpclient/ProtocolVersion;)Z

    move-result v6

    if-eqz v6, :cond_42

    .line 88
    new-instance v6, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Chunked transfer encoding not allowed for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 90
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpMessage;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 92
    :cond_42
    const-wide/16 v2, -0x2

    .line 113
    .end local v4    # "s":Ljava/lang/String;
    :cond_44
    :goto_44
    return-wide v2

    .line 93
    .restart local v4    # "s":Ljava/lang/String;
    :cond_45
    const-string v6, "identity"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_50

    .line 94
    const-wide/16 v2, -0x1

    goto :goto_44

    .line 96
    :cond_50
    new-instance v6, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unsupported transfer encoding: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 100
    .end local v4    # "s":Ljava/lang/String;
    :cond_69
    const-string v6, "Content-Length"

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 101
    .local v0, "contentLengthHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_b2

    .line 102
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 104
    .restart local v4    # "s":Ljava/lang/String;
    :try_start_75
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 105
    .local v2, "len":J
    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-gez v6, :cond_44

    .line 106
    new-instance v6, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Negative content length: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_98
    .catch Ljava/lang/NumberFormatException; {:try_start_75 .. :try_end_98} :catch_98

    .line 109
    .end local v2    # "len":J
    :catch_98
    move-exception v1

    .line 110
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v6, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid content length: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 113
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "s":Ljava/lang/String;
    :cond_b2
    iget v6, p0, Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;->implicitLen:I

    int-to-long v2, v6

    goto :goto_44
.end method
