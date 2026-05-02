.class public final Lorg/apache/commons/beanutils/converters/ByteConverter;
.super Lorg/apache/commons/beanutils/converters/NumberConverter;
.source "ByteConverter.java"


# static fields
.field static class$java$lang$Byte:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/converters/NumberConverter;-><init>(Z)V

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;-><init>(ZLjava/lang/Object;)V

    .line 55
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 64
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
.method protected getDefaultType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 64
    sget-object v0, Lorg/apache/commons/beanutils/converters/ByteConverter;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v0, :cond_d

    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/ByteConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/ByteConverter;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Lorg/apache/commons/beanutils/converters/ByteConverter;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_c
.end method
