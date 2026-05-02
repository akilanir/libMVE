.class public final Lorg/acra/collections/ImmutableSet$Builder;
.super Ljava/lang/Object;
.source "ImmutableSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/acra/collections/ImmutableSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 117
    .local p0, "this":Lorg/acra/collections/ImmutableSet$Builder;, "Lorg/acra/collections/ImmutableSet$Builder<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/acra/collections/ImmutableSet$Builder;->mSet:Ljava/util/Set;

    .line 119
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lorg/acra/collections/ImmutableSet$Builder;, "Lorg/acra/collections/ImmutableSet$Builder<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableSet$Builder;->mSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 123
    return-void
.end method

.method public build()Lorg/acra/collections/ImmutableSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/acra/collections/ImmutableSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "this":Lorg/acra/collections/ImmutableSet$Builder;, "Lorg/acra/collections/ImmutableSet$Builder<TE;>;"
    new-instance v0, Lorg/acra/collections/ImmutableSet;

    iget-object v1, p0, Lorg/acra/collections/ImmutableSet$Builder;->mSet:Ljava/util/Set;

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
