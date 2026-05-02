.class public abstract Ljavassist/bytecode/annotation/MemberValue;
.super Ljava/lang/Object;
.source "MemberValue.java"


# instance fields
.field cp:Ljavassist/bytecode/ConstPool;

.field tag:C


# direct methods
.method constructor <init>(CLjavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "tag"    # C
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p2, p0, Ljavassist/bytecode/annotation/MemberValue;->cp:Ljavassist/bytecode/ConstPool;

    .line 40
    iput-char p1, p0, Ljavassist/bytecode/annotation/MemberValue;->tag:C

    .line 41
    return-void
.end method

.method private static convertFromArray(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "classname"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 65
    const-string v3, "[]"

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 66
    .local v0, "index":I
    if-eq v0, v5, :cond_33

    .line 67
    invoke-virtual {p0, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, "rawType":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-static {v1}, Ljavassist/bytecode/Descriptor;->of(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 69
    .local v2, "sb":Ljava/lang/StringBuffer;
    :goto_17
    if-eq v0, v5, :cond_27

    .line 70
    const-string v3, "["

    invoke-virtual {v2, v6, v3}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 71
    const-string v3, "[]"

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_17

    .line 73
    :cond_27
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x2f

    const/16 v5, 0x2e

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 75
    .end local v1    # "rawType":Ljava/lang/String;
    .end local v2    # "sb":Ljava/lang/StringBuffer;
    .end local p0    # "classname":Ljava/lang/String;
    :cond_33
    return-object p0
.end method

.method static loadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;
    .registers 5
    .param p0, "cl"    # Ljava/lang/ClassLoader;
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljavassist/bytecode/annotation/NoSuchClassError;
        }
    .end annotation

    .prologue
    .line 56
    :try_start_0
    invoke-static {p1}, Ljavassist/bytecode/annotation/MemberValue;->convertFromArray(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_8
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_8} :catch_a

    move-result-object v1

    return-object v1

    .line 58
    :catch_a
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/LinkageError;
    new-instance v1, Ljavassist/bytecode/annotation/NoSuchClassError;

    invoke-direct {v1, p1, v0}, Ljavassist/bytecode/annotation/NoSuchClassError;-><init>(Ljava/lang/String;Ljava/lang/Error;)V

    throw v1
.end method


# virtual methods
.method public abstract accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
.end method

.method abstract getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation
.end method

.method abstract getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation
.end method

.method public abstract write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
