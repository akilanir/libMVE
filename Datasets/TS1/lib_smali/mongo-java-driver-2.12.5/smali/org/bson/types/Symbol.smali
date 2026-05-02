.class public Lorg/bson/types/Symbol;
.super Ljava/lang/Object;
.source "Symbol.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1267daeb68224358L


# instance fields
.field private final _symbol:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/bson/types/Symbol;->_symbol:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 45
    if-ne p0, p1, :cond_5

    .line 61
    .end local p1    # "o":Ljava/lang/Object;
    :cond_4
    :goto_4
    return v1

    .line 46
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    goto :goto_4

    .line 49
    :cond_9
    instance-of v3, p1, Lorg/bson/types/Symbol;

    if-eqz v3, :cond_1f

    .line 50
    check-cast p1, Lorg/bson/types/Symbol;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v0, p1, Lorg/bson/types/Symbol;->_symbol:Ljava/lang/String;

    .line 59
    .local v0, "otherSymbol":Ljava/lang/String;
    :goto_11
    iget-object v3, p0, Lorg/bson/types/Symbol;->_symbol:Ljava/lang/String;

    if-eqz v3, :cond_29

    iget-object v3, p0, Lorg/bson/types/Symbol;->_symbol:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :goto_1d
    move v1, v2

    goto :goto_4

    .line 52
    .end local v0    # "otherSymbol":Ljava/lang/String;
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_1f
    instance-of v3, p1, Ljava/lang/String;

    if-eqz v3, :cond_27

    move-object v0, p1

    .line 53
    check-cast v0, Ljava/lang/String;

    .restart local v0    # "otherSymbol":Ljava/lang/String;
    goto :goto_11

    .end local v0    # "otherSymbol":Ljava/lang/String;
    :cond_27
    move v1, v2

    .line 56
    goto :goto_4

    .line 59
    .end local p1    # "o":Ljava/lang/Object;
    .restart local v0    # "otherSymbol":Ljava/lang/String;
    :cond_29
    if-eqz v0, :cond_4

    goto :goto_1d
.end method

.method public getSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lorg/bson/types/Symbol;->_symbol:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lorg/bson/types/Symbol;->_symbol:Ljava/lang/String;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/bson/types/Symbol;->_symbol:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lorg/bson/types/Symbol;->_symbol:Ljava/lang/String;

    return-object v0
.end method
