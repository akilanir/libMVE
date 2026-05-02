.class public abstract Lorg/junit/runners/model/FrameworkMember;
.super Ljava/lang/Object;
.source "FrameworkMember.java"

# interfaces
.implements Lorg/junit/runners/model/Annotatable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/junit/runners/model/FrameworkMember",
        "<TT;>;>",
        "Ljava/lang/Object;",
        "Lorg/junit/runners/model/Annotatable;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    .local p0, "this":Lorg/junit/runners/model/FrameworkMember;, "Lorg/junit/runners/model/FrameworkMember<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getDeclaringClass()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end method

.method protected abstract getModifiers()I
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getType()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end method

.method public isPublic()Z
    .registers 2

    .prologue
    .line 37
    .local p0, "this":Lorg/junit/runners/model/FrameworkMember;, "Lorg/junit/runners/model/FrameworkMember<TT;>;"
    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkMember;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    return v0
.end method

.method isShadowedBy(Ljava/util/List;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 16
    .local p0, "this":Lorg/junit/runners/model/FrameworkMember;, "Lorg/junit/runners/model/FrameworkMember<TT;>;"
    .local p1, "members":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runners/model/FrameworkMember;

    .line 17
    .local v0, "each":Lorg/junit/runners/model/FrameworkMember;, "TT;"
    invoke-virtual {p0, v0}, Lorg/junit/runners/model/FrameworkMember;->isShadowedBy(Lorg/junit/runners/model/FrameworkMember;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 18
    const/4 v2, 0x1

    .line 21
    .end local v0    # "each":Lorg/junit/runners/model/FrameworkMember;, "TT;"
    :goto_17
    return v2

    :cond_18
    const/4 v2, 0x0

    goto :goto_17
.end method

.method abstract isShadowedBy(Lorg/junit/runners/model/FrameworkMember;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method

.method public isStatic()Z
    .registers 2

    .prologue
    .line 30
    .local p0, "this":Lorg/junit/runners/model/FrameworkMember;, "Lorg/junit/runners/model/FrameworkMember<TT;>;"
    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkMember;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    return v0
.end method
