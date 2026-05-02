.class Lcom/wutka/dtd/TokenType;
.super Ljava/lang/Object;
.source "TokenType.java"


# instance fields
.field public name:Ljava/lang/String;

.field public value:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 3
    .param p1, "aValue"    # I
    .param p2, "aName"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lcom/wutka/dtd/TokenType;->value:I

    .line 16
    iput-object p2, p0, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    .line 17
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 21
    if-ne p0, p1, :cond_5

    .line 26
    :cond_4
    :goto_4
    return v1

    .line 22
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/TokenType;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 24
    check-cast v0, Lcom/wutka/dtd/TokenType;

    .line 25
    .local v0, "other":Lcom/wutka/dtd/TokenType;
    iget v3, v0, Lcom/wutka/dtd/TokenType;->value:I

    iget v4, p0, Lcom/wutka/dtd/TokenType;->value:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 26
    goto :goto_4
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
