.class public Lorg/kore/kolab/notes/Color$DefaultImpl;
.super Ljava/lang/Object;
.source "Color.java"

# interfaces
.implements Lorg/kore/kolab/notes/Color;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/Color;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultImpl"
.end annotation


# instance fields
.field private final hexCode:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "hexCode"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/kore/kolab/notes/Color$DefaultImpl;->hexCode:Ljava/lang/String;

    .line 40
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 61
    if-nez p1, :cond_4

    .line 71
    :cond_3
    :goto_3
    return v1

    .line 64
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_3

    move-object v0, p1

    .line 67
    check-cast v0, Lorg/kore/kolab/notes/Color$DefaultImpl;

    .line 68
    .local v0, "other":Lorg/kore/kolab/notes/Color$DefaultImpl;
    iget-object v2, p0, Lorg/kore/kolab/notes/Color$DefaultImpl;->hexCode:Ljava/lang/String;

    if-nez v2, :cond_1b

    iget-object v2, v0, Lorg/kore/kolab/notes/Color$DefaultImpl;->hexCode:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 71
    :cond_19
    const/4 v1, 0x1

    goto :goto_3

    .line 68
    :cond_1b
    iget-object v2, p0, Lorg/kore/kolab/notes/Color$DefaultImpl;->hexCode:Ljava/lang/String;

    iget-object v3, v0, Lorg/kore/kolab/notes/Color$DefaultImpl;->hexCode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_19

    goto :goto_3
.end method

.method public getHexcode()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lorg/kore/kolab/notes/Color$DefaultImpl;->hexCode:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 54
    const/4 v0, 0x5

    .line 55
    .local v0, "hash":I
    iget-object v1, p0, Lorg/kore/kolab/notes/Color$DefaultImpl;->hexCode:Ljava/lang/String;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lorg/kore/kolab/notes/Color$DefaultImpl;->hexCode:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_b
    add-int/lit16 v0, v1, 0x1e5

    .line 56
    return v0

    .line 55
    :cond_e
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DefaultImpl{hexCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Color$DefaultImpl;->hexCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
