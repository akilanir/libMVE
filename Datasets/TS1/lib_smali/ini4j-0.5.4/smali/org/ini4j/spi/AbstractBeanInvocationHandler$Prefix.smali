.class final enum Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
.super Ljava/lang/Enum;
.source "AbstractBeanInvocationHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/spi/AbstractBeanInvocationHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Prefix"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum ADD_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum ADD_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum HAS:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum READ:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum READ_BOOLEAN:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum REMOVE_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum REMOVE_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum WRITE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;


# instance fields
.field private _len:I

.field private _value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 42
    new-instance v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v1, "READ"

    const-string v2, "get"

    invoke-direct {v0, v1, v4, v2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->READ:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 43
    new-instance v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v1, "READ_BOOLEAN"

    const-string v2, "is"

    invoke-direct {v0, v1, v5, v2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->READ_BOOLEAN:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 44
    new-instance v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v1, "WRITE"

    const-string v2, "set"

    invoke-direct {v0, v1, v6, v2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->WRITE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 45
    new-instance v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v1, "ADD_CHANGE"

    const-string v2, "addPropertyChangeListener"

    invoke-direct {v0, v1, v7, v2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->ADD_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 46
    new-instance v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v1, "ADD_VETO"

    const-string v2, "addVetoableChangeListener"

    invoke-direct {v0, v1, v8, v2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->ADD_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 47
    new-instance v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v1, "REMOVE_CHANGE"

    const/4 v2, 0x5

    const-string v3, "removePropertyChangeListener"

    invoke-direct {v0, v1, v2, v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->REMOVE_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 48
    new-instance v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v1, "REMOVE_VETO"

    const/4 v2, 0x6

    const-string v3, "removeVetoableChangeListener"

    invoke-direct {v0, v1, v2, v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->REMOVE_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 49
    new-instance v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v1, "HAS"

    const/4 v2, 0x7

    const-string v3, "has"

    invoke-direct {v0, v1, v2, v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->HAS:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 40
    const/16 v0, 0x8

    new-array v0, v0, [Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    sget-object v1, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->READ:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    aput-object v1, v0, v4

    sget-object v1, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->READ_BOOLEAN:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    aput-object v1, v0, v5

    sget-object v1, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->WRITE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    aput-object v1, v0, v6

    sget-object v1, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->ADD_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    aput-object v1, v0, v7

    sget-object v1, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->ADD_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->REMOVE_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->REMOVE_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->HAS:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    aput-object v2, v0, v1

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->$VALUES:[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 5
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 55
    iput-object p3, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->_value:Ljava/lang/String;

    .line 56
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->_len:I

    .line 57
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    .registers 7
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 61
    const/4 v4, 0x0

    .line 63
    .local v4, "ret":Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    invoke-static {}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->values()[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    move-result-object v0

    .local v0, "arr$":[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_7
    if-ge v1, v2, :cond_16

    aget-object v3, v0, v1

    .line 65
    .local v3, "p":Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    invoke-virtual {v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 67
    move-object v4, v3

    .line 73
    .end local v3    # "p":Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    :cond_16
    return-object v4

    .line 63
    .restart local v3    # "p":Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 40
    const-class v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    return-object v0
.end method

.method public static values()[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    .registers 1

    .prologue
    .line 40
    sget-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->$VALUES:[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    invoke-virtual {v0}, [Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    return-object v0
.end method


# virtual methods
.method public getTail(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 78
    iget v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->_len:I

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/beans/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->_value:Ljava/lang/String;

    return-object v0
.end method
