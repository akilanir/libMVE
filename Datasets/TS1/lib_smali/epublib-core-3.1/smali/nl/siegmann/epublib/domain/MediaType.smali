.class public Lnl/siegmann/epublib/domain/MediaType;
.super Ljava/lang/Object;
.source "MediaType.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x64b2d075bbc84964L


# instance fields
.field private defaultExtension:Ljava/lang/String;

.field private extensions:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultExtension"    # Ljava/lang/String;

    .prologue
    .line 29
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-direct {p0, p1, p2, v0}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Collection;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultExtension"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p3, "extensions":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lnl/siegmann/epublib/domain/MediaType;->name:Ljava/lang/String;

    .line 47
    iput-object p2, p0, Lnl/siegmann/epublib/domain/MediaType;->defaultExtension:Ljava/lang/String;

    .line 48
    iput-object p3, p0, Lnl/siegmann/epublib/domain/MediaType;->extensions:Ljava/util/Collection;

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultExtension"    # Ljava/lang/String;
    .param p3, "extensions"    # [Ljava/lang/String;

    .prologue
    .line 34
    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Collection;)V

    .line 35
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "otherMediaType"    # Ljava/lang/Object;

    .prologue
    .line 67
    instance-of v0, p1, Lnl/siegmann/epublib/domain/MediaType;

    if-nez v0, :cond_6

    .line 68
    const/4 v0, 0x0

    .line 70
    .end local p1    # "otherMediaType":Ljava/lang/Object;
    :goto_5
    return v0

    .restart local p1    # "otherMediaType":Ljava/lang/Object;
    :cond_6
    iget-object v0, p0, Lnl/siegmann/epublib/domain/MediaType;->name:Ljava/lang/String;

    check-cast p1, Lnl/siegmann/epublib/domain/MediaType;

    .end local p1    # "otherMediaType":Ljava/lang/Object;
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/MediaType;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public getDefaultExtension()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lnl/siegmann/epublib/domain/MediaType;->defaultExtension:Ljava/lang/String;

    return-object v0
.end method

.method public getExtensions()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lnl/siegmann/epublib/domain/MediaType;->extensions:Ljava/util/Collection;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lnl/siegmann/epublib/domain/MediaType;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Lnl/siegmann/epublib/domain/MediaType;->name:Ljava/lang/String;

    if-nez v0, :cond_6

    .line 39
    const/4 v0, 0x0

    .line 41
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lnl/siegmann/epublib/domain/MediaType;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lnl/siegmann/epublib/domain/MediaType;->name:Ljava/lang/String;

    return-object v0
.end method
