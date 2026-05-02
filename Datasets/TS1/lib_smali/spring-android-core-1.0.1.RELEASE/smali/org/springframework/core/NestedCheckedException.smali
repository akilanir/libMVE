.class public abstract Lorg/springframework/core/NestedCheckedException;
.super Ljava/lang/Exception;
.source "NestedCheckedException.java"


# static fields
.field private static final serialVersionUID:J = 0x628ace4e2e0a523aL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    const-class v0, Lorg/springframework/core/NestedExceptionUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 67
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

    .line 114
    if-nez p1, :cond_5

    .line 137
    :cond_4
    :goto_4
    return v1

    .line 117
    :cond_5
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    move v1, v2

    .line 118
    goto :goto_4

    .line 120
    :cond_d
    invoke-virtual {p0}, Lorg/springframework/core/NestedCheckedException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 121
    .local v0, "cause":Ljava/lang/Throwable;
    if-eq v0, p0, :cond_4

    .line 124
    instance-of v3, v0, Lorg/springframework/core/NestedCheckedException;

    if-eqz v3, :cond_22

    .line 125
    check-cast v0, Lorg/springframework/core/NestedCheckedException;

    .end local v0    # "cause":Ljava/lang/Throwable;
    invoke-virtual {v0, p1}, Lorg/springframework/core/NestedCheckedException;->contains(Ljava/lang/Class;)Z

    move-result v1

    goto :goto_4

    .line 135
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_1e
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 128
    :cond_22
    if-eqz v0, :cond_4

    .line 129
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    move v1, v2

    .line 130
    goto :goto_4

    .line 132
    :cond_2c
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-ne v3, v0, :cond_1e

    goto :goto_4
.end method

.method public getMessage()Ljava/lang/String;
    .registers 3

    .prologue
    .line 76
    invoke-super {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/springframework/core/NestedCheckedException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/springframework/core/NestedExceptionUtils;->buildMessage(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMostSpecificCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 102
    invoke-virtual {p0}, Lorg/springframework/core/NestedCheckedException;->getRootCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 103
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
    .line 85
    const/4 v1, 0x0

    .line 86
    .local v1, "rootCause":Ljava/lang/Throwable;
    invoke-virtual {p0}, Lorg/springframework/core/NestedCheckedException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 87
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_5
    if-eqz v0, :cond_f

    if-eq v0, v1, :cond_f

    .line 88
    move-object v1, v0

    .line 89
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_5

    .line 91
    :cond_f
    return-object v1
.end method
