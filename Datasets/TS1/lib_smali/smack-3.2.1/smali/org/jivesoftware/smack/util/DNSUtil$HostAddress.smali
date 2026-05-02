.class public Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
.super Ljava/lang/Object;
.source "DNSUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/DNSUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HostAddress"
.end annotation


# instance fields
.field private host:Ljava/lang/String;

.field private port:I


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    iput-object p1, p0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->host:Ljava/lang/String;

    .line 215
    iput p2, p0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->port:I

    .line 216
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/jivesoftware/smack/util/DNSUtil$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lorg/jivesoftware/smack/util/DNSUtil$1;

    .prologue
    .line 208
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 241
    if-ne p0, p1, :cond_5

    .line 253
    :cond_4
    :goto_4
    return v1

    .line 244
    :cond_5
    instance-of v3, p1, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    if-nez v3, :cond_b

    move v1, v2

    .line 245
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 248
    check-cast v0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    .line 250
    .local v0, "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    iget-object v3, p0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->host:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->host:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a

    move v1, v2

    .line 251
    goto :goto_4

    .line 253
    :cond_1a
    iget v3, p0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->port:I

    iget v4, v0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->port:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 224
    iget-object v0, p0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 233
    iget v0, p0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->port:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
