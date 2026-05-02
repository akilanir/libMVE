.class public final Lcom/jaredrummler/android/processes/models/Cgroup;
.super Lcom/jaredrummler/android/processes/models/ProcFile;
.source "Cgroup.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/jaredrummler/android/processes/models/Cgroup;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final groups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/jaredrummler/android/processes/models/ControlGroup;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 97
    new-instance v0, Lcom/jaredrummler/android/processes/models/Cgroup$1;

    invoke-direct {v0}, Lcom/jaredrummler/android/processes/models/Cgroup$1;-><init>()V

    sput-object v0, Lcom/jaredrummler/android/processes/models/Cgroup;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/ProcFile;-><init>(Landroid/os/Parcel;)V

    .line 77
    sget-object v0, Lcom/jaredrummler/android/processes/models/ControlGroup;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/jaredrummler/android/processes/models/Cgroup;->groups:Ljava/util/ArrayList;

    .line 78
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/jaredrummler/android/processes/models/Cgroup$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/jaredrummler/android/processes/models/Cgroup$1;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/Cgroup;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .registers 8
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/jaredrummler/android/processes/models/ProcFile;-><init>(Ljava/lang/String;)V

    .line 65
    iget-object v2, p0, Lcom/jaredrummler/android/processes/models/Cgroup;->content:Ljava/lang/String;

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "lines":[Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/jaredrummler/android/processes/models/Cgroup;->groups:Ljava/util/ArrayList;

    .line 67
    array-length v3, v1

    const/4 v2, 0x0

    :goto_14
    if-ge v2, v3, :cond_25

    aget-object v0, v1, v2

    .line 69
    .local v0, "line":Ljava/lang/String;
    :try_start_18
    iget-object v4, p0, Lcom/jaredrummler/android/processes/models/Cgroup;->groups:Ljava/util/ArrayList;

    new-instance v5, Lcom/jaredrummler/android/processes/models/ControlGroup;

    invoke-direct {v5, v0}, Lcom/jaredrummler/android/processes/models/ControlGroup;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_22} :catch_26

    .line 67
    :goto_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 73
    .end local v0    # "line":Ljava/lang/String;
    :cond_25
    return-void

    .line 70
    .restart local v0    # "line":Ljava/lang/String;
    :catch_26
    move-exception v4

    goto :goto_22
.end method

.method public static get(I)Lcom/jaredrummler/android/processes/models/Cgroup;
    .registers 6
    .param p0, "pid"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Lcom/jaredrummler/android/processes/models/Cgroup;

    const-string v1, "/proc/%d/cgroup"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/jaredrummler/android/processes/models/Cgroup;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getGroup(Ljava/lang/String;)Lcom/jaredrummler/android/processes/models/ControlGroup;
    .registers 9
    .param p1, "subsystem"    # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v3, p0, Lcom/jaredrummler/android/processes/models/Cgroup;->groups:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jaredrummler/android/processes/models/ControlGroup;

    .line 82
    .local v0, "group":Lcom/jaredrummler/android/processes/models/ControlGroup;
    iget-object v3, v0, Lcom/jaredrummler/android/processes/models/ControlGroup;->subsystems:Ljava/lang/String;

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 83
    .local v2, "systems":[Ljava/lang/String;
    array-length v5, v2

    const/4 v3, 0x0

    :goto_1c
    if-ge v3, v5, :cond_6

    aget-object v1, v2, v3

    .line 84
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_27

    .line 89
    .end local v0    # "group":Lcom/jaredrummler/android/processes/models/ControlGroup;
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "systems":[Ljava/lang/String;
    :goto_26
    return-object v0

    .line 83
    .restart local v0    # "group":Lcom/jaredrummler/android/processes/models/ControlGroup;
    .restart local v1    # "name":Ljava/lang/String;
    .restart local v2    # "systems":[Ljava/lang/String;
    :cond_27
    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    .line 89
    .end local v0    # "group":Lcom/jaredrummler/android/processes/models/ControlGroup;
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "systems":[Ljava/lang/String;
    :cond_2a
    const/4 v0, 0x0

    goto :goto_26
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 93
    invoke-super {p0, p1, p2}, Lcom/jaredrummler/android/processes/models/ProcFile;->writeToParcel(Landroid/os/Parcel;I)V

    .line 94
    iget-object v0, p0, Lcom/jaredrummler/android/processes/models/Cgroup;->groups:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 95
    return-void
.end method
