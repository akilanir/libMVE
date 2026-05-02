.class public abstract Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;
.super Ljava/lang/Object;
.source "AbstractArrayConverter.java"

# interfaces
.implements Lorg/apache/commons/beanutils/Converter;


# static fields
.field public static final NO_DEFAULT:Ljava/lang/Object;

.field protected static strings:[Ljava/lang/String;


# instance fields
.field protected defaultValue:Ljava/lang/Object;

.field protected useDefault:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 96
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->NO_DEFAULT:Ljava/lang/Object;

    .line 104
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->strings:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput-object v1, p0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 116
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->useDefault:Z

    .line 64
    iput-object v1, p0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->useDefault:Z

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 116
    iput-boolean v1, p0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->useDefault:Z

    .line 78
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->NO_DEFAULT:Ljava/lang/Object;

    if-ne p1, v0, :cond_11

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->useDefault:Z

    .line 85
    :goto_10
    return-void

    .line 81
    :cond_11
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->defaultValue:Ljava/lang/Object;

    .line 82
    iput-boolean v1, p0, Lorg/apache/commons/beanutils/converters/AbstractArrayConverter;->useDefault:Z

    goto :goto_10
.end method


# virtual methods
.method public abstract convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method protected parseElements(Ljava/lang/String;)Ljava/util/List;
    .registers 9
    .param p1, "svalue"    # Ljava/lang/String;

    .prologue
    .line 164
    if-nez p1, :cond_8

    .line 165
    new-instance v4, Ljava/lang/NullPointerException;

    invoke-direct {v4}, Ljava/lang/NullPointerException;-><init>()V

    throw v4

    .line 169
    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 170
    const-string v4, "{"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_27

    const-string v4, "}"

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 171
    const/4 v4, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 177
    :cond_27
    :try_start_27
    new-instance v2, Ljava/io/StreamTokenizer;

    new-instance v4, Ljava/io/StringReader;

    invoke-direct {v4, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v4}, Ljava/io/StreamTokenizer;-><init>(Ljava/io/Reader;)V

    .line 179
    .local v2, "st":Ljava/io/StreamTokenizer;
    const/16 v4, 0x2c

    const/16 v5, 0x2c

    invoke-virtual {v2, v4, v5}, Ljava/io/StreamTokenizer;->whitespaceChars(II)V

    .line 180
    const/16 v4, 0x30

    const/16 v5, 0x39

    invoke-virtual {v2, v4, v5}, Ljava/io/StreamTokenizer;->ordinaryChars(II)V

    .line 181
    const/16 v4, 0x2e

    const/16 v5, 0x2e

    invoke-virtual {v2, v4, v5}, Ljava/io/StreamTokenizer;->ordinaryChars(II)V

    .line 182
    const/16 v4, 0x2d

    const/16 v5, 0x2d

    invoke-virtual {v2, v4, v5}, Ljava/io/StreamTokenizer;->ordinaryChars(II)V

    .line 183
    const/16 v4, 0x30

    const/16 v5, 0x39

    invoke-virtual {v2, v4, v5}, Ljava/io/StreamTokenizer;->wordChars(II)V

    .line 184
    const/16 v4, 0x2e

    const/16 v5, 0x2e

    invoke-virtual {v2, v4, v5}, Ljava/io/StreamTokenizer;->wordChars(II)V

    .line 185
    const/16 v4, 0x2d

    const/16 v5, 0x2d

    invoke-virtual {v2, v4, v5}, Ljava/io/StreamTokenizer;->wordChars(II)V

    .line 188
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 190
    .local v1, "list":Ljava/util/ArrayList;
    :goto_67
    invoke-virtual {v2}, Ljava/io/StreamTokenizer;->nextToken()I

    move-result v3

    .line 191
    .local v3, "ttype":I
    const/4 v4, -0x3

    if-eq v3, v4, :cond_70

    if-lez v3, :cond_7d

    .line 193
    :cond_70
    iget-object v4, v2, Ljava/io/StreamTokenizer;->sval:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_75} :catch_76

    goto :goto_67

    .line 205
    .end local v1    # "list":Ljava/util/ArrayList;
    .end local v2    # "st":Ljava/io/StreamTokenizer;
    .end local v3    # "ttype":I
    :catch_76
    move-exception v0

    .line 207
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Lorg/apache/commons/beanutils/ConversionException;

    invoke-direct {v4, v0}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 194
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "list":Ljava/util/ArrayList;
    .restart local v2    # "st":Ljava/io/StreamTokenizer;
    .restart local v3    # "ttype":I
    :cond_7d
    const/4 v4, -0x1

    if-ne v3, v4, :cond_81

    .line 203
    return-object v1

    .line 197
    :cond_81
    :try_start_81
    new-instance v4, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Encountered token of type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_9a
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_9a} :catch_76
.end method
