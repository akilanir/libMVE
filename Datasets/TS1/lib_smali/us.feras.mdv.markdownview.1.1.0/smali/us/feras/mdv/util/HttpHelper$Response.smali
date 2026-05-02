.class public Lus/feras/mdv/util/HttpHelper$Response;
.super Ljava/lang/Object;
.source "HttpHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lus/feras/mdv/util/HttpHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Response"
.end annotation


# instance fields
.field private httpResponseCode:I

.field private httpResponseHeader:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private httpResponseMessage:Ljava/lang/String;

.field private serverResponseMessage:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    return-void
.end method

.method constructor <init>(Ljava/util/Set;ILjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p2, "httpResponseCode"    # I
    .param p3, "httpResponseMessage"    # Ljava/lang/String;
    .param p4, "responseMessage"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;>;I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "httpResponseHeader":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    invoke-virtual {p0, p1}, Lus/feras/mdv/util/HttpHelper$Response;->setHttpResponseHeader(Ljava/util/Set;)V

    .line 140
    invoke-virtual {p0, p2}, Lus/feras/mdv/util/HttpHelper$Response;->setHttpResponseCode(I)V

    .line 141
    invoke-virtual {p0, p3}, Lus/feras/mdv/util/HttpHelper$Response;->setHttpResponseMessage(Ljava/lang/String;)V

    .line 142
    invoke-virtual {p0, p4}, Lus/feras/mdv/util/HttpHelper$Response;->setResponseMessage(Ljava/lang/String;)V

    .line 143
    return-void
.end method


# virtual methods
.method public getHttpResponseCode()I
    .registers 2

    .prologue
    .line 163
    iget v0, p0, Lus/feras/mdv/util/HttpHelper$Response;->httpResponseCode:I

    return v0
.end method

.method public getHttpResponseHeader()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation

    .prologue
    .line 154
    iget-object v0, p0, Lus/feras/mdv/util/HttpHelper$Response;->httpResponseHeader:Ljava/util/Set;

    return-object v0
.end method

.method public getHttpResponseMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lus/feras/mdv/util/HttpHelper$Response;->httpResponseMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lus/feras/mdv/util/HttpHelper$Response;->serverResponseMessage:Ljava/lang/String;

    return-object v0
.end method

.method public setHttpResponseCode(I)V
    .registers 2
    .param p1, "httpResponseCode"    # I

    .prologue
    .line 167
    iput p1, p0, Lus/feras/mdv/util/HttpHelper$Response;->httpResponseCode:I

    .line 168
    return-void
.end method

.method public setHttpResponseHeader(Ljava/util/Set;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;>;)V"
        }
    .end annotation

    .prologue
    .line 159
    .local p1, "httpResponseHeader":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;>;"
    iput-object p1, p0, Lus/feras/mdv/util/HttpHelper$Response;->httpResponseHeader:Ljava/util/Set;

    .line 160
    return-void
.end method

.method public setHttpResponseMessage(Ljava/lang/String;)V
    .registers 2
    .param p1, "httpResponseMessage"    # Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Lus/feras/mdv/util/HttpHelper$Response;->httpResponseMessage:Ljava/lang/String;

    .line 151
    return-void
.end method

.method public setResponseMessage(Ljava/lang/String;)V
    .registers 2
    .param p1, "responseMessage"    # Ljava/lang/String;

    .prologue
    .line 175
    iput-object p1, p0, Lus/feras/mdv/util/HttpHelper$Response;->serverResponseMessage:Ljava/lang/String;

    .line 176
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "httpResponseCode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lus/feras/mdv/util/HttpHelper$Response;->httpResponseCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " , "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "httpResponseMessage = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lus/feras/mdv/util/HttpHelper$Response;->httpResponseMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " , "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "serverResponseMessage = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lus/feras/mdv/util/HttpHelper$Response;->serverResponseMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
