.class public Lzmq/ValueReference;
.super Ljava/lang/Object;
.source "ValueReference.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    .local p0, "this":Lzmq/ValueReference;, "Lzmq/ValueReference<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lzmq/ValueReference;, "Lzmq/ValueReference<TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lzmq/ValueReference;->value:Ljava/lang/Object;

    .line 29
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lzmq/ValueReference;, "Lzmq/ValueReference<TV;>;"
    iget-object v0, p0, Lzmq/ValueReference;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public final set(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lzmq/ValueReference;, "Lzmq/ValueReference<TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    iput-object p1, p0, Lzmq/ValueReference;->value:Ljava/lang/Object;

    .line 43
    return-void
.end method
