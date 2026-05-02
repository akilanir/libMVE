.class public Lcom/jaredrummler/android/processes/models/AndroidProcess;
.super Ljava/lang/Object;
.source "AndroidProcess.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/jaredrummler/android/processes/models/AndroidProcess;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final name:Ljava/lang/String;

.field public final pid:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 596
    new-instance v0, Lcom/jaredrummler/android/processes/models/AndroidProcess$1;

    invoke-direct {v0}, Lcom/jaredrummler/android/processes/models/AndroidProcess$1;-><init>()V

    sput-object v0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "pid"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput p1, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->pid:I

    .line 65
    invoke-static {p1}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->getProcessName(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    .line 66
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 591
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 592
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    .line 593
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->pid:I

    .line 594
    return-void
.end method

.method static getProcessName(I)Ljava/lang/String;
    .registers 6
    .param p0, "pid"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    .line 40
    .local v0, "cmdline":Ljava/lang/String;
    :try_start_1
    const-string v1, "/proc/%d/cmdline"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/jaredrummler/android/processes/models/ProcFile;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_18} :catch_28

    move-result-object v0

    .line 43
    :goto_19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 44
    invoke-static {p0}, Lcom/jaredrummler/android/processes/models/Stat;->get(I)Lcom/jaredrummler/android/processes/models/Stat;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jaredrummler/android/processes/models/Stat;->getComm()Ljava/lang/String;

    move-result-object v0

    .line 46
    .end local v0    # "cmdline":Ljava/lang/String;
    :cond_27
    return-object v0

    .line 41
    .restart local v0    # "cmdline":Ljava/lang/String;
    :catch_28
    move-exception v1

    goto :goto_19
.end method


# virtual methods
.method public attr_current()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    const-string v0, "attr/current"

    invoke-virtual {p0, v0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public cgroup()Lcom/jaredrummler/android/processes/models/Cgroup;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    iget v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->pid:I

    invoke-static {v0}, Lcom/jaredrummler/android/processes/models/Cgroup;->get(I)Lcom/jaredrummler/android/processes/models/Cgroup;

    move-result-object v0

    return-object v0
.end method

.method public cmdline()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    const-string v0, "cmdline"

    invoke-virtual {p0, v0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 583
    const/4 v0, 0x0

    return v0
.end method

.method public oom_adj()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 173
    const-string v0, "oom_adj"

    invoke-virtual {p0, v0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public oom_score_adj()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    const-string v0, "oom_score_adj"

    invoke-virtual {p0, v0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public read(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const-string v0, "/proc/%d/%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->pid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/jaredrummler/android/processes/models/ProcFile;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public stat()Lcom/jaredrummler/android/processes/models/Stat;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 423
    iget v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->pid:I

    invoke-static {v0}, Lcom/jaredrummler/android/processes/models/Stat;->get(I)Lcom/jaredrummler/android/processes/models/Stat;

    move-result-object v0

    return-object v0
.end method

.method public statm()Lcom/jaredrummler/android/processes/models/Statm;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 446
    iget v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->pid:I

    invoke-static {v0}, Lcom/jaredrummler/android/processes/models/Statm;->get(I)Lcom/jaredrummler/android/processes/models/Statm;

    move-result-object v0

    return-object v0
.end method

.method public status()Lcom/jaredrummler/android/processes/models/Status;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 568
    iget v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->pid:I

    invoke-static {v0}, Lcom/jaredrummler/android/processes/models/Status;->get(I)Lcom/jaredrummler/android/processes/models/Status;

    move-result-object v0

    return-object v0
.end method

.method public wchan()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 579
    const-string v0, "wchan"

    invoke-virtual {p0, v0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 587
    iget-object v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 588
    iget v0, p0, Lcom/jaredrummler/android/processes/models/AndroidProcess;->pid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 589
    return-void
.end method
