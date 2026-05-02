.class abstract Lorg/apache/commons/compress/archivers/sevenz/CoderBase;
.super Ljava/lang/Object;
.source "CoderBase.java"


# static fields
.field private static final NONE:[B


# instance fields
.field private final acceptableOptions:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;->NONE:[B

    return-void
.end method

.method protected varargs constructor <init>([Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p1, "acceptableOptions":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;->acceptableOptions:[Ljava/lang/Class;

    .line 36
    return-void
.end method

.method protected static numberOptionOrDefault(Ljava/lang/Object;I)I
    .registers 3
    .param p0, "options"    # Ljava/lang/Object;
    .param p1, "defaultValue"    # I

    .prologue
    .line 83
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_a

    check-cast p0, Ljava/lang/Number;

    .end local p0    # "options":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p1

    .end local p1    # "defaultValue":I
    :cond_a
    return p1
.end method


# virtual methods
.method canAcceptOptions(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "opts"    # Ljava/lang/Object;

    .prologue
    .line 42
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;->acceptableOptions:[Ljava/lang/Class;

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_4
    if-ge v2, v3, :cond_13

    aget-object v1, v0, v2

    .line 43
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 44
    const/4 v4, 0x1

    .line 47
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_f
    return v4

    .line 42
    .restart local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 47
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    const/4 v4, 0x0

    goto :goto_f
.end method

.method abstract decode(Ljava/lang/String;Ljava/io/InputStream;JLorg/apache/commons/compress/archivers/sevenz/Coder;[B)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method encode(Ljava/io/OutputStream;Ljava/lang/Object;)Ljava/io/OutputStream;
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "options"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "method doesn\'t support writing"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getOptionsAsProperties(Ljava/lang/Object;)[B
    .registers 3
    .param p1, "options"    # Ljava/lang/Object;

    .prologue
    .line 54
    sget-object v0, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;->NONE:[B

    return-object v0
.end method

.method getOptionsFromCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 4
    .param p1, "coder"    # Lorg/apache/commons/compress/archivers/sevenz/Coder;
    .param p2, "in"    # Ljava/io/InputStream;

    .prologue
    .line 61
    const/4 v0, 0x0

    return-object v0
.end method
