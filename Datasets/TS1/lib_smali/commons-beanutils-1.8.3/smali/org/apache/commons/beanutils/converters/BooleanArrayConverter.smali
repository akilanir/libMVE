.class public final Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;
.source "BooleanArrayConverter.java"


# static fields
.field private static final DEFAULT_CONVERTER:Lorg/apache/commons/beanutils/converters/BooleanConverter;

.field public static final MODEL:Ljava/lang/Class;

.field static class$java$lang$Boolean:Ljava/lang/Class;


# instance fields
.field protected final booleanConverter:Lorg/apache/commons/beanutils/converters/BooleanConverter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 112
    const/4 v0, 0x0

    new-array v0, v0, [Z

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->MODEL:Ljava/lang/Class;

    .line 119
    new-instance v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/BooleanConverter;-><init>()V

    sput-object v0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->DEFAULT_CONVERTER:Lorg/apache/commons/beanutils/converters/BooleanConverter;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;-><init>()V

    .line 59
    sget-object v0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->DEFAULT_CONVERTER:Lorg/apache/commons/beanutils/converters/BooleanConverter;

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->booleanConverter:Lorg/apache/commons/beanutils/converters/BooleanConverter;

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;-><init>(Ljava/lang/Object;)V

    .line 76
    sget-object v0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->DEFAULT_CONVERTER:Lorg/apache/commons/beanutils/converters/BooleanConverter;

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->booleanConverter:Lorg/apache/commons/beanutils/converters/BooleanConverter;

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/beanutils/converters/BooleanConverter;Ljava/lang/Object;)V
    .registers 3
    .param p1, "converter"    # Lorg/apache/commons/beanutils/converters/BooleanConverter;
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 100
    invoke-direct {p0, p2}, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;-><init>(Ljava/lang/Object;)V

    .line 101
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->booleanConverter:Lorg/apache/commons/beanutils/converters/BooleanConverter;

    .line 103
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 208
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
.method public convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 185
    if-nez p2, :cond_11

    .line 186
    iget-boolean v8, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->useDefault:Z

    if-eqz v8, :cond_9

    .line 187
    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 236
    :cond_8
    :goto_8
    return-object v5

    .line 189
    :cond_9
    new-instance v8, Lorg/apache/commons/beanutils/ConversionException;

    const-string v9, "No value specified"

    invoke-direct {v8, v9}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 194
    :cond_11
    sget-object v8, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->MODEL:Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    if-ne v8, v9, :cond_1b

    move-object v5, p2

    .line 195
    goto :goto_8

    .line 202
    :cond_1b
    sget-object v8, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->strings:[Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    if-ne v8, v9, :cond_6a

    .line 204
    :try_start_27
    move-object v0, p2

    check-cast v0, [Ljava/lang/String;

    move-object v8, v0

    move-object v0, v8

    check-cast v0, [Ljava/lang/String;

    move-object v7, v0

    .line 205
    .local v7, "values":[Ljava/lang/String;
    array-length v8, v7

    new-array v5, v8, [Z

    .line 206
    .local v5, "results":[Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_33
    array-length v8, v7

    if-ge v2, v8, :cond_8

    .line 207
    aget-object v6, v7, v2

    .line 208
    .local v6, "stringValue":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->booleanConverter:Lorg/apache/commons/beanutils/converters/BooleanConverter;

    sget-object v8, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v8, :cond_55

    const-string v8, "java.lang.Boolean"

    invoke-static {v8}, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    sput-object v8, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_46
    invoke-virtual {v9, v8, v6}, Lorg/apache/commons/beanutils/converters/BooleanConverter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 209
    .local v4, "result":Ljava/lang/Object;
    check-cast v4, Ljava/lang/Boolean;

    .end local v4    # "result":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    aput-boolean v8, v5, v2

    .line 206
    add-int/lit8 v2, v2, 0x1

    goto :goto_33

    .line 208
    :cond_55
    sget-object v8, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->class$java$lang$Boolean:Ljava/lang/Class;
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_57} :catch_58

    goto :goto_46

    .line 212
    .end local v2    # "i":I
    .end local v5    # "results":[Z
    .end local v6    # "stringValue":Ljava/lang/String;
    .end local v7    # "values":[Ljava/lang/String;
    :catch_58
    move-exception v1

    .line 213
    .local v1, "e":Ljava/lang/Exception;
    iget-boolean v8, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->useDefault:Z

    if-eqz v8, :cond_60

    .line 214
    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->defaultValue:Ljava/lang/Object;

    goto :goto_8

    .line 216
    :cond_60
    new-instance v8, Lorg/apache/commons/beanutils/ConversionException;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v1}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 226
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_6a
    :try_start_6a
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->parseElements(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 227
    .local v3, "list":Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v8

    new-array v5, v8, [Z

    .line 228
    .restart local v5    # "results":[Z
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_79
    array-length v8, v5

    if-ge v2, v8, :cond_8

    .line 229
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 230
    .restart local v6    # "stringValue":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->booleanConverter:Lorg/apache/commons/beanutils/converters/BooleanConverter;

    sget-object v8, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v8, :cond_9f

    const-string v8, "java.lang.Boolean"

    invoke-static {v8}, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    sput-object v8, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_90
    invoke-virtual {v9, v8, v6}, Lorg/apache/commons/beanutils/converters/BooleanConverter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 231
    .restart local v4    # "result":Ljava/lang/Object;
    check-cast v4, Ljava/lang/Boolean;

    .end local v4    # "result":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    aput-boolean v8, v5, v2

    .line 228
    add-int/lit8 v2, v2, 0x1

    goto :goto_79

    .line 230
    :cond_9f
    sget-object v8, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->class$java$lang$Boolean:Ljava/lang/Class;
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_a1} :catch_a2

    goto :goto_90

    .line 234
    .end local v2    # "i":I
    .end local v3    # "list":Ljava/util/List;
    .end local v5    # "results":[Z
    .end local v6    # "stringValue":Ljava/lang/String;
    :catch_a2
    move-exception v1

    .line 235
    .restart local v1    # "e":Ljava/lang/Exception;
    iget-boolean v8, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->useDefault:Z

    if-eqz v8, :cond_ab

    .line 236
    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/BooleanArrayConverter;->defaultValue:Ljava/lang/Object;

    goto/16 :goto_8

    .line 238
    :cond_ab
    new-instance v8, Lorg/apache/commons/beanutils/ConversionException;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v1}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
.end method
