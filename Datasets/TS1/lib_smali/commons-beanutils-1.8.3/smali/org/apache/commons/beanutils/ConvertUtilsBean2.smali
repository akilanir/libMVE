.class public Lorg/apache/commons/beanutils/ConvertUtilsBean2;
.super Lorg/apache/commons/beanutils/ConvertUtilsBean;
.source "ConvertUtilsBean2.java"


# static fields
.field static class$java$lang$String:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 44
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
.method public convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 58
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean2;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public convert([Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p1, "value"    # [Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 72
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean2;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 44
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean2;->class$java$lang$String:Ljava/lang/Class;

    if-nez v0, :cond_13

    const-string v0, "java.lang.String"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean2;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean2;->class$java$lang$String:Ljava/lang/Class;

    :goto_c
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean2;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_13
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean2;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_c
.end method
