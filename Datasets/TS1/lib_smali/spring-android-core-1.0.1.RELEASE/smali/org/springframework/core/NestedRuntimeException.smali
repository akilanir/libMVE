.class public abstract Lorg/springframework/core/NestedRuntimeException;
.super Ljava/lang/RuntimeException;
.source "NestedRuntimeException.java"


# static fields
.field private static final serialVersionUID:J = 0x4b7e7648cb8f9f00L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const-class v0, Lorg/springframework/core/NestedExceptionUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Class;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "exType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 113
    if-nez p1, :cond_5

    .line 136
    :cond_4
    :goto_4
    return v1

    .line 116
    :cond_5
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    move v1, v2

    .line 117
    goto :goto_4

    .line 119
    :cond_d
    invoke-virtual {p0}, Lorg/springframework/core/NestedRuntimeException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 120
    .local v0, "cause":Ljava/lang/Throwable;
    if-eq v0, p0, :cond_4

    .line 123
    instance-of v3, v0, Lorg/springframework/core/NestedRuntimeException;

    if-eqz v3, :cond_22

    .line 124
    check-cast v0, Lorg/springframework/core/NestedRuntimeException;

    .end local v0    # "cause":Ljava/lang/Throwable;
    invoke-virtual {v0, p1}, Lorg/springframework/core/NestedRuntimeException;->contains(Ljava/lang/Class;)Z

    move-result v1

    goto :goto_4

    .line 134
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_1e
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 127
    :cond_22
    if-eqz v0, :cond_4

    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    move v1, v2

    .line 129
    goto :goto_4

    .line 131
    :cond_2c
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-ne v3, v0, :cond_1e

    goto :goto_4
.end method

.method public getMessage()Ljava/lang/String;
    .registers 3

    .prologue
    .line 75
    invoke-super {p0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/springframework/core/NestedRuntimeException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/springframework/core/NestedExceptionUtils;->buildMessage(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMostSpecificCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 101
    invoke-virtual {p0}, Lorg/springframework/core/NestedRuntimeException;->getRootCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 102
    .local v0, "rootCause":Ljava/lang/Throwable;
    if-eqz v0, :cond_7

    .end local v0    # "rootCause":Ljava/lang/Throwable;
    :goto_6
    return-object v0

    .restart local v0    # "rootCause":Ljava/lang/Throwable;
    :cond_7
    move-object v0, p0

    goto :goto_6
.end method

.method public getRootCause()Ljava/lang/Throwable;
    .registers 3

    .prologue
    .line 84
    const/4 v1, 0x0

    .line 85
    .local v1, "rootCause":Ljava/lang/Throwable;
    invoke-virtual {p0}, Lorg/springframework/core/NestedRuntimeException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 86
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_5
    if-eqz v0, :cond_f

    if-eq v0, v1, :cond_f

    .line 87
    move-object v1, v0

    .line 88
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_5

    .line 90
    :cond_f
    return-object v1
.end method
