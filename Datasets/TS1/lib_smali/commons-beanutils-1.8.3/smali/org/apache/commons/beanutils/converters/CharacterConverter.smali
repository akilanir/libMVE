.class public final Lorg/apache/commons/beanutils/converters/CharacterConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractConverter;
.source "CharacterConverter.java"


# static fields
.field static class$java$lang$Character:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>(Ljava/lang/Object;)V

    .line 50
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 59
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
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 70
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "strValue":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_d

    const-string v1, ""

    :goto_c
    return-object v1

    :cond_d
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method protected convertToType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 84
    new-instance v0, Ljava/lang/Character;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Character;-><init>(C)V

    return-object v0
.end method

.method protected getDefaultType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 59
    sget-object v0, Lorg/apache/commons/beanutils/converters/CharacterConverter;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v0, :cond_d

    const-string v0, "java.lang.Character"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/CharacterConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/CharacterConverter;->class$java$lang$Character:Ljava/lang/Class;

    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Lorg/apache/commons/beanutils/converters/CharacterConverter;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_c
.end method
