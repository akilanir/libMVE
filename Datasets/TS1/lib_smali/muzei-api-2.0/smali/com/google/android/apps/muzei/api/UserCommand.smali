.class public Lcom/google/android/apps/muzei/api/UserCommand;
.super Ljava/lang/Object;
.source "UserCommand.java"


# instance fields
.field private mId:I

.field private mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput p1, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mId:I

    .line 35
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 3
    .param p1, "id"    # I
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput p1, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mId:I

    .line 42
    iput-object p2, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mTitle:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public static deserialize(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/UserCommand;
    .registers 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 87
    const/4 v1, -0x1

    .line 88
    .local v1, "id":I
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 89
    new-instance v3, Lcom/google/android/apps/muzei/api/UserCommand;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Lcom/google/android/apps/muzei/api/UserCommand;-><init>(ILjava/lang/String;)V

    .line 103
    :goto_e
    return-object v3

    .line 92
    :cond_f
    const-string v3, ":"

    const/4 v4, 0x2

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, "arr":[Ljava/lang/String;
    const/4 v3, 0x0

    :try_start_17
    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1c
    .catch Ljava/lang/NumberFormatException; {:try_start_17 .. :try_end_1c} :catch_29

    move-result v1

    .line 98
    :goto_1d
    const/4 v2, 0x0

    .line 99
    .local v2, "title":Ljava/lang/String;
    array-length v3, v0

    if-le v3, v5, :cond_23

    .line 100
    aget-object v2, v0, v5

    .line 103
    :cond_23
    new-instance v3, Lcom/google/android/apps/muzei/api/UserCommand;

    invoke-direct {v3, v1, v2}, Lcom/google/android/apps/muzei/api/UserCommand;-><init>(ILjava/lang/String;)V

    goto :goto_e

    .line 95
    .end local v2    # "title":Ljava/lang/String;
    :catch_29
    move-exception v3

    goto :goto_1d
.end method


# virtual methods
.method public getId()I
    .registers 2

    .prologue
    .line 49
    iget v0, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mId:I

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public serialize()Ljava/lang/String;
    .registers 4

    .prologue
    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mId:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mTitle:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_22

    const-string v0, ""

    :goto_19
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_19
.end method

.method public setId(I)V
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mId:I

    .line 57
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/UserCommand;->mTitle:Ljava/lang/String;

    .line 74
    return-void
.end method
