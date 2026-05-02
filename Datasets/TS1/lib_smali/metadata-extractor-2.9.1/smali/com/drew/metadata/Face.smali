.class public Lcom/drew/metadata/Face;
.super Ljava/lang/Object;
.source "Face.java"


# instance fields
.field private final _age:Lcom/drew/metadata/Age;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field

.field private final _height:I

.field private final _name:Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field

.field private final _width:I

.field private final _x:I

.field private final _y:I


# direct methods
.method public constructor <init>(IIIILjava/lang/String;Lcom/drew/metadata/Age;)V
    .registers 7
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "name"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .param p6, "age"    # Lcom/drew/metadata/Age;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput p1, p0, Lcom/drew/metadata/Face;->_x:I

    .line 49
    iput p2, p0, Lcom/drew/metadata/Face;->_y:I

    .line 50
    iput p3, p0, Lcom/drew/metadata/Face;->_width:I

    .line 51
    iput p4, p0, Lcom/drew/metadata/Face;->_height:I

    .line 52
    iput-object p5, p0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    .line 53
    iput-object p6, p0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    .line 54
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 91
    if-ne p0, p1, :cond_5

    .line 103
    :cond_4
    :goto_4
    return v1

    .line 92
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 94
    check-cast v0, Lcom/drew/metadata/Face;

    .line 96
    .local v0, "face":Lcom/drew/metadata/Face;
    iget v3, p0, Lcom/drew/metadata/Face;->_height:I

    iget v4, v0, Lcom/drew/metadata/Face;->_height:I

    if-eq v3, v4, :cond_1e

    move v1, v2

    goto :goto_4

    .line 97
    :cond_1e
    iget v3, p0, Lcom/drew/metadata/Face;->_width:I

    iget v4, v0, Lcom/drew/metadata/Face;->_width:I

    if-eq v3, v4, :cond_26

    move v1, v2

    goto :goto_4

    .line 98
    :cond_26
    iget v3, p0, Lcom/drew/metadata/Face;->_x:I

    iget v4, v0, Lcom/drew/metadata/Face;->_x:I

    if-eq v3, v4, :cond_2e

    move v1, v2

    goto :goto_4

    .line 99
    :cond_2e
    iget v3, p0, Lcom/drew/metadata/Face;->_y:I

    iget v4, v0, Lcom/drew/metadata/Face;->_y:I

    if-eq v3, v4, :cond_36

    move v1, v2

    goto :goto_4

    .line 100
    :cond_36
    iget-object v3, p0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    if-eqz v3, :cond_46

    iget-object v3, p0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    iget-object v4, v0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    invoke-virtual {v3, v4}, Lcom/drew/metadata/Age;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4a

    :cond_44
    move v1, v2

    goto :goto_4

    :cond_46
    iget-object v3, v0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    if-nez v3, :cond_44

    .line 101
    :cond_4a
    iget-object v3, p0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    if-eqz v3, :cond_5a

    iget-object v3, p0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    iget-object v4, v0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :goto_58
    move v1, v2

    goto :goto_4

    :cond_5a
    iget-object v3, v0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    if-eqz v3, :cond_4

    goto :goto_58
.end method

.method public getAge()Lcom/drew/metadata/Age;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    return-object v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 73
    iget v0, p0, Lcom/drew/metadata/Face;->_height:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 68
    iget v0, p0, Lcom/drew/metadata/Face;->_width:I

    return v0
.end method

.method public getX()I
    .registers 2

    .prologue
    .line 58
    iget v0, p0, Lcom/drew/metadata/Face;->_x:I

    return v0
.end method

.method public getY()I
    .registers 2

    .prologue
    .line 63
    iget v0, p0, Lcom/drew/metadata/Face;->_y:I

    return v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 109
    iget v0, p0, Lcom/drew/metadata/Face;->_x:I

    .line 110
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lcom/drew/metadata/Face;->_y:I

    add-int v0, v1, v3

    .line 111
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lcom/drew/metadata/Face;->_width:I

    add-int v0, v1, v3

    .line 112
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lcom/drew/metadata/Face;->_height:I

    add-int v0, v1, v3

    .line 113
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    if-eqz v1, :cond_32

    iget-object v1, p0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_21
    add-int v0, v3, v1

    .line 114
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    if-eqz v3, :cond_2f

    iget-object v2, p0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    invoke-virtual {v2}, Lcom/drew/metadata/Age;->hashCode()I

    move-result v2

    :cond_2f
    add-int v0, v1, v2

    .line 115
    return v0

    :cond_32
    move v1, v2

    .line 113
    goto :goto_21
.end method

.method public toString()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .local v0, "result":Ljava/lang/StringBuilder;
    const-string v1, "x: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/drew/metadata/Face;->_x:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    const-string v1, " y: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/drew/metadata/Face;->_y:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    const-string v1, " width: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/drew/metadata/Face;->_width:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    const-string v1, " height: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/drew/metadata/Face;->_height:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    iget-object v1, p0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    if-eqz v1, :cond_40

    .line 128
    const-string v1, " name: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/drew/metadata/Face;->_name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    :cond_40
    iget-object v1, p0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    if-eqz v1, :cond_53

    .line 130
    const-string v1, " age: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/drew/metadata/Face;->_age:Lcom/drew/metadata/Age;

    invoke-virtual {v2}, Lcom/drew/metadata/Age;->toFriendlyString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    :cond_53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
