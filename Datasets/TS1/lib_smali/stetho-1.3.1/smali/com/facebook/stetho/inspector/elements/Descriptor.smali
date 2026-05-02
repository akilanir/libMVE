.class public abstract Lcom/facebook/stetho/inspector/elements/Descriptor;
.super Ljava/lang/Object;
.source "Descriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/NodeDescriptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/Descriptor$Host;
    }
.end annotation


# instance fields
.field private mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method protected static parseSetAttributesAsTextArg(Ljava/lang/String;)Ljava/util/Map;
    .registers 11
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 77
    const-string v7, ""

    .line 78
    .local v7, "value":Ljava/lang/String;
    const-string v5, ""

    .line 79
    .local v5, "key":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .local v1, "buffer":Ljava/lang/StringBuilder;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 81
    .local v6, "keyValuePairs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 82
    .local v4, "isInsideQuotes":Z
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "N":I
    :goto_15
    if-ge v3, v0, :cond_4a

    .line 83
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 84
    .local v2, "c":C
    const/16 v9, 0x3d

    if-ne v2, v9, :cond_29

    .line 85
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 86
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 82
    :goto_26
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 87
    :cond_29
    const/16 v9, 0x22

    if-ne v2, v9, :cond_3c

    .line 88
    if-eqz v4, :cond_36

    .line 89
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 90
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 92
    :cond_36
    if-nez v4, :cond_3a

    const/4 v4, 0x1

    :goto_39
    goto :goto_26

    :cond_3a
    move v4, v8

    goto :goto_39

    .line 93
    :cond_3c
    const/16 v9, 0x20

    if-ne v2, v9, :cond_46

    if-nez v4, :cond_46

    .line 94
    invoke-interface {v6, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_26

    .line 96
    :cond_46
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 99
    .end local v2    # "c":C
    :cond_4a
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_59

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_59

    .line 100
    invoke-interface {v6, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    :cond_59
    return-object v6
.end method


# virtual methods
.method public final checkThreadAccess()Z
    .registers 2

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->checkThreadAccess()Z

    move-result v0

    return v0
.end method

.method protected final getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Descriptor;->mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    return-object v0
.end method

.method final initialize(Lcom/facebook/stetho/inspector/elements/Descriptor$Host;)V
    .registers 3
    .param p1, "host"    # Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    .prologue
    .line 27
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Descriptor;->mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    invoke-static {v0}, Lcom/facebook/stetho/common/Util;->throwIfNotNull(Ljava/lang/Object;)V

    .line 29
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Descriptor;->mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    .line 30
    return-void
.end method

.method final isInitialized()Z
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Descriptor;->mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public final postAndWait(Lcom/facebook/stetho/common/UncheckedCallable;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/stetho/common/UncheckedCallable",
            "<TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "c":Lcom/facebook/stetho/common/UncheckedCallable;, "Lcom/facebook/stetho/common/UncheckedCallable<TV;>;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->postAndWait(Lcom/facebook/stetho/common/UncheckedCallable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final postAndWait(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->postAndWait(Ljava/lang/Runnable;)V

    .line 58
    return-void
.end method

.method public final postDelayed(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "r"    # Ljava/lang/Runnable;
    .param p2, "delayMillis"    # J

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->postDelayed(Ljava/lang/Runnable;J)V

    .line 63
    return-void
.end method

.method public final removeCallbacks(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 68
    return-void
.end method

.method public final verifyThreadAccess()V
    .registers 2

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->verifyThreadAccess()V

    .line 48
    return-void
.end method
