.class public final Lcom/jaredrummler/android/processes/models/Status;
.super Lcom/jaredrummler/android/processes/models/ProcFile;
.source "Status.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/jaredrummler/android/processes/models/Status;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 194
    new-instance v0, Lcom/jaredrummler/android/processes/models/Status$1;

    invoke-direct {v0}, Lcom/jaredrummler/android/processes/models/Status$1;-><init>()V

    sput-object v0, Lcom/jaredrummler/android/processes/models/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 152
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/ProcFile;-><init>(Landroid/os/Parcel;)V

    .line 153
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/jaredrummler/android/processes/models/Status$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/jaredrummler/android/processes/models/Status$1;

    .prologue
    .line 132
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/Status;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/ProcFile;-><init>(Ljava/lang/String;)V

    .line 149
    return-void
.end method

.method public static get(I)Lcom/jaredrummler/android/processes/models/Status;
    .registers 6
    .param p0, "pid"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    new-instance v0, Lcom/jaredrummler/android/processes/models/Status;

    const-string v1, "/proc/%d/status"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/jaredrummler/android/processes/models/Status;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getGid()I
    .registers 4

    .prologue
    .line 188
    :try_start_0
    const-string v1, "Gid"

    invoke-virtual {p0, v1}, Lcom/jaredrummler/android/processes/models/Status;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\s+"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_14

    move-result v1

    .line 190
    :goto_13
    return v1

    .line 189
    :catch_14
    move-exception v0

    .line 190
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, -0x1

    goto :goto_13
.end method

.method public getUid()I
    .registers 4

    .prologue
    .line 177
    :try_start_0
    const-string v1, "Uid"

    invoke-virtual {p0, v1}, Lcom/jaredrummler/android/processes/models/Status;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\s+"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_14

    move-result v1

    .line 179
    :goto_13
    return v1

    .line 178
    :catch_14
    move-exception v0

    .line 179
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, -0x1

    goto :goto_13
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 163
    iget-object v2, p0, Lcom/jaredrummler/android/processes/models/Status;->content:Ljava/lang/String;

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 164
    .local v1, "lines":[Ljava/lang/String;
    array-length v3, v1

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v3, :cond_49

    aget-object v0, v1, v2

    .line 165
    .local v0, "line":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_46

    .line 166
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 169
    .end local v0    # "line":Ljava/lang/String;
    :goto_45
    return-object v2

    .line 164
    .restart local v0    # "line":Ljava/lang/String;
    :cond_46
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 169
    .end local v0    # "line":Ljava/lang/String;
    :cond_49
    const/4 v2, 0x0

    goto :goto_45
.end method
