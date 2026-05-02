.class public abstract Lcom/google/common/reflect/AbstractInvocationHandler;
.super Ljava/lang/Object;
.source "AbstractInvocationHandler.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation


# static fields
.field private static final NO_ARGS:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lcom/google/common/reflect/AbstractInvocationHandler;->NO_ARGS:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 102
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected abstract handleInvocation(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 110
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 64
    if-nez p3, :cond_6

    .line 65
    sget-object p3, Lcom/google/common/reflect/AbstractInvocationHandler;->NO_ARGS:[Ljava/lang/Object;

    .line 67
    :cond_6
    array-length v3, p3

    if-nez v3, :cond_1e

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "hashCode"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 68
    invoke-virtual {p0}, Lcom/google/common/reflect/AbstractInvocationHandler;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 79
    :goto_1d
    return-object v1

    .line 70
    :cond_1e
    array-length v3, p3

    if-ne v3, v1, :cond_54

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "equals"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_54

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    aget-object v3, v3, v2

    const-class v4, Ljava/lang/Object;

    if-ne v3, v4, :cond_54

    .line 73
    aget-object v0, p3, v2

    .line 74
    .local v0, "arg":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_52

    invoke-static {v0}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/common/reflect/AbstractInvocationHandler;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_52

    :goto_4d
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_1d

    :cond_52
    move v1, v2

    goto :goto_4d

    .line 76
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_54
    array-length v1, p3

    if-nez v1, :cond_68

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "toString"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_68

    .line 77
    invoke-virtual {p0}, Lcom/google/common/reflect/AbstractInvocationHandler;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1d

    .line 79
    :cond_68
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/reflect/AbstractInvocationHandler;->handleInvocation(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1d
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 119
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
