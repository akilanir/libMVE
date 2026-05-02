.class public Lorg/apache/commons/lang3/concurrent/ConstantInitializer;
.super Ljava/lang/Object;
.source "ConstantInitializer.java"

# interfaces
.implements Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final FMT_TO_STRING:Ljava/lang/String; = "ConstantInitializer@%d [ object = %s ]"


# instance fields
.field private final object:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/ConstantInitializer;, "Lorg/apache/commons/lang3/concurrent/ConstantInitializer<TT;>;"
    .local p1, "obj":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;->object:Ljava/lang/Object;

    .line 59
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 107
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/ConstantInitializer;, "Lorg/apache/commons/lang3/concurrent/ConstantInitializer<TT;>;"
    if-ne p0, p1, :cond_4

    .line 108
    const/4 v1, 0x1

    .line 115
    :goto_3
    return v1

    .line 110
    :cond_4
    instance-of v1, p1, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;

    if-nez v1, :cond_a

    .line 111
    const/4 v1, 0x0

    goto :goto_3

    :cond_a
    move-object v0, p1

    .line 114
    check-cast v0, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;

    .line 115
    .local v0, "c":Lorg/apache/commons/lang3/concurrent/ConstantInitializer;, "Lorg/apache/commons/lang3/concurrent/ConstantInitializer<*>;"
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;->getObject()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;->getObject()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/commons/lang3/ObjectUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/lang3/concurrent/ConcurrentException;
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/ConstantInitializer;, "Lorg/apache/commons/lang3/concurrent/ConstantInitializer<TT;>;"
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;->getObject()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getObject()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/ConstantInitializer;, "Lorg/apache/commons/lang3/concurrent/ConstantInitializer<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;->object:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 92
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/ConstantInitializer;, "Lorg/apache/commons/lang3/concurrent/ConstantInitializer<TT;>;"
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;->getObject()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;->getObject()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 127
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/ConstantInitializer;, "Lorg/apache/commons/lang3/concurrent/ConstantInitializer<TT;>;"
    const-string v0, "ConstantInitializer@%d [ object = %s ]"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/ConstantInitializer;->getObject()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
