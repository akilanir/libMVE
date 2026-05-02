.class public final Lorg/apache/commons/beanutils/converters/StringArrayConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;
.source "StringArrayConverter.java"


# static fields
.field private static final INT_MODEL:[I

.field private static final MODEL:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 79
    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->MODEL:[Ljava/lang/String;

    .line 84
    new-array v0, v1, [I

    sput-object v0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->INT_MODEL:[I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->useDefault:Z

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;-><init>()V

    .line 67
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->useDefault:Z

    .line 70
    return-void
.end method


# virtual methods
.method public convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 126
    if-nez p2, :cond_11

    .line 127
    iget-boolean v5, p0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->useDefault:Z

    if-eqz v5, :cond_9

    .line 128
    iget-object v3, p0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 163
    .end local p2    # "value":Ljava/lang/Object;
    :cond_8
    :goto_8
    return-object v3

    .line 130
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_9
    new-instance v5, Lorg/apache/commons/beanutils/ConversionException;

    const-string v6, "No value specified"

    invoke-direct {v5, v6}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 135
    :cond_11
    sget-object v5, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->MODEL:[Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    if-ne v5, v6, :cond_1f

    move-object v3, p2

    .line 136
    goto :goto_8

    .line 140
    :cond_1f
    sget-object v5, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->INT_MODEL:[I

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    if-ne v5, v6, :cond_42

    .line 142
    check-cast p2, [I

    .end local p2    # "value":Ljava/lang/Object;
    move-object v4, p2

    check-cast v4, [I

    .line 143
    .local v4, "values":[I
    array-length v5, v4

    new-array v3, v5, [Ljava/lang/String;

    .line 144
    .local v3, "results":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_34
    array-length v5, v4

    if-ge v1, v5, :cond_8

    .line 146
    aget v5, v4, v1

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v1

    .line 144
    add-int/lit8 v1, v1, 0x1

    goto :goto_34

    .line 155
    .end local v1    # "i":I
    .end local v3    # "results":[Ljava/lang/String;
    .end local v4    # "values":[I
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_42
    :try_start_42
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->parseElements(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 156
    .local v2, "list":Ljava/util/List;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    new-array v3, v5, [Ljava/lang/String;

    .line 157
    .restart local v3    # "results":[Ljava/lang/String;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_51
    array-length v5, v3

    if-ge v1, v5, :cond_8

    .line 158
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v3, v1
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_5c} :catch_5f

    .line 157
    add-int/lit8 v1, v1, 0x1

    goto :goto_51

    .line 161
    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;
    .end local v3    # "results":[Ljava/lang/String;
    :catch_5f
    move-exception v0

    .line 162
    .local v0, "e":Ljava/lang/Exception;
    iget-boolean v5, p0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->useDefault:Z

    if-eqz v5, :cond_67

    .line 163
    iget-object v3, p0, Lorg/apache/commons/beanutils/converters/StringArrayConverter;->defaultValue:Ljava/lang/Object;

    goto :goto_8

    .line 165
    :cond_67
    new-instance v5, Lorg/apache/commons/beanutils/ConversionException;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method
