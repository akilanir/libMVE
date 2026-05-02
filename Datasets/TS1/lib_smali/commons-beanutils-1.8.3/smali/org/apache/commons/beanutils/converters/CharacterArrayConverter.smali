.class public final Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;
.source "CharacterArrayConverter.java"


# static fields
.field private static final MODEL:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 76
    const/4 v0, 0x0

    new-array v0, v0, [C

    sput-object v0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->MODEL:[C

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->useDefault:Z

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;-><init>()V

    .line 64
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->useDefault:Z

    .line 67
    return-void
.end method


# virtual methods
.method public convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 96
    if-nez p2, :cond_11

    .line 97
    iget-boolean v6, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->useDefault:Z

    if-eqz v6, :cond_9

    .line 98
    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 138
    :cond_8
    :goto_8
    return-object v4

    .line 100
    :cond_9
    new-instance v6, Lorg/apache/commons/beanutils/ConversionException;

    const-string v7, "No value specified"

    invoke-direct {v6, v7}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 105
    :cond_11
    sget-object v6, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->MODEL:[C

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    if-ne v6, v7, :cond_1f

    move-object v4, p2

    .line 106
    goto :goto_8

    .line 110
    :cond_1f
    sget-object v6, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->strings:[Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    if-ne v6, v7, :cond_58

    .line 112
    :try_start_2b
    move-object v0, p2

    check-cast v0, [Ljava/lang/String;

    move-object v6, v0

    move-object v0, v6

    check-cast v0, [Ljava/lang/String;

    move-object v5, v0

    .line 113
    .local v5, "values":[Ljava/lang/String;
    array-length v6, v5

    new-array v4, v6, [C

    .line 114
    .local v4, "results":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_37
    array-length v6, v5

    if-ge v2, v6, :cond_8

    .line 115
    aget-object v6, v5, v2

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    aput-char v6, v4, v2
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_43} :catch_46

    .line 114
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    .line 118
    .end local v2    # "i":I
    .end local v4    # "results":[C
    .end local v5    # "values":[Ljava/lang/String;
    :catch_46
    move-exception v1

    .line 119
    .local v1, "e":Ljava/lang/Exception;
    iget-boolean v6, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->useDefault:Z

    if-eqz v6, :cond_4e

    .line 120
    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->defaultValue:Ljava/lang/Object;

    goto :goto_8

    .line 122
    :cond_4e
    new-instance v6, Lorg/apache/commons/beanutils/ConversionException;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 130
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_58
    :try_start_58
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->parseElements(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 131
    .local v3, "list":Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    new-array v4, v6, [C

    .line 132
    .restart local v4    # "results":[C
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_67
    array-length v6, v4

    if-ge v2, v6, :cond_8

    .line 133
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    aput-char v6, v4, v2
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_77} :catch_7a

    .line 132
    add-int/lit8 v2, v2, 0x1

    goto :goto_67

    .line 136
    .end local v2    # "i":I
    .end local v3    # "list":Ljava/util/List;
    .end local v4    # "results":[C
    :catch_7a
    move-exception v1

    .line 137
    .restart local v1    # "e":Ljava/lang/Exception;
    iget-boolean v6, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->useDefault:Z

    if-eqz v6, :cond_82

    .line 138
    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/CharacterArrayConverter;->defaultValue:Ljava/lang/Object;

    goto :goto_8

    .line 140
    :cond_82
    new-instance v6, Lorg/apache/commons/beanutils/ConversionException;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
.end method
