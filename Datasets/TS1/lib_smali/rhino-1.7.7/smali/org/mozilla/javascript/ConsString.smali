.class public Lorg/mozilla/javascript/ConsString;
.super Ljava/lang/Object;
.source "ConsString.java"

# interfaces
.implements Ljava/lang/CharSequence;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x750759072398571aL


# instance fields
.field private depth:I

.field private final length:I

.field private s1:Ljava/lang/CharSequence;

.field private s2:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .registers 5
    .param p1, "str1"    # Ljava/lang/CharSequence;
    .param p2, "str2"    # Ljava/lang/CharSequence;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/mozilla/javascript/ConsString;->s1:Ljava/lang/CharSequence;

    .line 37
    iput-object p2, p0, Lorg/mozilla/javascript/ConsString;->s2:Ljava/lang/CharSequence;

    .line 38
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/mozilla/javascript/ConsString;->length:I

    .line 39
    const/4 v0, 0x1

    iput v0, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    .line 40
    instance-of v0, p1, Lorg/mozilla/javascript/ConsString;

    if-eqz v0, :cond_22

    .line 41
    iget v0, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    check-cast p1, Lorg/mozilla/javascript/ConsString;

    .end local p1    # "str1":Ljava/lang/CharSequence;
    iget v1, p1, Lorg/mozilla/javascript/ConsString;->depth:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    .line 43
    :cond_22
    instance-of v0, p2, Lorg/mozilla/javascript/ConsString;

    if-eqz v0, :cond_2f

    .line 44
    iget v0, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    check-cast p2, Lorg/mozilla/javascript/ConsString;

    .end local p2    # "str2":Ljava/lang/CharSequence;
    iget v1, p2, Lorg/mozilla/javascript/ConsString;->depth:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    .line 47
    :cond_2f
    iget v0, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    const/16 v1, 0x7d0

    if-le v0, v1, :cond_38

    .line 48
    invoke-direct {p0}, Lorg/mozilla/javascript/ConsString;->flatten()Ljava/lang/String;

    .line 50
    :cond_38
    return-void
.end method

.method private static appendFragment(Ljava/lang/CharSequence;Ljava/lang/StringBuilder;)V
    .registers 3
    .param p0, "s"    # Ljava/lang/CharSequence;
    .param p1, "b"    # Ljava/lang/StringBuilder;

    .prologue
    .line 79
    instance-of v0, p0, Lorg/mozilla/javascript/ConsString;

    if-eqz v0, :cond_a

    .line 80
    check-cast p0, Lorg/mozilla/javascript/ConsString;

    .end local p0    # "s":Ljava/lang/CharSequence;
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ConsString;->appendTo(Ljava/lang/StringBuilder;)V

    .line 84
    :goto_9
    return-void

    .line 82
    .restart local p0    # "s":Ljava/lang/CharSequence;
    :cond_a
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_9
.end method

.method private declared-synchronized appendTo(Ljava/lang/StringBuilder;)V
    .registers 3
    .param p1, "b"    # Ljava/lang/StringBuilder;

    .prologue
    .line 74
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/mozilla/javascript/ConsString;->s1:Ljava/lang/CharSequence;

    invoke-static {v0, p1}, Lorg/mozilla/javascript/ConsString;->appendFragment(Ljava/lang/CharSequence;Ljava/lang/StringBuilder;)V

    .line 75
    iget-object v0, p0, Lorg/mozilla/javascript/ConsString;->s2:Ljava/lang/CharSequence;

    invoke-static {v0, p1}, Lorg/mozilla/javascript/ConsString;->appendFragment(Ljava/lang/CharSequence;Ljava/lang/StringBuilder;)V
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 76
    monitor-exit p0

    return-void

    .line 74
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized flatten()Ljava/lang/String;
    .registers 3

    .prologue
    .line 63
    monitor-enter p0

    :try_start_1
    iget v1, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    if-lez v1, :cond_1c

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/mozilla/javascript/ConsString;->length:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 65
    .local v0, "b":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/ConsString;->appendTo(Ljava/lang/StringBuilder;)V

    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/ConsString;->s1:Ljava/lang/CharSequence;

    .line 67
    const-string v1, ""

    iput-object v1, p0, Lorg/mozilla/javascript/ConsString;->s2:Ljava/lang/CharSequence;

    .line 68
    const/4 v1, 0x0

    iput v1, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    .line 70
    .end local v0    # "b":Ljava/lang/StringBuilder;
    :cond_1c
    iget-object v1, p0, Lorg/mozilla/javascript/ConsString;->s1:Ljava/lang/CharSequence;

    check-cast v1, Ljava/lang/String;
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_22

    monitor-exit p0

    return-object v1

    .line 63
    :catchall_22
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private writeReplace()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 54
    invoke-virtual {p0}, Lorg/mozilla/javascript/ConsString;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public charAt(I)C
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 91
    iget v1, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    if-nez v1, :cond_e

    iget-object v1, p0, Lorg/mozilla/javascript/ConsString;->s1:Ljava/lang/CharSequence;

    check-cast v1, Ljava/lang/String;

    move-object v0, v1

    .line 92
    .local v0, "str":Ljava/lang/String;
    :goto_9
    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    return v1

    .line 91
    .end local v0    # "str":Ljava/lang/String;
    :cond_e
    invoke-direct {p0}, Lorg/mozilla/javascript/ConsString;->flatten()Ljava/lang/String;

    move-result-object v0

    goto :goto_9
.end method

.method public length()I
    .registers 2

    .prologue
    .line 87
    iget v0, p0, Lorg/mozilla/javascript/ConsString;->length:I

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .registers 5
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 96
    iget v1, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    if-nez v1, :cond_e

    iget-object v1, p0, Lorg/mozilla/javascript/ConsString;->s1:Ljava/lang/CharSequence;

    check-cast v1, Ljava/lang/String;

    move-object v0, v1

    .line 97
    .local v0, "str":Ljava/lang/String;
    :goto_9
    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 96
    .end local v0    # "str":Ljava/lang/String;
    :cond_e
    invoke-direct {p0}, Lorg/mozilla/javascript/ConsString;->flatten()Ljava/lang/String;

    move-result-object v0

    goto :goto_9
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 59
    iget v0, p0, Lorg/mozilla/javascript/ConsString;->depth:I

    if-nez v0, :cond_9

    iget-object v0, p0, Lorg/mozilla/javascript/ConsString;->s1:Ljava/lang/CharSequence;

    check-cast v0, Ljava/lang/String;

    :goto_8
    return-object v0

    :cond_9
    invoke-direct {p0}, Lorg/mozilla/javascript/ConsString;->flatten()Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method
