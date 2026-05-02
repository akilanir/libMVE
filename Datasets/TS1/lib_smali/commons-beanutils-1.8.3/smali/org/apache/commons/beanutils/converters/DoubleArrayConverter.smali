.class public final Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;
.source "DoubleArrayConverter.java"


# static fields
.field private static final MODEL:[D


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 76
    const/4 v0, 0x0

    new-array v0, v0, [D

    sput-object v0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->MODEL:[D

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->useDefault:Z

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
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->useDefault:Z

    .line 67
    return-void
.end method


# virtual methods
.method public convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 95
    if-nez p2, :cond_11

    .line 96
    iget-boolean v6, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->useDefault:Z

    if-eqz v6, :cond_9

    .line 97
    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 137
    :cond_8
    :goto_8
    return-object v4

    .line 99
    :cond_9
    new-instance v6, Lorg/apache/commons/beanutils/ConversionException;

    const-string v7, "No value specified"

    invoke-direct {v6, v7}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 104
    :cond_11
    sget-object v6, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->MODEL:[D

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    if-ne v6, v7, :cond_1f

    move-object v4, p2

    .line 105
    goto :goto_8

    .line 109
    :cond_1f
    sget-object v6, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->strings:[Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    if-ne v6, v7, :cond_57

    .line 111
    :try_start_2b
    move-object v0, p2

    check-cast v0, [Ljava/lang/String;

    move-object v6, v0

    move-object v0, v6

    check-cast v0, [Ljava/lang/String;

    move-object v5, v0

    .line 112
    .local v5, "values":[Ljava/lang/String;
    array-length v6, v5

    new-array v4, v6, [D

    .line 113
    .local v4, "results":[D
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_37
    array-length v6, v5

    if-ge v2, v6, :cond_8

    .line 114
    aget-object v6, v5, v2

    invoke-static {v6}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    aput-wide v6, v4, v2
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_42} :catch_45

    .line 113
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    .line 117
    .end local v2    # "i":I
    .end local v4    # "results":[D
    .end local v5    # "values":[Ljava/lang/String;
    :catch_45
    move-exception v1

    .line 118
    .local v1, "e":Ljava/lang/Exception;
    iget-boolean v6, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->useDefault:Z

    if-eqz v6, :cond_4d

    .line 119
    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->defaultValue:Ljava/lang/Object;

    goto :goto_8

    .line 121
    :cond_4d
    new-instance v6, Lorg/apache/commons/beanutils/ConversionException;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 129
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_57
    :try_start_57
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->parseElements(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 130
    .local v3, "list":Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    new-array v4, v6, [D

    .line 131
    .restart local v4    # "results":[D
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_66
    array-length v6, v4

    if-ge v2, v6, :cond_8

    .line 132
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    aput-wide v6, v4, v2
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_75} :catch_78

    .line 131
    add-int/lit8 v2, v2, 0x1

    goto :goto_66

    .line 135
    .end local v2    # "i":I
    .end local v3    # "list":Ljava/util/List;
    .end local v4    # "results":[D
    :catch_78
    move-exception v1

    .line 136
    .restart local v1    # "e":Ljava/lang/Exception;
    iget-boolean v6, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->useDefault:Z

    if-eqz v6, :cond_80

    .line 137
    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/DoubleArrayConverter;->defaultValue:Ljava/lang/Object;

    goto :goto_8

    .line 139
    :cond_80
    new-instance v6, Lorg/apache/commons/beanutils/ConversionException;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
.end method
