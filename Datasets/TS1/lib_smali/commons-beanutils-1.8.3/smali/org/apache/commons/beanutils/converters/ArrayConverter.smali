.class public Lorg/apache/commons/beanutils/converters/ArrayConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractConverter;
.source "ArrayConverter.java"


# static fields
.field static class$java$lang$String:Ljava/lang/Class;


# instance fields
.field private allowedChars:[C

.field private defaultSize:I

.field private defaultTypeInstance:Ljava/lang/Object;

.field private delimiter:C

.field private elementConverter:Lorg/apache/commons/beanutils/Converter;

.field private onlyFirstToString:Z


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V
    .registers 5
    .param p1, "defaultType"    # Ljava/lang/Class;
    .param p2, "elementConverter"    # Lorg/apache/commons/beanutils/Converter;

    .prologue
    .line 149
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 132
    const/16 v0, 0x2c

    iput-char v0, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->delimiter:C

    .line 133
    const/4 v0, 0x2

    new-array v0, v0, [C

    fill-array-data v0, :array_42

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->allowedChars:[C

    .line 134
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->onlyFirstToString:Z

    .line 150
    if-nez p1, :cond_1c

    .line 151
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Default type is missing"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_1c
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-nez v0, :cond_2a

    .line 154
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Default type must be an array."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_2a
    if-nez p2, :cond_34

    .line 157
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Component Converter is missing."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_34
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->defaultTypeInstance:Ljava/lang/Object;

    .line 160
    iput-object p2, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->elementConverter:Lorg/apache/commons/beanutils/Converter;

    .line 161
    return-void

    .line 133
    :array_42
    .array-data 2
        0x2es
        0x2ds
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;I)V
    .registers 6
    .param p1, "defaultType"    # Ljava/lang/Class;
    .param p2, "elementConverter"    # Lorg/apache/commons/beanutils/Converter;
    .param p3, "defaultSize"    # I

    .prologue
    .line 176
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/beanutils/converters/ArrayConverter;-><init>(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 177
    iput p3, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->defaultSize:I

    .line 178
    const/4 v0, 0x0

    .line 179
    .local v0, "defaultValue":Ljava/lang/Object;
    if-ltz p3, :cond_10

    .line 180
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 182
    .end local v0    # "defaultValue":Ljava/lang/Object;
    :cond_10
    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->setDefaultValue(Ljava/lang/Object;)V

    .line 183
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 247
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

.method private parseElements(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/List;
    .registers 11
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 424
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_36

    .line 425
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Parsing elements, delimiter=["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-char v7, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->delimiter:C

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "], value=["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 429
    :cond_36
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 430
    const-string v5, "{"

    invoke-virtual {p2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_55

    const-string v5, "}"

    invoke-virtual {p2, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_55

    .line 431
    const/4 v5, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {p2, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 437
    :cond_55
    :try_start_55
    new-instance v3, Ljava/io/StreamTokenizer;

    new-instance v5, Ljava/io/StringReader;

    invoke-direct {v5, p2}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v5}, Ljava/io/StreamTokenizer;-><init>(Ljava/io/Reader;)V

    .line 438
    .local v3, "st":Ljava/io/StreamTokenizer;
    iget-char v5, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->delimiter:C

    iget-char v6, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->delimiter:C

    invoke-virtual {v3, v5, v6}, Ljava/io/StreamTokenizer;->whitespaceChars(II)V

    .line 439
    const/16 v5, 0x30

    const/16 v6, 0x39

    invoke-virtual {v3, v5, v6}, Ljava/io/StreamTokenizer;->ordinaryChars(II)V

    .line 440
    const/16 v5, 0x30

    const/16 v6, 0x39

    invoke-virtual {v3, v5, v6}, Ljava/io/StreamTokenizer;->wordChars(II)V

    .line 441
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_75
    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->allowedChars:[C

    array-length v5, v5

    if-ge v1, v5, :cond_93

    .line 442
    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->allowedChars:[C

    aget-char v5, v5, v1

    iget-object v6, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->allowedChars:[C

    aget-char v6, v6, v1

    invoke-virtual {v3, v5, v6}, Ljava/io/StreamTokenizer;->ordinaryChars(II)V

    .line 443
    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->allowedChars:[C

    aget-char v5, v5, v1

    iget-object v6, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->allowedChars:[C

    aget-char v6, v6, v1

    invoke-virtual {v3, v5, v6}, Ljava/io/StreamTokenizer;->wordChars(II)V

    .line 441
    add-int/lit8 v1, v1, 0x1

    goto :goto_75

    .line 447
    :cond_93
    const/4 v2, 0x0

    .line 449
    .local v2, "list":Ljava/util/List;
    :cond_94
    :goto_94
    invoke-virtual {v3}, Ljava/io/StreamTokenizer;->nextToken()I

    move-result v4

    .line 450
    .local v4, "ttype":I
    const/4 v5, -0x3

    if-eq v4, v5, :cond_9d

    if-lez v4, :cond_da

    .line 451
    :cond_9d
    iget-object v5, v3, Ljava/io/StreamTokenizer;->sval:Ljava/lang/String;

    if-eqz v5, :cond_94

    .line 452
    if-nez v2, :cond_a8

    .line 453
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "list":Ljava/util/List;
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 455
    .restart local v2    # "list":Ljava/util/List;
    :cond_a8
    iget-object v5, v3, Ljava/io/StreamTokenizer;->sval:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_ad
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_ad} :catch_ae

    goto :goto_94

    .line 475
    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;
    .end local v3    # "st":Ljava/io/StreamTokenizer;
    .end local v4    # "ttype":I
    :catch_ae
    move-exception v0

    .line 477
    .local v0, "e":Ljava/io/IOException;
    new-instance v5, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Error converting from String to \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\': "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 457
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "i":I
    .restart local v2    # "list":Ljava/util/List;
    .restart local v3    # "st":Ljava/io/StreamTokenizer;
    .restart local v4    # "ttype":I
    :cond_da
    const/4 v5, -0x1

    if-ne v4, v5, :cond_10a

    .line 465
    if-nez v2, :cond_e1

    .line 466
    :try_start_df
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 468
    :cond_e1
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_109

    .line 469
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " elements parsed"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 473
    :cond_109
    return-object v2

    .line 460
    :cond_10a
    new-instance v5, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Encountered token of type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " parsing elements to \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_137
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_137} :catch_ae
.end method


# virtual methods
.method protected convertArray(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 321
    return-object p1
.end method

.method protected convertToCollection(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/Collection;
    .registers 5
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 346
    instance-of v1, p2, Ljava/util/Collection;

    if-eqz v1, :cond_7

    .line 347
    check-cast p2, Ljava/util/Collection;

    .line 357
    .end local p2    # "value":Ljava/lang/Object;
    :goto_6
    return-object p2

    .line 349
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_7
    instance-of v1, p2, Ljava/lang/Number;

    if-nez v1, :cond_13

    instance-of v1, p2, Ljava/lang/Boolean;

    if-nez v1, :cond_13

    instance-of v1, p2, Ljava/util/Date;

    if-eqz v1, :cond_1e

    .line 352
    :cond_13
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 353
    .local v0, "list":Ljava/util/List;
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object p2, v0

    .line 354
    goto :goto_6

    .line 357
    .end local v0    # "list":Ljava/util/List;
    :cond_1e
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->parseElements(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/List;

    move-result-object p2

    goto :goto_6
.end method

.method protected convertToString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 11
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 235
    const/4 v5, 0x0

    .line 236
    .local v5, "size":I
    const/4 v4, 0x0

    .line 237
    .local v4, "iterator":Ljava/util/Iterator;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    .line 238
    .local v6, "type":Ljava/lang/Class;
    invoke-virtual {v6}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_25

    .line 239
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v5

    .line 246
    :goto_10
    if-nez v5, :cond_35

    .line 247
    sget-object v7, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$java$lang$String:Ljava/lang/Class;

    if-nez v7, :cond_32

    const-string v7, "java.lang.String"

    invoke-static {v7}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$java$lang$String:Ljava/lang/Class;

    :goto_1e
    invoke-virtual {p0, v7}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->getDefault(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 267
    :goto_24
    return-object v7

    .line 241
    :cond_25
    invoke-virtual {p0, v6, p1}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->convertToCollection(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v1

    .line 242
    .local v1, "collection":Ljava/util/Collection;
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v5

    .line 243
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    goto :goto_10

    .line 247
    .end local v1    # "collection":Ljava/util/Collection;
    :cond_32
    sget-object v7, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1e

    .line 250
    :cond_35
    iget-boolean v7, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->onlyFirstToString:Z

    if-eqz v7, :cond_3a

    .line 251
    const/4 v5, 0x1

    .line 255
    :cond_3a
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 256
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_40
    if-ge v3, v5, :cond_71

    .line 257
    if-lez v3, :cond_49

    .line 258
    iget-char v7, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->delimiter:C

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 260
    :cond_49
    if-nez v4, :cond_69

    invoke-static {p1, v3}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    .line 261
    .local v2, "element":Ljava/lang/Object;
    :goto_4f
    iget-object v8, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->elementConverter:Lorg/apache/commons/beanutils/Converter;

    sget-object v7, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$java$lang$String:Ljava/lang/Class;

    if-nez v7, :cond_6e

    const-string v7, "java.lang.String"

    invoke-static {v7}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$java$lang$String:Ljava/lang/Class;

    :goto_5d
    invoke-interface {v8, v7, v2}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 262
    if-eqz v2, :cond_66

    .line 263
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 256
    :cond_66
    add-int/lit8 v3, v3, 0x1

    goto :goto_40

    .line 260
    .end local v2    # "element":Ljava/lang/Object;
    :cond_69
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    goto :goto_4f

    .line 261
    .restart local v2    # "element":Ljava/lang/Object;
    :cond_6e
    sget-object v7, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_5d

    .line 267
    .end local v2    # "element":Ljava/lang/Object;
    :cond_71
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_24
.end method

.method protected convertToType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 281
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-nez v7, :cond_35

    .line 282
    new-instance v7, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {p0, v9}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, " cannot handle conversion to \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\' (not an array)."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 288
    :cond_35
    const/4 v6, 0x0

    .line 289
    .local v6, "size":I
    const/4 v4, 0x0

    .line 290
    .local v4, "iterator":Ljava/util/Iterator;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_62

    .line 291
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v6

    .line 299
    :goto_45
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 300
    .local v1, "componentType":Ljava/lang/Class;
    invoke-static {v1, v6}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v5

    .line 303
    .local v5, "newArray":Ljava/lang/Object;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_4e
    if-ge v3, v6, :cond_74

    .line 304
    if-nez v4, :cond_6f

    invoke-static {p2, v3}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    .line 307
    .local v2, "element":Ljava/lang/Object;
    :goto_56
    iget-object v7, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->elementConverter:Lorg/apache/commons/beanutils/Converter;

    invoke-interface {v7, v1, v2}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 308
    invoke-static {v5, v3, v2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 303
    add-int/lit8 v3, v3, 0x1

    goto :goto_4e

    .line 293
    .end local v1    # "componentType":Ljava/lang/Class;
    .end local v2    # "element":Ljava/lang/Object;
    .end local v3    # "i":I
    .end local v5    # "newArray":Ljava/lang/Object;
    :cond_62
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->convertToCollection(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 294
    .local v0, "collection":Ljava/util/Collection;
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v6

    .line 295
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    goto :goto_45

    .line 304
    .end local v0    # "collection":Ljava/util/Collection;
    .restart local v1    # "componentType":Ljava/lang/Class;
    .restart local v3    # "i":I
    .restart local v5    # "newArray":Ljava/lang/Object;
    :cond_6f
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    goto :goto_56

    .line 311
    :cond_74
    return-object v5
.end method

.method protected getDefault(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    const/4 v2, 0x0

    .line 367
    sget-object v1, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_15

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$java$lang$String:Ljava/lang/Class;

    :goto_d
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    move-object v0, v2

    .line 379
    :cond_14
    :goto_14
    return-object v0

    .line 367
    :cond_15
    sget-object v1, Lorg/apache/commons/beanutils/converters/ArrayConverter;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_d

    .line 371
    :cond_18
    invoke-super {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->getDefault(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 372
    .local v0, "defaultValue":Ljava/lang/Object;
    if-nez v0, :cond_20

    move-object v0, v2

    .line 373
    goto :goto_14

    .line 376
    :cond_20
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    .line 379
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    iget v2, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->defaultSize:I

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_14
.end method

.method protected getDefaultType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->defaultTypeInstance:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public setAllowedChars([C)V
    .registers 2
    .param p1, "allowedChars"    # [C

    .prologue
    .line 201
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->allowedChars:[C

    .line 202
    return-void
.end method

.method public setDelimiter(C)V
    .registers 2
    .param p1, "delimiter"    # C

    .prologue
    .line 191
    iput-char p1, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->delimiter:C

    .line 192
    return-void
.end method

.method public setOnlyFirstToString(Z)V
    .registers 2
    .param p1, "onlyFirstToString"    # Z

    .prologue
    .line 214
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->onlyFirstToString:Z

    .line 215
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 390
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 391
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 392
    const-string v1, "[UseDefault="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 393
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/ArrayConverter;->isUseDefault()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 394
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 395
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/ArrayConverter;->elementConverter:Lorg/apache/commons/beanutils/Converter;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 396
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 397
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
