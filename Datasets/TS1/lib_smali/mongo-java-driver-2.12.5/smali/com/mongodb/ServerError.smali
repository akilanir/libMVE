.class public Lcom/mongodb/ServerError;
.super Ljava/lang/Object;
.source "ServerError.java"


# instance fields
.field final _code:I

.field final _err:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/mongodb/DBObject;)V
    .registers 4
    .param p1, "o"    # Lcom/mongodb/DBObject;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/mongodb/ServerError;->getMsg(Lorg/bson/BSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerError;->_err:Ljava/lang/String;

    .line 30
    iget-object v0, p0, Lcom/mongodb/ServerError;->_err:Ljava/lang/String;

    if-nez v0, :cond_16

    .line 31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "need to have $err"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_16
    invoke-static {p1}, Lcom/mongodb/ServerError;->getCode(Lorg/bson/BSONObject;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ServerError;->_code:I

    .line 33
    return-void
.end method

.method static getCode(Lorg/bson/BSONObject;)I
    .registers 3
    .param p0, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 47
    const-string v1, "code"

    invoke-interface {p0, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 48
    .local v0, "c":Ljava/lang/Object;
    if-nez v0, :cond_e

    .line 49
    const-string v1, "$code"

    invoke-interface {p0, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 50
    :cond_e
    if-nez v0, :cond_16

    .line 51
    const-string v1, "assertionCode"

    invoke-interface {p0, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 53
    :cond_16
    if-nez v0, :cond_1a

    .line 54
    const/4 v1, -0x5

    .line 56
    .end local v0    # "c":Ljava/lang/Object;
    :goto_19
    return v1

    .restart local v0    # "c":Ljava/lang/Object;
    :cond_1a
    check-cast v0, Ljava/lang/Number;

    .end local v0    # "c":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v1

    goto :goto_19
.end method

.method static getMsg(Lorg/bson/BSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "o"    # Lorg/bson/BSONObject;
    .param p1, "def"    # Ljava/lang/String;

    .prologue
    .line 36
    const-string v1, "$err"

    invoke-interface {p0, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 37
    .local v0, "e":Ljava/lang/Object;
    if-nez v0, :cond_e

    .line 38
    const-string v1, "err"

    invoke-interface {p0, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 39
    :cond_e
    if-nez v0, :cond_16

    .line 40
    const-string v1, "errmsg"

    invoke-interface {p0, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 41
    :cond_16
    if-nez v0, :cond_19

    .line 43
    .end local p1    # "def":Ljava/lang/String;
    :goto_18
    return-object p1

    .restart local p1    # "def":Ljava/lang/String;
    :cond_19
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_18
.end method


# virtual methods
.method public getCode()I
    .registers 2

    .prologue
    .line 72
    iget v0, p0, Lcom/mongodb/ServerError;->_code:I

    return v0
.end method

.method public getError()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mongodb/ServerError;->_err:Ljava/lang/String;

    return-object v0
.end method

.method public isNotMasterError()Z
    .registers 3

    .prologue
    .line 80
    iget v0, p0, Lcom/mongodb/ServerError;->_code:I

    sparse-switch v0, :sswitch_data_10

    .line 90
    iget-object v0, p0, Lcom/mongodb/ServerError;->_err:Ljava/lang/String;

    const-string v1, "not master"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    :goto_d
    return v0

    .line 87
    :sswitch_e
    const/4 v0, 0x1

    goto :goto_d

    .line 80
    :sswitch_data_10
    .sparse-switch
        0x2746 -> :sswitch_e
        0x2748 -> :sswitch_e
        0x274a -> :sswitch_e
        0x277b -> :sswitch_e
        0x347b -> :sswitch_e
        0x347c -> :sswitch_e
    .end sparse-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 95
    iget v0, p0, Lcom/mongodb/ServerError;->_code:I

    if-lez v0, :cond_20

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/mongodb/ServerError;->_code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerError;->_err:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 97
    :goto_1f
    return-object v0

    :cond_20
    iget-object v0, p0, Lcom/mongodb/ServerError;->_err:Ljava/lang/String;

    goto :goto_1f
.end method
