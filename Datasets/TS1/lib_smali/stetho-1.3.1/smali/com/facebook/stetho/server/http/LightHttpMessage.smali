.class public Lcom/facebook/stetho/server/http/LightHttpMessage;
.super Ljava/lang/Object;
.source "LightHttpMessage.java"


# instance fields
.field public final headerNames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final headerValues:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerNames:Ljava/util/ArrayList;

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerValues:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerNames:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    iget-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerValues:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    return-void
.end method

.method public getFirstHeaderValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 27
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerNames:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, "N":I
    :goto_7
    if-ge v1, v0, :cond_21

    .line 28
    iget-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerNames:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 29
    iget-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerValues:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 32
    :goto_1d
    return-object v2

    .line 27
    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 32
    :cond_21
    const/4 v2, 0x0

    goto :goto_1d
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerNames:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 37
    iget-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerValues:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 38
    return-void
.end method
