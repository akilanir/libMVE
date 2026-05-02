.class public Lorg/apache/harmony/beans/BeansUtils;
.super Ljava/lang/Object;
.source "BeansUtils.java"


# static fields
.field public static final ADD:Ljava/lang/String; = "add"

.field public static final EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

.field private static final EQUALS_METHOD:Ljava/lang/String; = "equals"

.field private static final EQUALS_PARAMETERS:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final FORNAME:Ljava/lang/String; = "forName"

.field public static final GET:Ljava/lang/String; = "get"

.field public static final IS:Ljava/lang/String; = "is"

.field public static final NEW:Ljava/lang/String; = "new"

.field public static final NEWARRAY:Ljava/lang/String; = "newArray"

.field public static final NEWINSTANCE:Ljava/lang/String; = "newInstance"

.field public static final NULL:Ljava/lang/String; = "null"

.field public static final PUT:Ljava/lang/String; = "put"

.field public static final QUOTE:Ljava/lang/String; = "\"\""

.field public static final SET:Ljava/lang/String; = "set"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 25
    new-array v0, v2, [Ljava/lang/Object;

    sput-object v0, Lorg/apache/harmony/beans/BeansUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 96
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljava/lang/Object;

    aput-object v1, v0, v2

    sput-object v0, Lorg/apache/harmony/beans/BeansUtils;->EQUALS_PARAMETERS:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declaredEquals(Ljava/lang/Class;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_27

    aget-object v1, v0, v2

    .line 100
    .local v1, "declaredMethod":Ljava/lang/reflect/Method;
    const-string v4, "equals"

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    sget-object v5, Lorg/apache/harmony/beans/BeansUtils;->EQUALS_PARAMETERS:[Ljava/lang/Class;

    invoke-static {v4, v5}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 103
    const/4 v4, 0x1

    .line 106
    .end local v1    # "declaredMethod":Ljava/lang/reflect/Method;
    :goto_23
    return v4

    .line 99
    .restart local v1    # "declaredMethod":Ljava/lang/reflect/Method;
    :cond_24
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 106
    .end local v1    # "declaredMethod":Ljava/lang/reflect/Method;
    :cond_27
    const/4 v4, 0x0

    goto :goto_23
.end method

.method public static final getHashCode(Ljava/lang/Object;)I
    .registers 2
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 50
    if-eqz p0, :cond_7

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static final getHashCode(Z)I
    .registers 2
    .param p0, "bool"    # Z

    .prologue
    .line 54
    if-eqz p0, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static idOfClass(Ljava/lang/Class;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v2, p0

    .line 111
    .local v2, "theClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 114
    :cond_c
    const-string v3, "Array"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 116
    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-nez v3, :cond_c

    .line 118
    :cond_1b
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 119
    .local v0, "clazzName":Ljava/lang/String;
    const/16 v3, 0x2e

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 120
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static isPrimitiveWrapper(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "wrapper":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "base":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_8

    const-class v0, Ljava/lang/Boolean;

    if-eq p0, v0, :cond_40

    :cond_8
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_10

    const-class v0, Ljava/lang/Byte;

    if-eq p0, v0, :cond_40

    :cond_10
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_18

    const-class v0, Ljava/lang/Character;

    if-eq p0, v0, :cond_40

    :cond_18
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_20

    const-class v0, Ljava/lang/Short;

    if-eq p0, v0, :cond_40

    :cond_20
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_28

    const-class v0, Ljava/lang/Integer;

    if-eq p0, v0, :cond_40

    :cond_28
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_30

    const-class v0, Ljava/lang/Long;

    if-eq p0, v0, :cond_40

    :cond_30
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_38

    const-class v0, Ljava/lang/Float;

    if-eq p0, v0, :cond_40

    :cond_38
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_42

    const-class v0, Ljava/lang/Double;

    if-ne p0, v0, :cond_42

    :cond_40
    const/4 v0, 0x1

    :goto_41
    return v0

    :cond_42
    const/4 v0, 0x0

    goto :goto_41
.end method

.method public static toASCIILowerCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 59
    .local v0, "charArray":[C
    new-instance v2, Ljava/lang/StringBuilder;

    array-length v3, v0

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 60
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_b
    array-length v3, v0

    if-ge v1, v3, :cond_2b

    .line 61
    const/16 v3, 0x41

    aget-char v4, v0, v1

    if-gt v3, v4, :cond_25

    aget-char v3, v0, v1

    const/16 v4, 0x5a

    if-gt v3, v4, :cond_25

    .line 62
    aget-char v3, v0, v1

    add-int/lit8 v3, v3, 0x20

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 60
    :goto_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 64
    :cond_25
    aget-char v3, v0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 67
    :cond_2b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static toASCIIUpperCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 72
    .local v0, "charArray":[C
    new-instance v2, Ljava/lang/StringBuilder;

    array-length v3, v0

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 73
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_b
    array-length v3, v0

    if-ge v1, v3, :cond_2b

    .line 74
    const/16 v3, 0x61

    aget-char v4, v0, v1

    if-gt v3, v4, :cond_25

    aget-char v3, v0, v1

    const/16 v4, 0x7a

    if-gt v3, v4, :cond_25

    .line 75
    aget-char v3, v0, v1

    add-int/lit8 v3, v3, -0x20

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 73
    :goto_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 77
    :cond_25
    aget-char v3, v0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 80
    :cond_2b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
