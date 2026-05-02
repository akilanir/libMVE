.class public Lcom/koushikdutta/async/http/body/Part;
.super Ljava/lang/Object;
.source "Part.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final CONTENT_DISPOSITION:Ljava/lang/String; = "Content-Disposition"


# instance fields
.field private length:J

.field mContentDisposition:Lcom/koushikdutta/async/http/Multimap;

.field mHeaders:Lcom/koushikdutta/async/http/Headers;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    const-class v0, Lcom/koushikdutta/async/http/body/Part;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/http/body/Part;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/async/http/Headers;)V
    .registers 4
    .param p1, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/koushikdutta/async/http/body/Part;->length:J

    .line 18
    iput-object p1, p0, Lcom/koushikdutta/async/http/body/Part;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    .line 19
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/Part;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v1, "Content-Disposition"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/koushikdutta/async/http/Multimap;->parseSemicolonDelimited(Ljava/lang/String;)Lcom/koushikdutta/async/http/Multimap;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/async/http/body/Part;->mContentDisposition:Lcom/koushikdutta/async/http/Multimap;

    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JLjava/util/List;)V
    .registers 13
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "length"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/List",
            "<",
            "Lcom/koushikdutta/async/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, "contentDisposition":Ljava/util/List;, "Ljava/util/List<Lcom/koushikdutta/async/http/NameValuePair;>;"
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-wide/16 v3, -0x1

    iput-wide v3, p0, Lcom/koushikdutta/async/http/body/Part;->length:J

    .line 28
    iput-wide p2, p0, Lcom/koushikdutta/async/http/body/Part;->length:J

    .line 29
    new-instance v3, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v3}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    iput-object v3, p0, Lcom/koushikdutta/async/http/body/Part;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "form-data; name=\"%s\""

    new-array v4, v7, [Ljava/lang/Object;

    aput-object p1, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .local v0, "builder":Ljava/lang/StringBuilder;
    if-eqz p4, :cond_4c

    .line 32
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_27
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/async/http/NameValuePair;

    .line 33
    .local v2, "pair":Lcom/koushikdutta/async/http/NameValuePair;
    const-string v3, "; %s=\"%s\""

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-interface {v2}, Lcom/koushikdutta/async/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2}, Lcom/koushikdutta/async/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_27

    .line 36
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "pair":Lcom/koushikdutta/async/http/NameValuePair;
    :cond_4c
    iget-object v3, p0, Lcom/koushikdutta/async/http/body/Part;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v4, "Content-Disposition"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 37
    iget-object v3, p0, Lcom/koushikdutta/async/http/body/Part;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v4, "Content-Disposition"

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/koushikdutta/async/http/Multimap;->parseSemicolonDelimited(Ljava/lang/String;)Lcom/koushikdutta/async/http/Multimap;

    move-result-object v3

    iput-object v3, p0, Lcom/koushikdutta/async/http/body/Part;->mContentDisposition:Lcom/koushikdutta/async/http/Multimap;

    .line 38
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 45
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/Part;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .registers 4

    .prologue
    .line 53
    iget-object v1, p0, Lcom/koushikdutta/async/http/body/Part;->mContentDisposition:Lcom/koushikdutta/async/http/Multimap;

    const-string v2, "filename"

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/http/Multimap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "file":Ljava/lang/String;
    if-nez v0, :cond_c

    .line 55
    const/4 v1, 0x0

    .line 56
    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 23
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/Part;->mContentDisposition:Lcom/koushikdutta/async/http/Multimap;

    const-string v1, "name"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Multimap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRawHeaders()Lcom/koushikdutta/async/http/Headers;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/Part;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    return-object v0
.end method

.method public isFile()Z
    .registers 3

    .prologue
    .line 60
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/Part;->mContentDisposition:Lcom/koushikdutta/async/http/Multimap;

    const-string v1, "filename"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Multimap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public length()J
    .registers 3

    .prologue
    .line 64
    iget-wide v0, p0, Lcom/koushikdutta/async/http/body/Part;->length:J

    return-wide v0
.end method

.method public setContentType(Ljava/lang/String;)V
    .registers 4
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/Part;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1, p1}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 50
    return-void
.end method

.method public write(Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 4
    .param p1, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "callback"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 68
    sget-boolean v0, Lcom/koushikdutta/async/http/body/Part;->$assertionsDisabled:Z

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 69
    :cond_a
    return-void
.end method
