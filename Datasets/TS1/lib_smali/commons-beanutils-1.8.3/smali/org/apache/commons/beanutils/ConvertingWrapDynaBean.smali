.class public Lorg/apache/commons/beanutils/ConvertingWrapDynaBean;
.super Lorg/apache/commons/beanutils/WrapDynaBean;
.source "ConvertingWrapDynaBean.java"


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "instance"    # Ljava/lang/Object;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/WrapDynaBean;-><init>(Ljava/lang/Object;)V

    .line 50
    return-void
.end method


# virtual methods
.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 67
    :try_start_0
    iget-object v4, p0, Lorg/apache/commons/beanutils/ConvertingWrapDynaBean;->instance:Ljava/lang/Object;

    invoke-static {v4, p1, p2}, Lorg/apache/commons/beanutils/BeanUtils;->copyProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_5} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_5} :catch_2e

    .line 81
    return-void

    .line 68
    :catch_6
    move-exception v2

    .line 69
    .local v2, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 70
    .local v0, "cause":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Error setting property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' nested exception - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 73
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v2    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :catch_2e
    move-exception v3

    .line 74
    .local v3, "t":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Error setting property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\', exception - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 77
    .local v1, "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {v1, v3}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    .line 78
    throw v1
.end method
