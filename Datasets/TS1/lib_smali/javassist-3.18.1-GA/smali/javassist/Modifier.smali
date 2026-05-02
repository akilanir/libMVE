.class public Ljavassist/Modifier;
.super Ljava/lang/Object;
.source "Modifier.java"


# static fields
.field public static final ABSTRACT:I = 0x400

.field public static final ANNOTATION:I = 0x2000

.field public static final ENUM:I = 0x4000

.field public static final FINAL:I = 0x10

.field public static final INTERFACE:I = 0x200

.field public static final NATIVE:I = 0x100

.field public static final PRIVATE:I = 0x2

.field public static final PROTECTED:I = 0x4

.field public static final PUBLIC:I = 0x1

.field public static final STATIC:I = 0x8

.field public static final STRICT:I = 0x800

.field public static final SYNCHRONIZED:I = 0x20

.field public static final TRANSIENT:I = 0x80

.field public static final VARARGS:I = 0x80

.field public static final VOLATILE:I = 0x40


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clear(II)I
    .registers 3
    .param p0, "mod"    # I
    .param p1, "clearBit"    # I

    .prologue
    .line 207
    xor-int/lit8 v0, p1, -0x1

    and-int/2addr v0, p0

    return v0
.end method

.method public static isAbstract(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 161
    and-int/lit16 v0, p0, 0x400

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isAnnotation(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 143
    and-int/lit16 v0, p0, 0x2000

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isEnum(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 153
    and-int/lit16 v0, p0, 0x4000

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isFinal(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 93
    and-int/lit8 v0, p0, 0x10

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isInterface(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 133
    and-int/lit16 v0, p0, 0x200

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isNative(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 125
    and-int/lit16 v0, p0, 0x100

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isPackage(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 77
    and-int/lit8 v0, p0, 0x7

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isPrivate(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 61
    and-int/lit8 v0, p0, 0x2

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isProtected(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 69
    and-int/lit8 v0, p0, 0x4

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isPublic(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 53
    and-int/lit8 v0, p0, 0x1

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isStatic(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 85
    and-int/lit8 v0, p0, 0x8

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isStrict(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 169
    and-int/lit16 v0, p0, 0x800

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isSynchronized(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 101
    and-int/lit8 v0, p0, 0x20

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isTransient(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 117
    and-int/lit16 v0, p0, 0x80

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isVolatile(I)Z
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 109
    and-int/lit8 v0, p0, 0x40

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static setPackage(I)I
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 200
    and-int/lit8 v0, p0, -0x8

    return v0
.end method

.method public static setPrivate(I)I
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 193
    and-int/lit8 v0, p0, -0x6

    or-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public static setProtected(I)I
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 185
    and-int/lit8 v0, p0, -0x4

    or-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public static setPublic(I)I
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 177
    and-int/lit8 v0, p0, -0x7

    or-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static toString(I)Ljava/lang/String;
    .registers 2
    .param p0, "mod"    # I

    .prologue
    .line 217
    invoke-static {p0}, Ljava/lang/reflect/Modifier;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
