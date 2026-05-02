.class public abstract Lorg/springframework/beans/BeansException;
.super Lorg/springframework/core/NestedRuntimeException;
.source "BeansException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lorg/springframework/core/NestedRuntimeException;-><init>(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Lorg/springframework/core/NestedRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 54
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 59
    if-ne p0, p1, :cond_5

    .line 66
    :cond_4
    :goto_4
    return v1

    .line 62
    :cond_5
    instance-of v3, p1, Lorg/springframework/beans/BeansException;

    if-nez v3, :cond_b

    move v1, v2

    .line 63
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 65
    check-cast v0, Lorg/springframework/beans/BeansException;

    .line 66
    .local v0, "otherBe":Lorg/springframework/beans/BeansException;
    invoke-virtual {p0}, Lorg/springframework/beans/BeansException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/springframework/beans/BeansException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-virtual {p0}, Lorg/springframework/beans/BeansException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v0}, Lorg/springframework/beans/BeansException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/springframework/util/ObjectUtils;->nullSafeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_2a
    move v1, v2

    goto :goto_4
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/springframework/beans/BeansException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
