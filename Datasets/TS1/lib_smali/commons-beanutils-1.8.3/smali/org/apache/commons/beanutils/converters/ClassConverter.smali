.class public final Lorg/apache/commons/beanutils/converters/ClassConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractConverter;
.source "ClassConverter.java"


# static fields
.field static class$java$lang$Class:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$converters$ClassConverter:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>(Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 63
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method protected convertToString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 74
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_b

    check-cast p1, Ljava/lang/Class;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    .restart local p1    # "value":Ljava/lang/Object;
    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method protected convertToType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 87
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 89
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_14

    .line 91
    :try_start_a
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_11
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a .. :try_end_11} :catch_13

    move-result-object v1

    .line 100
    :goto_12
    return-object v1

    .line 92
    :catch_13
    move-exception v1

    .line 99
    :cond_14
    sget-object v1, Lorg/apache/commons/beanutils/converters/ClassConverter;->class$org$apache$commons$beanutils$converters$ClassConverter:Ljava/lang/Class;

    if-nez v1, :cond_2d

    const-string v1, "org.apache.commons.beanutils.converters.ClassConverter"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/ClassConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/ClassConverter;->class$org$apache$commons$beanutils$converters$ClassConverter:Ljava/lang/Class;

    :goto_20
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 100
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_12

    .line 99
    :cond_2d
    sget-object v1, Lorg/apache/commons/beanutils/converters/ClassConverter;->class$org$apache$commons$beanutils$converters$ClassConverter:Ljava/lang/Class;

    goto :goto_20
.end method

.method protected getDefaultType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 63
    sget-object v0, Lorg/apache/commons/beanutils/converters/ClassConverter;->class$java$lang$Class:Ljava/lang/Class;

    if-nez v0, :cond_d

    const-string v0, "java.lang.Class"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/ClassConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/ClassConverter;->class$java$lang$Class:Ljava/lang/Class;

    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Lorg/apache/commons/beanutils/converters/ClassConverter;->class$java$lang$Class:Ljava/lang/Class;

    goto :goto_c
.end method
