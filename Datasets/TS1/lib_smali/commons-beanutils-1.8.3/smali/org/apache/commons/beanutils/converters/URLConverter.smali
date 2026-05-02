.class public final Lorg/apache/commons/beanutils/converters/URLConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractConverter;
.source "URLConverter.java"


# static fields
.field static class$java$net$URL:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>(Ljava/lang/Object;)V

    .line 51
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 60
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
    .line 73
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method protected getDefaultType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 60
    sget-object v0, Lorg/apache/commons/beanutils/converters/URLConverter;->class$java$net$URL:Ljava/lang/Class;

    if-nez v0, :cond_d

    const-string v0, "java.net.URL"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/URLConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/URLConverter;->class$java$net$URL:Ljava/lang/Class;

    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Lorg/apache/commons/beanutils/converters/URLConverter;->class$java$net$URL:Ljava/lang/Class;

    goto :goto_c
.end method
