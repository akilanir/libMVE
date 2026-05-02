.class public Lcom/jaredrummler/android/processes/models/AndroidAppProcess;
.super Lcom/jaredrummler/android/processes/models/AndroidProcess;
.source "AndroidAppProcess.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/jaredrummler/android/processes/models/AndroidAppProcess;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final cgroup:Lcom/jaredrummler/android/processes/models/Cgroup;

.field public foreground:Z

.field public uid:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 100
    new-instance v0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$1;

    invoke-direct {v0}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$1;-><init>()V

    sput-object v0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 8
    .param p1, "pid"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 38
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/AndroidProcess;-><init>(I)V

    .line 39
    invoke-super {p0}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->cgroup()Lcom/jaredrummler/android/processes/models/Cgroup;

    move-result-object v4

    iput-object v4, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->cgroup:Lcom/jaredrummler/android/processes/models/Cgroup;

    .line 40
    iget-object v4, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->cgroup:Lcom/jaredrummler/android/processes/models/Cgroup;

    const-string v5, "cpuacct"

    invoke-virtual {v4, v5}, Lcom/jaredrummler/android/processes/models/Cgroup;->getGroup(Ljava/lang/String;)Lcom/jaredrummler/android/processes/models/ControlGroup;

    move-result-object v1

    .line 41
    .local v1, "cpuacct":Lcom/jaredrummler/android/processes/models/ControlGroup;
    iget-object v4, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->cgroup:Lcom/jaredrummler/android/processes/models/Cgroup;

    const-string v5, "cpu"

    invoke-virtual {v4, v5}, Lcom/jaredrummler/android/processes/models/Cgroup;->getGroup(Ljava/lang/String;)Lcom/jaredrummler/android/processes/models/ControlGroup;

    move-result-object v0

    .line 42
    .local v0, "cpu":Lcom/jaredrummler/android/processes/models/ControlGroup;
    if-eqz v0, :cond_28

    if-eqz v1, :cond_28

    iget-object v4, v1, Lcom/jaredrummler/android/processes/models/ControlGroup;->group:Ljava/lang/String;

    const-string v5, "pid_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2e

    .line 43
    :cond_28
    new-instance v3, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;

    invoke-direct {v3, p1}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException;-><init>(I)V

    throw v3

    .line 45
    :cond_2e
    iget-object v4, v0, Lcom/jaredrummler/android/processes/models/ControlGroup;->group:Ljava/lang/String;

    const-string v5, "bg_non_interactive"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_54

    :goto_38
    iput-boolean v3, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->foreground:Z

    .line 47
    :try_start_3a
    iget-object v3, v1, Lcom/jaredrummler/android/processes/models/ControlGroup;->group:Ljava/lang/String;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aget-object v3, v3, v4

    const-string v4, "uid_"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->uid:I
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_53} :catch_56

    .line 51
    :goto_53
    return-void

    .line 45
    :cond_54
    const/4 v3, 0x0

    goto :goto_38

    .line 48
    :catch_56
    move-exception v2

    .line 49
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->status()Lcom/jaredrummler/android/processes/models/Status;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jaredrummler/android/processes/models/Status;->getUid()I

    move-result v3

    iput v3, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->uid:I

    goto :goto_53
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/AndroidProcess;-><init>(Landroid/os/Parcel;)V

    .line 96
    const-class v0, Lcom/jaredrummler/android/processes/models/Cgroup;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/jaredrummler/android/processes/models/Cgroup;

    iput-object v0, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->cgroup:Lcom/jaredrummler/android/processes/models/Cgroup;

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v0, 0x1

    :goto_18
    iput-boolean v0, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->foreground:Z

    .line 98
    return-void

    .line 97
    :cond_1b
    const/4 v0, 0x0

    goto :goto_18
.end method


# virtual methods
.method public cgroup()Lcom/jaredrummler/android/processes/models/Cgroup;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->cgroup:Lcom/jaredrummler/android/processes/models/Cgroup;

    return-object v0
.end method

.method public getPackageInfo(Landroid/content/Context;I)Landroid/content/pm/PackageInfo;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 58
    iget-object v0, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->name:Ljava/lang/String;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 89
    invoke-super {p0, p1, p2}, Lcom/jaredrummler/android/processes/models/AndroidProcess;->writeToParcel(Landroid/os/Parcel;I)V

    .line 90
    iget-object v0, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->cgroup:Lcom/jaredrummler/android/processes/models/Cgroup;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 91
    iget-boolean v0, p0, Lcom/jaredrummler/android/processes/models/AndroidAppProcess;->foreground:Z

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_d
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 92
    return-void

    .line 91
    :cond_12
    const/4 v0, 0x0

    goto :goto_d
.end method
