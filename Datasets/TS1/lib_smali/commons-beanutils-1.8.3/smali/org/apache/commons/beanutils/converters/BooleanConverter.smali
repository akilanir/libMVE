.class public final Lorg/apache/commons/beanutils/converters/BooleanConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractConverter;
.source "BooleanConverter.java"


# static fields
.field public static final NO_DEFAULT:Ljava/lang/Object;

.field static class$java$lang$Boolean:Ljava/lang/Class;


# instance fields
.field private falseStrings:[Ljava/lang/String;

.field private trueStrings:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 157
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->NO_DEFAULT:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 8

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 67
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 165
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "true"

    aput-object v1, v0, v2

    const-string v1, "yes"

    aput-object v1, v0, v3

    const-string v1, "y"

    aput-object v1, v0, v4

    const-string v1, "on"

    aput-object v1, v0, v5

    const-string v1, "1"

    aput-object v1, v0, v6

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->trueStrings:[Ljava/lang/String;

    .line 170
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "false"

    aput-object v1, v0, v2

    const-string v1, "no"

    aput-object v1, v0, v3

    const-string v1, "n"

    aput-object v1, v0, v4

    const-string v1, "off"

    aput-object v1, v0, v5

    const-string v1, "0"

    aput-object v1, v0, v6

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->falseStrings:[Ljava/lang/String;

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 9
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 84
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 165
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "true"

    aput-object v1, v0, v2

    const-string v1, "yes"

    aput-object v1, v0, v3

    const-string v1, "y"

    aput-object v1, v0, v4

    const-string v1, "on"

    aput-object v1, v0, v5

    const-string v1, "1"

    aput-object v1, v0, v6

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->trueStrings:[Ljava/lang/String;

    .line 170
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "false"

    aput-object v1, v0, v2

    const-string v1, "no"

    aput-object v1, v0, v3

    const-string v1, "n"

    aput-object v1, v0, v4

    const-string v1, "off"

    aput-object v1, v0, v5

    const-string v1, "0"

    aput-object v1, v0, v6

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->falseStrings:[Ljava/lang/String;

    .line 85
    sget-object v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->NO_DEFAULT:Ljava/lang/Object;

    if-eq p1, v0, :cond_41

    .line 86
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/BooleanConverter;->setDefaultValue(Ljava/lang/Object;)V

    .line 88
    :cond_41
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;[Ljava/lang/String;)V
    .registers 10
    .param p1, "trueStrings"    # [Ljava/lang/String;
    .param p2, "falseStrings"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 108
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 165
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "true"

    aput-object v1, v0, v2

    const-string v1, "yes"

    aput-object v1, v0, v3

    const-string v1, "y"

    aput-object v1, v0, v4

    const-string v1, "on"

    aput-object v1, v0, v5

    const-string v1, "1"

    aput-object v1, v0, v6

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->trueStrings:[Ljava/lang/String;

    .line 170
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "false"

    aput-object v1, v0, v2

    const-string v1, "no"

    aput-object v1, v0, v3

    const-string v1, "n"

    aput-object v1, v0, v4

    const-string v1, "off"

    aput-object v1, v0, v5

    const-string v1, "0"

    aput-object v1, v0, v6

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->falseStrings:[Ljava/lang/String;

    .line 109
    invoke-static {p1}, Lorg/apache/commons/beanutils/converters/BooleanConverter;->copyStrings([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->trueStrings:[Ljava/lang/String;

    .line 110
    invoke-static {p2}, Lorg/apache/commons/beanutils/converters/BooleanConverter;->copyStrings([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->falseStrings:[Ljava/lang/String;

    .line 111
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Object;)V
    .registers 11
    .param p1, "trueStrings"    # [Ljava/lang/String;
    .param p2, "falseStrings"    # [Ljava/lang/String;
    .param p3, "defaultValue"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 138
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 165
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "true"

    aput-object v1, v0, v2

    const-string v1, "yes"

    aput-object v1, v0, v3

    const-string v1, "y"

    aput-object v1, v0, v4

    const-string v1, "on"

    aput-object v1, v0, v5

    const-string v1, "1"

    aput-object v1, v0, v6

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->trueStrings:[Ljava/lang/String;

    .line 170
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "false"

    aput-object v1, v0, v2

    const-string v1, "no"

    aput-object v1, v0, v3

    const-string v1, "n"

    aput-object v1, v0, v4

    const-string v1, "off"

    aput-object v1, v0, v5

    const-string v1, "0"

    aput-object v1, v0, v6

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->falseStrings:[Ljava/lang/String;

    .line 139
    invoke-static {p1}, Lorg/apache/commons/beanutils/converters/BooleanConverter;->copyStrings([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->trueStrings:[Ljava/lang/String;

    .line 140
    invoke-static {p2}, Lorg/apache/commons/beanutils/converters/BooleanConverter;->copyStrings([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->falseStrings:[Ljava/lang/String;

    .line 141
    sget-object v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->NO_DEFAULT:Ljava/lang/Object;

    if-eq p3, v0, :cond_4d

    .line 142
    invoke-virtual {p0, p3}, Lorg/apache/commons/beanutils/converters/BooleanConverter;->setDefaultValue(Ljava/lang/Object;)V

    .line 144
    :cond_4d
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 181
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

.method private static copyStrings([Ljava/lang/String;)[Ljava/lang/String;
    .registers 4
    .param p0, "src"    # [Ljava/lang/String;

    .prologue
    .line 235
    array-length v2, p0

    new-array v0, v2, [Ljava/lang/String;

    .line 236
    .local v0, "dst":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    array-length v2, p0

    if-ge v1, v2, :cond_12

    .line 237
    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 236
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 239
    :cond_12
    return-object v0
.end method


# virtual methods
.method protected convertToType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 209
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 211
    .local v1, "stringValue":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->trueStrings:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_1e

    .line 212
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->trueStrings:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 213
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 219
    :goto_1a
    return-object v2

    .line 211
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 217
    :cond_1e
    const/4 v0, 0x0

    :goto_1f
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->falseStrings:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_34

    .line 218
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->falseStrings:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    .line 219
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_1a

    .line 217
    :cond_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 223
    :cond_34
    new-instance v2, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Can\'t convert value \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' to a Boolean"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected getDefaultType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 181
    sget-object v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v0, :cond_d

    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/BooleanConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_c
.end method
